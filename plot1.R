progAssignment <- function(){

	##read data and filter it between the given dates

	data <- read.table("exdata%2Fdata%2Fhousehold_power_consumption\\household_power_consumption.txt", sep=";")	
	date1 <- as.Date("2007-02-01")
	date2 <- as.Date("2007-02-02")
	data[,1] <- as.Date(data[,1], format="%d/%m/%Y")
	data <- data[data[,1] == date1 | data[,1] == date2 ,]

	## take the variables necessary for the graphs
	
	gap <- as.numeric(as.character(data[,3]))
	
	## plots

	hist(gap, xlab="Global active power(in Kilowatts)", col="red", xlim=c(0,8), breaks=24)
	
	## save as a png file

	dev.copy(png,"plot1.png")
	dev.off()	
}