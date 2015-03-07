setwd("~/Getting and cleaning data/Project_1")
library(base)
data <- read.table("household_power_consumption.txt", header=T, sep=';', na.strings="?",
                   check.names=F, stringsAsFactors=F, comment.char="", quote='\"')
data$Date <- as.Date(data$Date, format="%d/%m/%Y")

## create the subset of data
subdata <- subset(data, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))
rm(data) #remove the data

# convert time
datetime <- paste(as.Date(subdata$Date), subdata$Time)
subdata$Datetime <- as.POSIXct(datetime)

# create the plot
png(file="plot4.png", height=480, width=480)
par(mfcol = c(2, 2))
    plot(subdata$Global_active_power~subdata$Datetime, type="l",
         ylab="Global Active Power (kilowatts)", xlab="")
       
    plot(subdata$Sub_metering_1~subdata$Datetime, type="l",
           ylab="Energy sub metering", xlab="")
      lines(subdata$Sub_metering_2~subdata$Datetime,col='Red')
      lines(subdata$Sub_metering_3~subdata$Datetime,col='Blue')
    
    legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2,
           legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
    
    plot(subdata$Voltage~subdata$Datetime, type="l",
         ylab="Voltage ", xlab="datetime")
    
    plot(subdata$Global_reactive_power~subdata$Datetime, type="l",
         ylab="Global_Rective_Power", xlab="datetime")
    
dev.off()
    
