a <- read.table("household_power_consumption.txt",sep=";",header=TRUE,na.strings="?")
a$Date <- as.Date(a$Date,"%d/%m/%Y")
d <- a[which(a$Date =="2007-02-01" | a$Date == "2007-02-02"),]
d$Time <- strptime(d$Time,"%H:%M:%S")

png(file="plot1.png")
with(faithful,hist(d$Global_active_power,col = "red",xlab="Global Active Power (kilowatts)",ylab="Frequency",main="Global Active Power"))
dev.off()
