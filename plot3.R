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

##generating the common y axis range
yrange<-range(hpc[,"Sub_metering_1"],hpc[,"Sub_metering_2"],hpc[,"Sub_metering_3"])

##generating the required plot
png(file="./plot3.png",width=480,height=480)
with(hpc,plot(sort(dt),hpc[,"Sub_metering_1"],type="l",col="Black",ylim=yrange,ylab="Energy sub metering",xlab=""))
par(new=T)
with(hpc,plot(sort(dt),hpc[,"Sub_metering_2"],type="l",col="Red",ylim=yrange,ylab="Energy sub metering",xlab=""))
par(new=T)
with(hpc,plot(sort(dt),hpc[,"Sub_metering_3"],type="l",col="Blue",ylim=yrange,ylab="Energy sub metering",xlab=""))
legend("topright",legend=colnames(hpc[1,7:9]),pch="______________",col=c("Black","Red","Blue"))
dev.off()
