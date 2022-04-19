#Dual axix plot in r #ggplot2


rm(list=ls())

library(ggplot2)

setwd('G:/graph-gallery')

#read the data
df<- read.csv('weather.csv')

#Reorder the level of month
df$month<- factor(df$month, levels=month.abb)

#plot
p<-ggplot(df, aes(x=month)) +
      geom_bar(aes(y=rainfall),stat="identity", size=0.1, fill='blue') +
      geom_line(aes(y= temperature*10, group=1), size=1, color="red") +
      scale_y_continuous(name = "Rainfall (mm)",
      sec.axis = sec_axis(~./10, name="Temperature (C)")) +
      theme_bw() +
      labs(x="Month")+
      theme(axis.title.y = element_text(color = "black", size=13),
      axis.title.y.right = element_text(color = "black", size=13),
      plot.title=element_text(color = "black", size=13))

p
ggsave(p, file="my_plot.png", width = 7.5, height = 5, units = "in",
       dpi = 150)
