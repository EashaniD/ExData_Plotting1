progAssignment <- function(){
	library(ggplot2)
	library(lubridate)

	##read data and filter it between the given dates

	dataf <- read.table("exdata%2Fdata%2Fhousehold_power_consumption\\household_power_consumption.txt", sep=";")	
	date1 <- as.Date("2007-02-01")
	date2 <- as.Date("2007-02-02")
	dataf[,1] <- as.Date(dataf[,1], format="%d/%m/%Y")

	## take the variables necessary for the graphs

	dataf <- dataf[dataf[,1] == date1 | dataf[,1] == date2 ,]
	datetime1 <- as.integer(as.factor(paste(dataf[,1],dataf[,2])))
	gap <- as.numeric(as.character(dataf[,3]))
	
	## graphs
	
	plot(datetime1,gap,xaxt="n",type="l",xlab="",ylab="Global Active Power (kilowatts)")
	axis(side=1,at=c(0,(min(datetime1)+max(datetime1))/2,max(datetime1)),label=c("thurs","fri","sat"))
	
	## save as a png file

	dev.copy(png,"plot2.png")
	dev.off()
}