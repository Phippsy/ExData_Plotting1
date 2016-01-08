# Due to filesize being 133Mb, the datafile has not been included 
# in the git repo. 
# To re-run this fil, you can download this data from 
# https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip.
# The text file must be unzipped to a folder - "data" - in the working directory.

# Read in the data & convert date / time
airData<-read.table("data/household_power_consumption.txt", sep=";", header=TRUE, stringsAsFactors=FALSE, na.strings = "?")
airData$Date<-as.Date(airData$Date, format="%d/%m/%Y")
airData<-subset(airData, Date>="2007-02-01" & Date<= "2007-02-02")
airData$Time<-strptime(airData$Time, "%H:%M:%S")
airData$dateTime<-as.POSIXct(paste(airData$Date, airData$Time), format="%Y-%m-%d %H:%M:%S")

# Export plot to png
png(filename = "plot3.png",
    width = 480, height = 480)
plot(airData$dateTime, airData$Sub_metering_1, type="n", ylab="Energy sub metering", xlab="")
lines(airData$dateTime, airData$Sub_metering_1)
lines(airData$dateTime, airData$Sub_metering_2, col="red")
lines(airData$dateTime, airData$Sub_metering_3, col="blue")
legend("topright", col=c("black", "red", "blue"), 
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       lty=1)
dev.off()


