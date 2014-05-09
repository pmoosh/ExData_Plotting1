plot1 <- function(fn = "household_power_consumption.txt", f_png = "plot1.png") {

    png(f_png)
    tb <- read.table(fn, header = F,skip = 66637, nrows = 2878, sep = ";")

    header <- read.table(fn, header = T,nrows = 1, sep = ";")

    colnames(tb) <- names(header)
    hist(tb$Global_active_power, col = "red", main = "Global Active Power", 
         xlab = "Global Active Power (kilowatts)")
    dev.off()   
}