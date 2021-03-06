tab5rows <- read.table("household_power_consumption.txt",sep=";", header = TRUE, nrows = 5)
classes <- sapply(tab5rows, class)
alldata<-read.table("household_power_consumption.txt",sep=";", header = TRUE, colClasses = classes,na.strings = "?")
alldata$DateTime <- strptime(paste(alldata$Date, alldata$Time), "%d/%m/%Y %H:%M:%S")
data<-subset(alldata,DateTime>=strptime("2007-02-01 00:00:00", "%Y-%m-%d %H:%M:%S")&DateTime<strptime("2007-02-03 00:00:00", "%Y-%m-%d %H:%M:%S"))
library(datasets)

png(filename = "plot1.png",width = 480, height = 480, units = "px")
hist(data$Global_active_power,col = "red",main= "Global Active Power",xlab="Global Active Power (kilowatts)")
dev.off()
