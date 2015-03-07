setwd("~/Getting and cleaning data/Project_1")
library(base)
data <- read.table("household_power_consumption.txt", header=T, sep=';', na.strings="?",
                    check.names=F, stringsAsFactors=F, comment.char="", quote='\"')
data$Date <- as.Date(data$Date, format="%d/%m/%Y")

## Creating the subset of data
subdata <- subset(data, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))
rm(data) #remove the data

# convert time
datetime <- paste(as.Date(subdata$Date), subdata$Time)
subdata$Datetime <- as.POSIXct(datetime)

png(file="plot1.png", height=480, width=480)
hist(subdata$Global_active_power, main="Global Active Power",
     xlab="Global Active Power (kilowatts)", col="Red")

dev.off()