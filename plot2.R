plot2 <- function(fn = "household_power_consumption.txt", f_png = "plot2.png") {

    png(f_png)
    tb <- read.table(fn, header = F,skip = 66637, nrows = 2878, sep = ";")

    header <- read.table(fn, header = T,nrows = 1, sep = ";")

    colnames(tb) <- names(header)
    plot(strptime(paste(tb$Date, tb$Time),"%d/%m/%Y %H:%M:%S"), tb$Global_active_power, type = "l", ann = F)
    title(ylab = "Global Active Power (kilowatts)")
    dev.off()   
}