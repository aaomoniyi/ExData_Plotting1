#Reads in data from file then subsets data for specified dates
powerDT <- data.table::fread(input = "household_power_consumption.txt"
                             , na.strings="?"
)

powerDT$Date <- as.Date(powerDT$Date, format="%d/%m/%Y")



# Filter Dates for 2007-02-01 and 2007-02-02
data <- subset(powerDT, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))
rm(powerDT)

datetime <- paste(as.Date(data$Date), data$Time)
data$Datetime <- as.POSIXct(datetime)



## Plot 2
Plot2 <- plot(data$Global_active_power~data$Datetime, type="l",
           ylab="Global Active Power (kilowatts)", xlab="")
dev.copy(png, file="plot2.png", height=480, width=480)
dev.off()