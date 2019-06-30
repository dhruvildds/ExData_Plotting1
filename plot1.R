##reading the data
hpc<-read.table("./household_power_consumption.txt",sep=";",header=TRUE,na.strings="?",stringsAsFactors =FALSE )

##converting character to date
hpc$Date<-as.Date(hpc$Date,"%d/%m/%Y")

##subsetting the from the two days of februrary
hpc<-hpc[which(hpc$Date==as.Date("2007-02-01","%Y-%m-%d") | hpc$Date==as.Date("2007-02-02","%Y-%m-%d")),]


hpc$Global_active_power<-as.numeric(hpc$Global_active_power)

##generating the required plot
png(file="D:\\OneDrive - Infosys Limited\\users\\Desktop\\cera\\jhu-data-science\\exploratory-data-analysis\\Week_1_assignment\\ExData_Plotting1\\plot1.png",width=480,height=480)
hist(hpc[,"Global_active_power"],xlab="Global Active Power (kilowatts)", ylab="Frequency",main="Global Active Power",col="Red")
dev.off()
