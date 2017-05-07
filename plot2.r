makeplot2 <- function() {
      data <- read.csv("household_power_consumption.txt", sep=";", na.strings="?",stringsAsFactors = FALSE)
      df<- subset(data, data$Date=="1/2/2007"|data$Date=="2/2/2007")
      df$Datetime <-paste(df$Date, df$Time)
      df$Datetime<-strptime(df$Datetime, "%d/%m/%Y %H:%M:%S")
      
      png("plot2.png", width=480, height=480)
      with(df, plot(Datetime, Global_active_power, type="l", xlab="",ylab="Global Active Power (kilowatts)"))
      dev.off()
}