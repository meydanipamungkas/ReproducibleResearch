#data preprocessing
averageDA<-aggregate(activity$steps,by=list(activity$interval),
                                  FUN=mean,na.rm=TRUE)
names(averageDA)<-c("Interval","Mean")
averageAdf<-data.frame(averageDA)

#plot the data
da<-ggplot(averageAdf,mapping=aes(Interval,Mean))+
  geom_line(col="blue")+
  xlab("Interval")+
  ylab("Average Number of Steps")+
  ggtitle("Average Number of Steps Per Interval")+
  theme_calc(base_family="serif")
print(da)

averageDA[which.max(averageDA$Mean),]$Interval