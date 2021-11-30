#format update
activity$date<-as.Date(strptime(activity$date,format="%Y-%m-%d"))

#function
activity$dayType<-sapply(activity$date,function(x) {
  if(weekdays(x)=="Saturday"|weekdays(x)=="Sunday")
  {y<-"Weekend"}
  else {y<-"Weekday"}
  y
})

#creating data
activityByDay<-aggregate(steps~interval+dayType,activity,mean,na.rm=TRUE)

#plot the data
dayPlot<-ggplot(activityByDay,aes(x=interval,y=steps,color=dayType))+
  geom_line()+ggtitle("Average Daily Steps by Day Type")+
  xlab("Interval")+
  ylab("Average Number of Steps") +
  facet_wrap(~dayType,ncol=1,nrow=2) +
  scale_color_discrete(name="Day Type") +
  theme_calc(base_family="serif")
print(dayPlot) 