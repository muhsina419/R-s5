
library(ggplot2)

mtcars$cyl <- factor(mtcars$cyl)
mtcars$am <- factor(mtcars$am, labels = c("Automatic", "Manual"))

p<-ggplot(mtcars, aes(x=cyl, fill = am))+
  geom_bar(position = "dodge")+
  labs(title = "Count of Cars by Number of Cylinders and Transmission type", 
       x = "Number of Cylinders",
       y = "Count of Cars",
       fill = "Transmission type") +
  scale_fill_manual(values = c("Automatic"="maroon", "Manual" = "pink"))+
  theme_minimal()

print(p)
