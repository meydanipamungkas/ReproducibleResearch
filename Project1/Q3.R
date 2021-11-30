#data preprocessing
sum(is.na(activity$steps))
imputed.steps<-averageDA$Mean[match(activity$interval,averageDA$Interval)]
activity.imputed<-transform(activity,
                             steps=ifelse(is.na(activity$steps),yes=imputed.steps,no=activity$steps))
totalactivity.imputed<-aggregate(steps~date,activity.imputed,sum)
names(totalactivity.imputed)<-c("date","dailySteps")
sum(is.na(totalactivity.imputed$dailySteps))
totalimputed.stepsdf<-data.frame(totalactivity.imputed)

#plot the data
p<-ggplot(totalimputed.stepsdf,aes(x=dailySteps))+
  geom_histogram(breaks=seq(0,25000,by=2500),fill="#83CAFF",col="black")+
  ylim(0,30)+
  xlab("Total Steps Taken Per Day")+
  ylab("Frequency")+
  ggtitle("Total Number of Steps Taken on a Day")+
  theme_calc(base_family="serif")
print(p)

mean(totalactivity.imputed$dailySteps)
median(totalactivity.imputed$dailySteps)