# Read in the data
# Due to filesize being 133Mb, the datafile has not been included 
# in the git repo. You can download this data from 
# https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip.

airData<-read.table("data/household_power_consumption.txt", sep=";", header=TRUE, stringsAsFactors=FALSE, na.strings = "?")
airData$Date<-as.Date(airData$Date, format="%d/%m/%Y")
airData$Time<-strptime(airData$Time, "%H:%M:%S")
airData<-subset(airData, Date>="2007-02-01" & Date<= "2007-02-02")

hist(airData$Global_active_power, main="Global Active Power", 
        xlab="Global Active Power (kilowatts)", ylab="Frequency", col="Red")