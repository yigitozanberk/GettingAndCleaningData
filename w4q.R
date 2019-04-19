
fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv"

download.file(fileUrl, destfile = "idaho.csv")

idaho <- read.csv("idaho.csv")

strsplit(names(idaho))

q1 <- strsplit(names(idaho), "wgtp")


fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FGDP.csv"

download.file(fileUrl , destfile = "GDP.csv")

FGDP <- data.table::fread('https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FGDP.csv'
                          , skip=5
                          , nrows = 190
                          , select = c(1, 2, 4, 5)
                          , col.names=c("CountryCode", "Rank", "Economy", "Total")
)

FEDSTATS_Country <- data.table::fread('https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FEDSTATS_Country.csv'
)


mergedDT <- merge(FGDP, FEDSTATS_Country, by = "CountryCode")

library(quantmod)


library(quantmod)
amzn = getSymbols("AMZN",auto.assign=FALSE)
sampleTimes = index(amzn)

myd <- mday(sampleTimes)


        
        
        
        
        
