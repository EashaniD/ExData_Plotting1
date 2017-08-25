progAssignment <- function(){
	library(ggplot2)
	library(lubridate)

	## load and filter the data 

	dataf <- read.table("exdata%2Fdata%2Fhousehold_power_consumption\\household_power_consumption.txt", sep=";")	
	date1 <- as.Date("2007-02-01")
	date2 <- as.Date("2007-02-02")
	dataf[,1] <- as.Date(dataf[,1], format="%d/%m/%Y")
	
	## take the data necessary for the graphs

	dataf <- dataf[dataf[,1] == date1 | dataf[,1] == date2 ,]
	datetime1 <- as.integer(as.factor(paste(dataf[,1],dataf[,2])))
	sm1 <- as.numeric(as.character(dataf[,7]))
	sm2 <- as.numeric(as.character(dataf[,8]))
	sm3 <- as.numeric(as.character(dataf[,9]))

	## graphs

	plot(datetime1,sm1,xaxt="n",type="l",xlab="", ylab="Energy sub metering")
	axis(side=1,at=c(0,(min(datetime1)+max(datetime1))/2,max(datetime1)),label=c("thurs","fri","sat"))
	lines(datetime1,sm2,xaxt="n",type="l",xlab="",col="red")
	lines(datetime1,sm3,xaxt="n",type="l",xlab="",col="blue")
	legend("topright",c("sub_metering_1","sub_metering_2","sub_metering_3"),lty=c(1,1,1),lwd=c(2.5,2.5,2.5),col=c("black","red","blue"))
	
	## save as a png file

	dev.copy(png,"plot3.png")
	dev.off()
}