a <- read.table("household_power_consumption.txt",sep=";",header=TRUE,na.strings="?",stringsAsFactors=FALSE,quote="")
d <- a[which(a$Date =="1/2/2007" | a$Date == "2/2/2007"),]
d$Date <- as.Date(d$Date,"%d/%m/%Y")
d$DateTime <- as.POSIXct(paste(d$Date, d$Time))

png(file="plot3.png")
with(faithful, plot(d$DateTime,d$Sub_metering_1,type="l",ylab="Energy sub metering",xlab="")
                +lines(d$DateTime,d$Sub_metering_2,type="l",col="Red")
                +lines(d$DateTime,d$Sub_metering_3,type="l",col="Blue")
                +legend("topright",,lty=1,col=c("Black","Red","Blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
                )
dev.off()