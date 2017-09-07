## reading files

NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

head(SCC)

head(NEI)

# Ques # 2

# subsetting the data for Maryland

Maryland <- subset(NEI, fips == "24510")

head(Maryland)
tail(Maryland)

# summary of dataset

MaryEmis <- aggregate(Emissions ~ year, NEI, mean)

# Maryland Yearly Emissions

png("plot2.png")

barplot(height = MaryEmis$Emissions, names.arg = MaryEmis$year, xlab = "Years", ylab = "Emissions", main = "Total Emissions in Maryland")

dev.off()
