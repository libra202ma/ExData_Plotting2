NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

library(reshape2)
library(ggplot2)

logical <- grep("vehicle",SCC$EI.Sector,ignore.case=T)
Vehicle <- SCC$SCC[logical]
index <- NEI$SCC %in% Vehicle

BC <- subset(NEI[index,],fips=="24510")
LA <- subset(NEI[index,],fips=="06037")

sumBC <- with(BC,tapply(Emissions,year,sum,na.rm=T))
sumLA <- with(LA,tapply(Emissions,year,sum,na.rm=T))

d0 <- data.frame(year=names(sumBC),BC=sumBC,LA=sumLA)
meltdata <- head(melt(d0,id="year",measure.var=c("BC","LA")), 8)
names(meltdata) <- c("year","city","Emissions")
meltdata$year <- as.numeric(as.character(meltdata$year))

g <- ggplot(meltdata)
g + geom_point(aes(x=year,y=Emissions), size = 4, color = "salmon") + facet_grid(. ~ city)
dev.copy(png,file="plot6.png")
dev.off()
