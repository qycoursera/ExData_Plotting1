df = read.csv("household_power_consumption.txt", sep=';', na.strings = '?', colClasses=c("character", "character", "numeric","numeric","numeric","numeric","numeric","numeric","numeric"))
ts = as.POSIXct(paste(df$Date, df$Time), format="%d/%m/%Y %H:%M:%S")
start = as.POSIXct("2007-02-01 00:00:00", format="%Y-%m-%d %H:%M:%S")
end = as.POSIXct("2007-02-03 00:00:00", format="%Y-%m-%d %H:%M:%S")
df_required = df[ts <end & ts>=start, ]
ts_required = ts[ts <end & ts>=start]

plot(ts_required, df_required$Global_active_power ,type='l', xlab = '', ylab="Global Active Power (kilowatts)")
dev.copy(png, file = "plot2.png")
dev.off()
