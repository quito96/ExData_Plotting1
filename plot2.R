#-------------------------------------------------------------------------

##data_full <- read.csv("./data/household_power_consumption.txt", header=T, sep=';', na.strings="?", nrows=2075259, check.names=F, stringsAsFactors=F, comment.char="", quote='\"')

data2 <- subset(data_full, Date %in% c("1/2/2007","2/2/2007"))
data2$Date <- as.Date(data2$Date, format="%d/%m/%Y")
datetime <- paste(as.Date(data2$Date), data2$Time)
data2$Datetime <- as.POSIXct(datetime)


with(data2, {
  plot(Global_active_power~Datetime, type="l",
       ylab="Global Active Power (kilowatts)", xlab="")
})
## Plot 2
dev.copy(png, file="plot2.png", height=480, width=480)
dev.off()