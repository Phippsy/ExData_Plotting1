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
png(filename = "plot2.png",
    width = 480, height = 480)
plot(airData$dateTime, airData$Global_active_power, 
     type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.off()

