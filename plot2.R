a <- read.table("household_power_consumption.txt",sep=";",header=TRUE,na.strings="?",stringsAsFactors=FALSE,quote="")
d <- a[which(a$Date =="1/2/2007" | a$Date == "2/2/2007"),]
d$Date <- as.Date(d$Date,"%d/%m/%Y")
d$DateTime <- as.POSIXct(paste(d$Date, d$Time))

png(file="plot2.png")
with(faithful,plot(d$DateTime, d$Global_active_power, type= "l", lwd=1, ylab= "Global Active Power (kilowatts)", xlab=""))
dev.off()