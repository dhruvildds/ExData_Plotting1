##reading the data
hpc<-read.table("./household_power_consumption.txt",sep=";",header=TRUE,na.strings="?",stringsAsFactors =FALSE )

##converting character to date
hpc$Date<-as.Date(hpc$Date,"%d/%m/%Y")

##subsetting the from the two days of februrary
hpc<-hpc[which(hpc$Date==as.Date("2007-02-01","%Y-%m-%d") | hpc$Date==as.Date("2007-02-02","%Y-%m-%d")),]

##combining date and time into a single column to generate the dt which will act as
##a unique identifier varible
hpc$dt<-paste(hpc$Date,hpc$Time,sep=" ")

##converting the charater date time dt to the standard format
hpc$dt<-as.POSIXlt(hpc$dt,format="%Y-%m-%d %H:%M:%S")

##generating the required plot
png(file="./plot2.png",width=480,height=480)
with(hpc,plot(sort(hpc$dt),hpc[,"Global_active_power"],type="l",xlab="",ylab="Global Reactive Power (kilowatts)"))
dev.off()
