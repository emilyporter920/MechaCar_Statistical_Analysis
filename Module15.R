x <- 5

numlist <- c(0,1,2,3,4,5,6,7,8,9)

?read.csv()

demo_table <- read.csv(file="demo.csv", check.names = F, stringsAsFactors = F)

demo_table2 <- fromJSON(txt="demo.json")

x <- c(3,3,2,2,5,5,8,8,9)

x[3]

demo_table[3,"Year"]

demo_table[3,3]

demo_table$"Vehicle_Class"

demo_table$"Vehicle_Class"[2]

filter_table <- demo_table2[demo_table2$price > 10000,]

?subset()

# Filter by price and drivetrain
filter_table2 <- subset(demo_table2, price > 10000 & drive == "4wd" & "clean"
                        %in% title_status)

filter_table3 <- demo_table2[("clean" %in% demo_table2$title_status) & 
                               (demo_table2$price > 1000) & 
                               (demo_table2$drive == "4wd"),]

?sample()

sample(c("cow", "deer", "pig", "chicken", "duck",
         "sheep", "dog"), 4)

num_rows <- 1:nrow(demo_table)

sample_rows <- sample(num_rows, 3)

demo_table[sample_rows,]

demo_table[sample(1:nrow(demo_table), 3),]

# Add columns to original data frame
demo_table <- demo_table %>% mutate(Mileage_per_Year=Total_Miles/(2020-Year),
                                    IsActive=TRUE)

# Create Summary Table
summarize_demo <- demo_table2 %>% group_by(condition) %>% 
  summarize(Mean_Mileage=mean(odometer), .groups = 'keep')

# Create summary table with multiple columns
summarize_demo <- demo_table2 %>% group_by(condition) %>% 
  summarize(Mean_Mileage=mean(odometer), Maximum_Price=max(price),
            Num_Vehicles=n(), .groups = 'keep')

demo_table3 <- read.csv('demo2.csv', check.names = F, 
                        stringsAsFactors = F)

long_table <- gather(demo_table3, key="Metric", value="Score", 
                     buying_price:popularity)

# OR
# long_table <- demo_table3 %>% gather(key="Metric", value="Score", 
# buying_price:popularity)

wide_table <- long_table %>% spread(key="Metric", value="Score")

# Check to see if the tables are the same
all.equal(demo_table3,wide_table)

head(mpg)

# Import dataset into ggplot2
plt <- ggplot(mpg, aes(x=class))

# Plot a bar plot
plt+geom_bar()

# Create summary table
mpg_summary <- mpg %>% group_by(manufacturer) %>% 
  summarize(Vehicle_Count=n(), .groups = 'keep')

# Import dataset into ggplot2
plt <- ggplot(mpg, aes(x=manufacturer, y=Vehicle_Count))

# Plot a bar plot
plt + geom_col()

# Plot bar plot with labels & x-axis labels rotated 45 degrees
plt + geom_col() + xlab("Manufacturing Company") + 
  ylab("Number of Vehicles in Dataset") + theme(axis.text.x=element_text(
    angle=45, hjust=1))

# Create summary table
mpg_summary <- subset(mpg, manufacturer == "toyota") %>% 
  group_by(cyl) %>% summarize(Mean_Hwy=mean(hwy), .groups = 'keep')

# Import dataset into ggplot2
plt <- ggplot(mpg_summary, aes(x=cyl, y=Mean_Hwy))

# Plot & add line plot with labels
plt + geom_line() + scale_x_discrete(limits=c(4,6,8)) + 
  scale_y_continuous(breaks = c(15:30))

# Import dataset into ggplot2
plt <- ggplot(mpg, aes(x=displ, y=cty))

# Add scatter plot with labels
plt + geom_point() + xlab("Engine Size (L)") + 
  ylab("City Fuel-Efficiency (MPG)")

# Import dataset into ggplot2
plt <- ggplot(mpg, aes(x=displ, y=cty, color=class))

# Add scatter plot with labels
plt + geom_point() + labs(x="Engine Size (L)", 
                          y="City Fuel-Efficiency (MPG)", color="Vehicle Class")

# Import dataset into ggplot2
plt <- ggplot(mpg, aes(x=displ, y=cty, color=class, shape=drv))

# Add scatter plot with multiple aesthetics
plt + geom_point() + labs(x="Engine Size (L)", y="City Fuel-Efficiency (MPG)",
                          color="Vehicle Class",shape="Type of Drive")

# Import dataset into ggplot2
plt <- ggplot(mpg, aes(y=hwy))

# Add boxplot
plt + geom_boxplot()

# Import dataset into ggplot2
plt <- ggplot(mpg, aes(x=manufacturer, y=hwy))

# Add boxplot and rotate x-axis labels 45 degrees
plt + geom_boxplot() + theme(axis.text.x=element_text(
  angle=45, hjust=1))

# Create summary table
mpg_summary <- mpg %>% group_by(class,year) %>% 
  summarize(Mean_Hwy=mean(hwy), .groups = 'keep')

plt <- ggplot(mpg_summary, aes(x=class, y=factor(year), fill=Mean_Hwy))

# Create heatmap with labels
plt + geom_tile() + labs(x="Vehicle Class", y="Vehicle Year",
                          fill="Mean Highway (MPG)")

# Create summary table
mpg_summary <- mpg %>% group_by(model,year) %>% summarize(Mean_Hwy=mean(hwy), 
                                                          .groups='keep')

# Import dataset into ggplot2
plt <- ggplot(mpg_summary, aes(x=model, y=factor(year), fill=Mean_Hwy))

# Add heatmap with labels and rotate x-axis labels 90 degrees
plt + geom_tile() + labs(x="Model", y="Vehicle Year", fill= "Mean Highway (MPG)" +
                            theme(axis.text.x=element_text(angle=90, 
                                                            hjust=1, vjust=0.5)))

