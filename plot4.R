plot4  <- function(fn = "household_power_consumption.txt", f_png = "plot4.png") {

    png(f_png)
    
    
    tb <- read.table(fn, header = F,skip = 66637, nrows = 2878, sep = ";")

    header <- read.table(fn, header = T,nrows = 1, sep = ";")
    colnames(tb) <- names(header)
    
    par(mfrow = c(2,2))
    
    plot(strptime(paste(tb$Date, tb$Time),"%d/%m/%Y %H:%M:%S"), tb$Global_active_power, type = "l", ann = F)
    title(ylab = "Global Active Power")
    
    plot(strptime(paste(tb$Date, tb$Time),"%d/%m/%Y %H:%M:%S"), tb$Voltage, type = "l", ann = F)
    title(ylab = "Voltage")
    title(xlab = "datetime")
    
    plot(strptime(paste(tb$Date, tb$Time),"%d/%m/%Y %H:%M:%S"), tb$Sub_metering_1, type = "l", ann = F)
    lines(strptime(paste(tb$Date, tb$Time),"%d/%m/%Y %H:%M:%S"),tb$Sub_metering_2, type = "l", col = "red")
    lines(strptime(paste(tb$Date, tb$Time),"%d/%m/%Y %H:%M:%S"),tb$Sub_metering_3, type = "l", col = "blue")
    title(ylab = "Energy sub metering")
    legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
           col = c("black", "red", "blue"), lty = 1, bty = "n")
    
    plot(strptime(paste(tb$Date, tb$Time),"%d/%m/%Y %H:%M:%S"), tb$Global_reactive_power, type = "l", ann = F)
    title(ylab = "Global_reactive_power")
    title(xlab = "datetime")
    
    
    dev.off()   
}