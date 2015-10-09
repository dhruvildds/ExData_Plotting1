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
png("./plot4.png",width=2*480,height=2*480)
par(mfrow=c(2,2))
with(b,plot(sort(dt),b[,3],type="l",xlab="",ylab="Global Active Power (kilowatts)"))
with(b,plot(sort(dt),Voltage,xlab="datetime",ylab="Voltage",type="l"))
with(b,plot(sort(dt),b[,7],type="l",col="Black",ylim=yrange,ylab="Energy sub metering",xlab=""))
par(new=T)
with(b,plot(sort(dt),b[,8],type="l",col="Red",ylim=yrange,ylab="Energy sub metering",xlab=""))
par(new=T)
with(b,plot(sort(dt),b[,9],type="l",col="Blue",ylim=yrange,ylab="Energy sub metering",xlab=""))
legend("topright",legend=colnames(b[1,7:9]),pch="______________",col=c("Black","Red","Blue"))
with(b,plot(sort(dt),b[,4],xlab="datetime",ylab="Global Reactive Power",type="l"))
dev.off()