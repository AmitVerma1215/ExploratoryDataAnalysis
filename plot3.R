## reading files

NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

head(SCC)

head(NEI)

# Ques # 3

# summary of dataset

MaryTypeEmis <- aggregate(Emissions ~ year + type, NEI, mean)

View(MaryTypeEmis)

# plotting the dataset

png("plot3.png")

ggplot(MaryTypeEmis, mapping = aes(x = year, y = Emissions, color = type)) + geom_line() + ggtitle("Total Emissions in Maryland")

dev.off()

