makeplot4 <- function() {
      data <- read.csv("household_power_consumption.txt", sep=";", na.strings="?",stringsAsFactors = FALSE)
      df<- subset(data, data$Date=="1/2/2007"|data$Date=="2/2/2007")
      df$Datetime <-paste(df$Date, df$Time)
      df$Datetime<-strptime(df$Datetime, "%d/%m/%Y %H:%M:%S")
      
      png("plot4.png", width=480, height=480)
      par(mfcol = c(2,2))
      with(df, plot(Datetime, Global_active_power, type="l", xlab="",ylab="Global Active Power"))
      with(df, plot(Datetime, Sub_metering_1, type = "l", xlab = "", ylab = "Energy sub metering"))
      with(df, lines(Datetime, Sub_metering_2, type = "l", col="red"))
      with(df, lines(Datetime, Sub_metering_3, type = "l", col="blue"))
      legend("topright",lty=1, col=c("black", "red", "blue"), legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
      with(df, plot(Datetime, Voltage, type = "l", xlab = "datetime", ylab = "Voltage"))
      with(df, plot(Datetime, Global_reactive_power, type = "l", xlab = "datetime", ylab = "Global_reactive_power"))
      dev.off()
}