# Import dataset into ggplot2
plt <- ggplot(mpg, aes(x=manufacturer, y=hwy))

# Add boxplot, rotate x-labels 45 degrees, overlay scatter plot on top
plt + geom_boxplot() + theme(axis.text.x=element_text(angle=45,hjust=1)) +
  geom_point()

# Create summary table
mpg_summary <- mpg %>% group_by(class) %>% summarize(Mean_Engine=mean(displ),
                                                      .groups='keep')

# Import dataset into ggplot2
plt <- ggplot(mpg_summary, aes(x=class, y=Mean_Engine))

# Add scatter plot
plt + geom_point(size=4) + labs(x="Vehicle Class", 
                                y="Mean Engine Size")

# Make a summary dataset
mpg_summary <- mpg %>% group_by(class) %>% summarize(Mean_Engine=mean(displ), 
                                                     SD_Engine=sd(displ), 
                                                     .groups='keep')

# Import dataset into ggplot2
plt <- ggplot(mpg_summary, aes(x=class, y=Mean_Engine))

# Add scatter plot with labels & overlay with error bars
plt + geom_point(size=4) + labs(x="Vehicle Class", y="Mean Engine Size") +
  geom_errorbar(aes(ymin=Mean_Engine-SD_Engine, ymax=Mean_Engine+SD_Engine))

# Convert to long format
mpg_long <- mpg %>% gather(key="MPG_Type", value="Rating", c(cty,hwy))

head(mpg_long)

# Import dataset into ggplot2
plt <- ggplot(mpg_long, aes(x=manufacturer, y=Rating, color=MPG_Type))

# Add boxplot with labels rotated 45 degrees
plt + geom_boxplot() + theme(axis.text.x=element_text(angle=45,hjust=1))

# Import dataset into ggplot2
plt <- ggplot(mpg_long, aes(x=manufacturer, y=Rating, color=MPG_Type))

# Create multiple boxplots and rotate x-axis labels
plt + geom_boxplot() + facet_wrap(vars(MPG_Type)) + 
  theme(axis.text.x=element_text(angle=45,hjust=1), legend.position='none') +
  xlab("Manufacturer")

# Visualize distribution using density plot
ggplot(mtcars, aes(x=wt)) + geom_density()

# Perform a Shapiro-Wilk normality test
shapiro.test(mtcars$wt)

# Import used car dataset
population_table <- read.csv('used_car_data.csv', check.names=F, 
                             stringsAsFactors = F)

# Import used car dataset into ggplot2
plt <- ggplot(population_table, aes(x=log10(Miles_Driven)))

# Visualize distribution using density plot
plt + geom_density()

# Randomly sample 50 data points
sample_table <- population_table %>% sample_n(50)

# Import dataset into ggplot2
plt <- ggplot(sample_table, aes(x=log10(Miles_Driven)))

# Visualize distribution using density plot
plt + geom_density()

# Compare sample versus population means
t.test(log10(sample_table$Miles_Driven), 
       mu=mean(log10(population_table$Miles_Driven)))

# Generate 50 randomly sampled data points
sample_table <- population_table %>% sample_n(50)

# Generate another 50 randomly sampled data points
sample_table2 <- population_table %>% sample_n(50)

# Compare means of two samples
t.test(log10(sample_table$Miles_Driven), log10(sample_table2$Miles_Driven))

# Import dataset
mpg_data <- read.csv('mpg_modified.csv')

# Select only data points where the year is 1999
mpg_1999 <- mpg_data %>% filter(year==1999)

# Select only data points where the year is 2008
mpg_2008 <- mpg_data %>% filter(year==2008)

# Compare the difference between two samples
t.test(mpg_1999$hwy, mpg_2008$hwy, paired=T)

# Filter columns from mtcars dataset
mtcars_filt <- mtcars[,c("hp", "cyl")]

# Convert numeric column to factor
mtcars_filt$cyl <- factor(mtcars_filt$cyl)

# Compare means across multiple levels
aov(hp ~ cyl, data=mtcars_filt)

# Get the summary of the AOV
summary(aov(hp ~ cyl, data=mtcars_filt))

# Look at the head of mtcars
head(mtcars)

# Import dataset into ggplot2
plt <- ggplot(mtcars, aes(x=hp,y=qsec))

# Create the scatter plot
plt+geom_point()

# Calculate correlation coefficient
cor(mtcars$hp, mtcars$qsec)

# Read in used_car_data.csv dataset
used_cars <- read.csv('used_car_data.csv', stringsAsFactors=F)

# Look at head of used_cars dataset
head(used_cars)

# Import dataset into ggplot2
plt <- ggplot(used_cars, aes(x=Miles_Driven, y=Selling_Price))

# Create a scatter plot
plt + geom_point()

# Calculate correlation coefficient
cor(used_cars$Miles_Driven, used_cars$Selling_Price)

# Convert data frame into numeric matrix
used_matrix <- as.matrix(used_cars[,c("Selling_Price", "Present_Price", 
                                      "Miles_Driven")])

# Calculate correlation coefficient
cor(used_matrix)

# Create linear model (y=mx+b)
lm(qsec ~ hp,mtcars)

# Summarize linear model
summary(lm(qsec ~ hp,mtcars))

# Create linear model
model <- lm(qsec ~ hp,mtcars)

# Create yvalues
yvals <- model$coefficients['hp']*mtcars$hp + 
model$coefficients['(Intercept)']

# Import dataset into ggplot2
plt <- ggplot(mtcars, aes(x=hp, y=qsec))

# Plot scatter and linear model
plt + geom_point() + geom_line(aes(y=yvals), color="red")
