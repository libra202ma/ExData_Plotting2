NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

logical <- grep("vehicle",SCC$EI.Sector,ignore.case=T)
Vehicle <- SCC$SCC[logical]
index <- NEI$SCC %in% Vehicle

BC <- subset(NEI[index,],fips=="24510")
Emission <- with(BC,tapply(Emissions, year,sum,na.rm=T))

d0 <- data.frame(year=names(Emission),sum=Emission)
d0$year <- as.numeric(as.character(d0$year))
with(d0,plot(year,sum,ylab="Baltimore City Vehicle Emission",cex=2))

dev.copy(png,file="plot5.png")
dev.off()