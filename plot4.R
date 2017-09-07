## reading files

NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

head(SCC)

head(NEI)

# Ques # 4

# subsetting the data

SCCSubset <- SCC[grep("Coal", SCC$EI.Sector),]

head(SCCSubset)

# mergiing the both datasets

CoalEmisData <- merge(NEI, SCCSubset, by = "SCC")

#  summary of the emissions

CoalEmis <- aggregate(Emissions ~ year + EI.Sector, CoalEmisData, mean)

# plotting coal emissions

png("plot4.png")

ggplot(CoalEmis, mapping = aes(x = year, y = Emissions, color = EI.Sector)) + geom_line() + ggtitle("Total Coal related Emissions in U.S.A.")

dev.off()
