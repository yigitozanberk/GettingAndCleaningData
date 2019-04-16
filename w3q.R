#Quiz week 3

fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv"

download.file(fileUrl, destfile = "q3_data.csv")

myq_dat <- read.csv("q3_data.csv")

fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fjeff.jpg"

download.file(fileUrl , destfile = "my_ins.jpg")

fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FGDP.csv"

download.file(fileUrl, destfile = "my_countries.csv")

fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FGDP.csv"

download.file(fileUrl, destfile = "educat.csv")





FGDP <- data.table::fread('https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FGDP.csv'
                          , skip=4
                          , nrows = 190
                          , select = c(1, 2, 4, 5)
                          , col.names=c("CountryCode", "Rank", "Economy", "Total")
)


FEDSTATS_Country <- data.table::fread('https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FEDSTATS_Country.csv'
)

mergedDT <- merge(FGDP, FEDSTATS_Country, by = 'CountryCode')


nrow(mergedDT)



mergedDT[`Income Group` == "High income: OECD"
         , lapply(.SD, mean)
         , .SDcols = c("Rank")
         , by = "Income Group"]


mergedDT[`Income Group` == "High income: nonOECD"
         , lapply(.SD, mean)
         , .SDcols = c("Rank")
         , by = "Income Group"]


breaks <- quantile(mergedDT[, Rank], probs = seq(0, 1, 0.2), na.rm = TRUE)


mergedDT$quantileGDP <- cut(mergedDT[, Rank], breaks = breaks)

mergedDT[`Income Group` == "Lower middle income", .N, by = c("Income Group", "quantileGDP")]

