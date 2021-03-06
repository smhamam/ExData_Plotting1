tab5rows <- read.table("household_power_consumption.txt",sep=";", header = TRUE, nrows = 5)
classes <- sapply(tab5rows, class)
alldata<-read.table("household_power_consumption.txt",sep=";", header = TRUE, colClasses = classes,na.strings = "?")
alldata$DateTime <- strptime(paste(alldata$Date, alldata$Time), "%d/%m/%Y %H:%M:%S")
data<-subset(alldata,DateTime>=strptime("2007-02-01 00:00:00", "%Y-%m-%d %H:%M:%S")&DateTime<strptime("2007-02-03 00:00:00", "%Y-%m-%d %H:%M:%S"))
library(datasets)

png(filename = "plot3.png",width = 480, height = 480, units = "px")
plot(data$DateTime,data$Sub_metering_1,type="l",ylab="Energy sub metering",xlab="",col="black")
lines(data$DateTime,data$Sub_metering_2,col ="red",type = 'l')
lines(data$DateTime,data$Sub_metering_3,col ="blue",type = 'l')
legend("topright", col = c("black","red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2","Sub_metering_3"),lty=c(1,1,1))
dev.off()
