#Plot4
download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip", destfile="HouseholdPower.rar", method="curl")
unzip("HouseholdPower.rar")
power<-read.csv2("household_power_consumption.txt", stringsAsFactors = FALSE)

power$Date<-as.Date(strptime(power$Date, "%d/%m/%Y"))
power<-subset(power, power$Date=="2007-02-01" | power$Date=="2007-02-02")
power$Time<-paste(as.character(power$Date), power$Time)
power$Time<-strptime(power$Time, format = "%Y-%m-%d %H:%M:%S")

par(mfrow=c(2,2))

plot(power$Time, power$Global_active_power, type = "n", ylab = "Global Active Power")
lines(power$Time, power$Global_active_power, type = "l")

plot(power$Time, power$Voltage, xlab = "datetime", ylab = "Voltage", type = "n")
lines(power$Time, power$Voltage, type = "l")

plot(power$Time, power$Sub_metering_1, type = "n", xlab = "", ylab = "Energy Sub etering")
lines(power$Time, power$Sub_metering_1, type = "l")
lines(power$Time, power$Sub_metering_2, type = "l", col="red")
lines(power$Time, power$Sub_metering_3, type = "l", col="blue")
legend("topright", c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), col=c("black","red","blue"), lty=c(1,1,1), lwd = c(1,1,1), cex=0.13)

plot(power$Time, power$Global_reactive_power, type = "n", xlab = "datetime", ylab = "Global_reactive_power" )
lines(power$Time, power$Global_reactive_power, type = "l")
dev.copy(png, "Plot4.png")
dev.off()

