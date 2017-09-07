## reading files

NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

head(SCC)

head(NEI)

# Ques # 1

# summary of the dataset

YearEmis <- aggregate(Emissions ~ year, NEI, mean)

# plotting yearly emissions

png("plot1.png")

barplot(height = YearEmis$Emissions, names.arg = YearEmis$year, xlab = "Years", ylab = "Emissions", main = "Total Yearly Emissions in U.S.A.")

dev.off()

