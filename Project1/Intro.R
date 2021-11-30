#intro
knitr::opts_chunk$set(echo=TRUE,warning=FALSE,fig.width=10,fig.height=5,
                      fig.keep='all',fig.path='figures\ ',dev='png')

#instal & loading packages
install.packages('ggthemes')
library(ggplot2)
library(ggthemes)

#load the data
path=getwd()
unzip("repdata_data_activity.zip",exdir=path)
activity<-read.csv("activity.csv")

#data preprocessing
activity$date<-as.POSIXct(activity$date,"%Y%m%d")
day<-weekdays(activity$date)
activity<-cbind(activity,day)