##reading the data
a<-read.table("./household_power_consumption.txt",sep=";",header=TRUE,na.strings="?",stringsAsFactors =FALSE )

##converting character to date
a$Date<-as.Date(a$Date,"%d/%m/%Y")

##subsetting the from the two days of februrary
b<-a[which(a$Date==as.Date("2007-02-01","%Y-%m-%d") | a$Date==as.Date("2007-02-02","%Y-%m-%d")),]

##generating the required plot
png(file="./plot1.png",width=480,height=480)
hist(b[,3],xlab="Global Active Power (kilowatts)", ylab="Frequency",main="Global Active Power",col="Red")
dev.off()