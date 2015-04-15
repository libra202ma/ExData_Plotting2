NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

pm0sub <- subset(NEI,fips=="24510")

sum0sub <- with(pm0sub,tapply(Emissions,year,sum,na.rm=T))
d0sub <- data.frame(year=names(sum0sub),sum=sum0sub)
d0sub$year <- as.numeric(as.character(d0sub$year))

with(d0sub,plot(year,sum,xlab="year",ylab="Total Emissions in Baltimore City, Maryland",cex=2,col="blue"))

dev.copy(png,file="plot2.png")
dev.off()