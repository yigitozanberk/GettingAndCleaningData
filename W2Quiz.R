#ClientID
# 4e7afff93ec7e96f3f27

#ClientSecret
# 4051f04d1d80808446f2d76a42608299f382cefc


library(jsonlite)

library(httpuv)

library(httr)

oauth_endpoints("github")

myapp <- oauth_app(appname ="myRS_Quiz", 
                   key = "4e7afff93ec7e96f3f27", 
                   secret = "4051f04d1d80808446f2d76a42608299f382cefc")

github_token <- oauth2.0_token(oauth_endpoints("github"), myapp)

gtoken <- config(token = github_token)

req <- GET("https://api.github.com/users/jtleek/repos", gtoken)

stop_for_status(req)

json1 = content(req)

datashare <- which(sapply(json1, FUN = function(x) "datasharing" %in% x))

list(json1[[15]]$name, json1[[15]]$created_at)

library(RMySQL)
library(sqldf)
library(httr)
library(XML)
library(RCurl)
#asc <- getURL("https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06pid.csv")





#son soruda internetten baktim


