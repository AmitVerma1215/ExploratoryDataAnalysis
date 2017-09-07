## reading files

NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

head(SCC)

head(NEI)

# Ques # 5

# subsetting the datasets

SCCMoVehi <- subset(SCC, Data.Category == "Onroad")

head(SCCMoVehi)
tail(SCCMoVehi)

Maryland <- subset(NEI, fips == "24510")

# merging both the datasets

MotorEmisData <- merge(Maryland, SCCMoVehi, by = "SCC")

# creating summary of the dataset

MotorEmis <- aggregate(Emissions ~ year, MotorEmisData, mean)

# plotting the summary data

png("plot5.png")

barplot(height = MotorEmis$Emissions, names.arg = MotorEmis$year, xlab = "Year", ylab = "Motor Emissions", main = "Total Motor Emissions in Maryland")

dev.off()

