NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

logical <- gep("Coal",SCC$Short.Name)
Coal <- SCC$SCC[logical]
index <- NEI$SCC %in% Coal
Emission <- with(NEI[index,],tapply(Emissions, year,sum,na.rm=T))

d0 <- data.frame(year=names(Emission),sum=Emission)
d0$year <- as.numeric(as.character(d0$year))
with(d0,plot(year,sum,ylab="Coal Emission",cex=2))

dev.copy(png,file="plot4.png")
dev.off()