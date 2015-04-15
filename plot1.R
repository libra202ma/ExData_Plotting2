NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

sum0 <- with(NEI,tapply(Emissions,year,sum,na.rm=T))
d0 <- data.frame(year=names(sum0),sum=sum0)
d0$year <- as.numeric(as.character(d0$year))

with(d0,plot(year,sum,xlab="year",ylab="Total Emissions",cex=2,col="red"))

dev.copy(png,file="plot1.png")
dev.off()

