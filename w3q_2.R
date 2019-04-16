fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FGDP.csv"

download.file(fileUrl, destfile = "countr.csv")

fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FGDP.csv"

download.file(fileUrl, destfile = "educat.csv")


FGDP <- data.table::fread('https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FGDP.csv'
                          , skip=5
                          , nrows = 190
                          , select = c(1, 2, 4, 5)
                          , col.names=c("CountryCode", "Rank", "Economy", "Total")
)

FEDSTATS_Country <- data.table::fread('https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FEDSTATS_Country.csv'
)

mergedDT <- merge(FGDP, FEDSTATS_Country, by = "CountryCode")

nrow(mergedDT)

mergedDT[order(-Rank)][13,.(Economy)]

mergedDT[, .(AvGDP = mean(Rank)), by = "Income Group"]

gdp_vect <- quantile(mergedDT[, Rank], probs = seq(0, 1, 0.2), na.rm = T)

mergedDT$quantileGDP <- cut(mergedDT[, Rank], breaks = gdp_vect)

mergedDT[, .N, by = c("quantileGDP", "Income Group")]

