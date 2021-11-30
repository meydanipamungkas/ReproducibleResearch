#data preprocessing
activityts<-with(activity,aggregate(steps,by=list(date),sum,na.rm=TRUE))
names(activityts)<-c("Date","Steps")
tsdf<-data.frame(activityts)

#plot the data
g<-ggplot(tsdf,aes(x=Steps))+
  geom_histogram(breaks=seq(0,25000,by=2500),fill="#83CAFF",col="black")+
  ylim(0,30)+
  xlab("Total Steps Taken Per Day")+
  ylab("Frequency")+
  ggtitle("Total Number of Steps Taken on a Day")+
  theme_calc(base_family="serif")
print(g)

mean(activityts$Steps)
median(activityts$Steps)