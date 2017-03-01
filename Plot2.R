#Plot2
download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip", destfile="HouseholdPower.rar", method="curl")
unzip("HouseholdPower.rar")
power<-read.csv2("household_power_consumption.txt", stringsAsFactors = FALSE)

power$Date<-as.Date(strptime(power$Date, "%d/%m/%Y"))
power<-subset(power, power$Date=="2007-02-01" | power$Date=="2007-02-02")
power$Time<-paste(as.character(power$Date), power$Time)
power$Time<-strptime(power$Time, format = "%Y-%m-%d %H:%M:%S")

plot(power$Time, power$Global_active_power, type = "n", ylab = "Global Active Power (kilowatts)")
lines(power$Time, power$Global_active_power, type = "l")
dev.copy(png, "Plot2.png")
dev.off()