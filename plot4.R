plot4 <- function(){
  # set locale to en_US so that we get English weekday abbreviations 
  Sys.setlocale("LC_TIME", "en_US")
  
  # file "household_power_consumption.txt" precomputed to only contain values of 1st and 2nd of February 2007
  data  <- read.table("household_power_consumption.txt", na.strings = "?", nrows = 2100000, sep = ";", header = TRUE)
  data0 <- subset(data, Date == "1/2/2007" | Date == "2/2/2007")
  data0$Date  <- as.Date(data0$Date, "%d/%m/%Y", tz = "")
  timestamp0  <- paste(data0$Date, data0$Time)
  timestamp0  <- strptime(timestamp0, "%Y-%m-%d %H:%M:%S")
  
  # 2x2 gird of plots
  par(mfrow = c(2,2))
  
  # uper left
  plot(timestamp0, data0$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power");
  
  # upper right
  plot(timestamp0, data0$Voltage, type = "l", xlab = "datetime", ylab = "Voltage");
  
  # lower left
  plot(timestamp0, data0$Sub_metering_1, type = "l", xlab = "", ylab = "Energy sub metering");
  points(timestamp0, data0$Sub_metering_2, type="l", col = "red")
  points(timestamp0, data0$Sub_metering_3, type="l", col = "blue")
  legend("topright",legend = c("Sub_metering_1" , "Sub_metering_2" , "Sub_metering_3"), lty = 1, col =c("black", "red", "blue"), bty = "n")
  
  # lower right
  plot(timestamp0, data0$Global_reactive_power, type = "l", xlab = "datetime", ylab = "Global_reactive_power");
  
  #  reset to single plot view (1x1 grid)
  par(mfrow = c(1,1))
}