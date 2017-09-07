## reading files

NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

head(SCC)

head(NEI)

# Ques # 6

# subsetting the dataset

MaryLA <- subset(NEI, fips %in% c("24510", "06037"))

head(MaryLA)
tail(MaryLA)

SCCMoVehi <- subset(SCC, Data.Category == "Onroad")

# merging the datasets

MaryLAEmis <- merge(MaryLA, SCCMoVehi, by = "SCC")

# plotting the data

png("plot6.png")

ggplot(MaryLAEmis, mapping = aes(x = factor(year), y = Emissions, fill = factor(fips))) +
  geom_bar(stat = "identity", position = "dodge") +
  scale_fill_discrete(name = "fips", breaks=c("24510", "06037"), labels = c("Maryland", "Los Angeles")) +
  xlab("Year") + ylab("Motor Emissions") + ggtitle("Comparison on Emissions between Maryland and LosAngeles")
