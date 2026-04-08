# install.packages("data.table")
# library(data.table)
# install.packages("lubridate")
# library(lubridate)
# install.packages("hms")
# library(hms)

par(mfrow = c(1,1))

f <- file.path(getwd(),"/household_power_consumption.txt")
power_cons <- fread(file = f, sep = ";", na.strings = '?', colClasses = c("character","character","numeric","numeric","numeric","numeric","numeric","numeric","numeric"))
power_cons <- power_cons[complete.cases(power_cons),]
power_cons$Date <- as.Date(power_cons$Date, "%d/%m/%Y")
power_cons <- subset(power_cons, Date >= as.Date("2007-2-1") & Date <= as.Date("2007-2-2"))


png(filename = "./plot1.png", width = 480, height = 480, units = 'px', bg = "white")

hist(power_cons$Global_active_power, col = "red", 
     xlab = "Global Active Power (kilowatts)", 
     main = "Global Active Power")

dev.off()
