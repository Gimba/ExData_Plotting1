plot1 <- function() {
  # file "household_power_consumption.txt" precomputed to only contain values of 1st and 2nd of February 2007
  data  <- read.table("household_power_consumption.txt", na.strings = "?", nrows = 2100000, sep = ";", header = TRUE)
  data0 <- subset(data, Date == "1/2/2007" | Date == "2/2/2007")
  
  hist(data0$Global_active_power,col= "red", xlab = "Global Active Power (kilowatts)", main = "Global Active Power" )
}