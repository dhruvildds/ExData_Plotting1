##reading the data
a<-read.table("./household_power_consumption.txt",sep=";",header=TRUE,na.strings="?",stringsAsFactors =FALSE )

##converting character to date
a$Date<-as.Date(a$Date,"%d/%m/%Y")

##subsetting the from the two days of februrary
b<-a[which(a$Date==as.Date("2007-02-01","%Y-%m-%d") | a$Date==as.Date("2007-02-02","%Y-%m-%d")),]

##combining date and time into a single column to generate the dt which will act as
##a unique identifier varible
b$dt<-paste(b$Date,b$Time,sep=" ")

##converting the charater date time dt to the standard format
b$dt<-as.POSIXlt(b$dt,format="%Y-%m-%d %H:%M:%S")

##generating the required plot
png(file="./plot2.png",width=480,height=480)
with(b,plot(sort(dt),b[,3],type="l",xlab="",ylab="Global Reactive Power (kilowatts)"))
dev.off()