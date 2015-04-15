NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

pm0sub <- subset(NEI,fips=="24510")

sum0sub <- dcast(pm0sub,year~type,sum)
meltdata <- melt(sum0sub,id="year",measure.var=names(sum0sub)[2:5]))
names(meltdata) <- c("year","type", "Emissions")

g <- ggplot(meltdata)
g+geom_point(aes(x=year,y=Emissions,col=type),size=4)+labs(y = "Emissions in Baltimore City")

dev.copy(png,file="plot3.png")
dev.off()