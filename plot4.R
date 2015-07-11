df = read.csv("household_power_consumption.txt", sep=';', na.strings = '?', colClasses=c("character", "character", "numeric","numeric","numeric","numeric","numeric","numeric","numeric"))
ts = as.POSIXct(paste(df$Date, df$Time), format="%d/%m/%Y %H:%M:%S")
start = as.POSIXct("2007-02-01 00:00:00", format="%Y-%m-%d %H:%M:%S")
end = as.POSIXct("2007-02-03 00:00:00", format="%Y-%m-%d %H:%M:%S")
df_required = df[ts <end & ts>=start, ]
ts_required = ts[ts <end & ts>=start]

par(mfrow=c(2,2))
plot(ts_required, df_required$Global_active_power ,type='l', xlab = '', ylab="Global Active Power")
plot(ts_required, df_required$Voltage ,type='l',  ylab="Voltage", xlab='datetime')
plot(ts_required, df_required$Sub_metering_1 ,type='l', xlab='', ylab='Energy sub metering')
lines(ts_required, df_required$Sub_metering_2, col='red')
lines(ts_required, df_required$Sub_metering_3,col='blue')
legend(x='topright', bty='n', cex=0.45, legend = c('Sub_metering_1', 'Sub_metering_2','Sub_metering_3'),lty='solid', col=c('black','red','blue'))
plot(ts_required, df_required$Global_reactive_power ,type='l',  ylab="Voltage", xlab='datetime')
dev.copy(png, file = "plot4.png")
dev.off()