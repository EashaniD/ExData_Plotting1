progAssignment <- function(){
	library(ggplot2)
	library(lubridate)

	##read data and filter it between the given dates

	dataf <- read.table("exdata%2Fdata%2Fhousehold_power_consumption\\household_power_consumption.txt", sep=";")	
	
	date1 <- as.Date("2007-02-01")
	date2 <- as.Date("2007-02-02")
	dataf[,1] <- as.Date(dataf[,1], format="%d/%m/%Y")
	
	dataf <- dataf[dataf[,1] == date1 | dataf[,1] == date2 ,]

	## take the variables necessary for the graphs

	datetime1 <- as.integer(as.factor(paste(dataf[,1],dataf[,2])))
	gap <- as.numeric(as.character(dataf[,3]))
	grp <- as.numeric(as.character(dataf[,4]))
	vol <- as.numeric(as.character(dataf[,5]))
	sm1 <- as.numeric(as.character(dataf[,7]))
	sm2 <- as.numeric(as.character(dataf[,8]))
	sm3 <- as.numeric(as.character(dataf[,9]))

	## graphs

	par(mfrow=c(2,2))
	plot(datetime1,gap,xaxt="n",type="l",xlab="", ylab="Global active power")
	axis(side=1,at=c(0,(min(datetime1)+max(datetime1))/2,max(datetime1)),label=c("thurs","fri","sat"))

	plot(datetime1,vol,xaxt="n",type="l",xlab="datetime", ylab="voltage")
	axis(side=1,at=c(0,(min(datetime1)+max(datetime1))/2,max(datetime1)),label=c("thurs","fri","sat"))
	
	plot(datetime1,sm1,xaxt="n",type="l",xlab="", ylab="Energy sub metering")
	axis(side=1,at=c(0,(min(datetime1)+max(datetime1))/2,max(datetime1)),label=c("thurs","fri","sat"))
	lines(datetime1,sm2,xaxt="n",type="l",xlab="",col="red")
	lines(datetime1,sm3,xaxt="n",type="l",xlab="",col="blue")
	legend("topright",c("sub_metering_1","sub_metering_2","sub_metering_3"),lty=c(1,1,1),lwd=c(2.5,2.5,2.5),col=c("black","red","blue"),bty="n")
	
	plot(datetime1,grp,xaxt="n",type="l",xlab="datetime", ylab="Global_reactive_power")
	axis(side=1,at=c(0,(min(datetime1)+max(datetime1))/2,max(datetime1)),label=c("thurs","fri","sat"))

	##save as a png file

	dev.copy(png,"plot4.png")
	dev.off()
}