The downloaded binary packages are in
C:\Users\Chispita\AppData\Local\Temp\Rtmp8oT6T4\downloaded_packages

| You can exit swirl and return to the R prompt (>) at any time by pressing the Esc
| key. If you are already at the prompt, type bye() to exit and save your progress.
| When you exit properly, you'll see a short message letting you know you've done so.

| When you are at the R prompt (>):
  | -- Typing skip() allows you to skip the current question.
| -- Typing play() lets you experiment with R on your own; swirl will ignore what you
| do...
| -- UNTIL you type nxt() which will regain swirl's attention.
| -- Typing bye() causes swirl to exit. Your progress will be saved.
| -- Typing main() returns you to swirl's main menu.
| -- Typing info() displays these options again.


##getwd()
##dir()

##Download:
##variable<-"https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv"
##Read file:

##jpg
## install package library(jpeg)
## variable<-"https://d396qusza40orc.cloudfront.net/getdata%2Fjeff.jpg"
## dst2 = 'C:/Users/Chispita/Documents/Data Science/Getting and Cleaning Data/q2.jpg' ##q2.jpg is how the file will be saved 
## download.file(variable, dst2, mode = 'wb')
## data2 = readJPEG(dst2, native = TRUE)

##zip
##library(reshape2)
##variable<-"https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
##dst2 = 'C:/Users/Chispita/Documents/Data Science/Getting and Cleaning Data/data2/getdata_dataset.zip'
##download.file(variable, dst2, mode="wb") 
##Go through "Open Windows explorer" Right click the folder ziped and "extract all" to unzip it. set the working directory at the right place 
##doc<- read.table("file name + extension")
 ## Or doc<-read.table("household_power_consumption.txt",header = TRUE, sep= ";") 
 ## Or doc<- read.table("household_power_consumption.txt", header=T, sep=";", na.strings="?")
##xml:
##library(XML)
##doc <- xmlTreeParse("./data/restaurants.xml", useInternal = TRUE)
##rootNode <- xmlRoot(doc)

##CSV
##variable<-"https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FGDP.csv"
##dst2 = 'C:/Users/Chispita/Documents/Data Science/Getting and Cleaning Data/q3.csv' ##q3.csv is how will be saved
##download.file(variable, dst2, mode = 'wb') ## Or just download.file(variable, dst2) ## certain Web applied method= "curl"
##doc<- read.csv("file name + extension")
##Repair headers: when having certain comments before the header or columns skip spaces etc:
## fread {data.table} similar as read.table but faster
  ## if you have http source: gdp = fread(dst2, skip=5, nrows = 190, select = c(1, 2, 4, 5), col.names=c("CountryCode", "Rank", "Economy", "Total")) ##dst2 come from https source
  ## if you have file as a source: gdp = fread("file name with extension", skip=5, nrows = 190, select = c(1, 2, 4, 5), col.names=c("CountryCode", "Rank", "Economy", "Total")) ## file name as source
  ## See file in Text to see spaces and problems: skip the first 5 rows, show only column 1,2,4,5 and names them as "CountryCode", "Rank", "Economy", "Total"
  ## head(gdp) to show new looking


##xlsx
##libreary(xlsx) ##install and after that install rJava and xlsxjars
##doc <- read.xlsx("./data/gas.xlsx", sheetIndex = 1, rowIndex = rowIndex,colIndex = colIndex, header = TRUE)

##BZ2
##doc <- read.csv(bzfile("data/repdata-data-StormData.csv.bz2"))


##install package dplyr if you want to friendly: swirl() package trains on this. might need "LearnBayes" "stats" "base"
##install package tidyr to to fix messy data to tidy: e.g gather(students, sex, count, -grade) and separate(res,sex_class,c("sex", "class"))  
##install package "nycflights13"
##library(nycflights13)
##dim(flights)
 ##Fit <- tbl_df(flights) ; Only shows what fits on screen, the rest as text
 ##fit print "fit" to see how it looks
 ##If use "flights" it shows everything vs. "fit" (tbl_df(flights))
##filter(flights, month == 1, day == 1)
##slice(flights, 1:10); 10 rows
##arrange(flights, year, month, day); arrange(flights, desc(arr_delay))
##select(flights, year, month, day);select(flights, year:day);select(flights, -(year:day))
  ##select<-select(merge,`Long Name`, `Income Group`,Total) ##symbol "`" to recognize two words as variable
##distinct(select(flights, tailnum));shows unique values per column; distinct(select(flights, origin, dest))
##mutate();add columns: mutate(flights,gain = arr_delay - dep_delay,speed = distance / air_time * 60)
##summarise(flights,delay = mean(dep_delay, na.rm = TRUE)); sumirizes data to a single row
##destinations <- group_by(flights, dest)
##summarise(destinations,planes = n_distinct(tailnum),flights = n())

##by_tailnum <- group_by(flights, tailnum)
##delay <- summarise(by_tailnum,
##                   count = n(),
##                   dist = mean(distance, na.rm = TRUE),
##                   delay = mean(arr_delay, na.rm = TRUE))
                      ## count means count of rows.
##quantile(delay$count, probs = 0.99) it will show # of rows within 99% of data. if want to know 1% check count>336.14 of 99%
    ##top_counts <- filter(delay, count > "number from quantile")
##quantile(delay$count,na.rm=TRUE) Shows reading at 0%, 25%, 50%, 75%, 100%
##delay <- filter(delay, count > 20, dist < 2000)
##ggplot(delay, aes(dist, delay)) +
##  geom_point(aes(size = count), alpha = 1/2) +
##  geom_smooth() +
##  scale_size_area()

library(datasets)
## or data<-read.csv("data.csv"TRUE,",") true if you have header, and "," for comma delimited
## if you have a column with letters then: data<-read.csv("data.csv",TRUE,",")
data(mtcars)
summary(mtcars)
str(mtcars)
head(mtcars) ##if you want to see more than 6 rows: head(mtcars,10)
tail(mtcars)
nrows(mtcars)
ncol(mtcars)
cor(mtcars$disp,mtcars$qsec) ##correlation between variables

#linear model with single variable
lm(mpg ~ wt, data=mtcars) # lm(outcome~predictor, dataset) from the datasets package and fit the regression model with mpg as the outcome and weight as the predictor. Give the slope coefficient
summary(lm(mpg ~ wt, data=mtcars))
#The intercept is the expected mean value of Y when all X=0, which means when the reidual has mean = zero

#Predict:
fit<-lm(mpg ~ wt, data=mtcars)
newdata <- data.frame(wt=mean(mtcars$wt))
# Use "confidence" intervals to tell you about how well you have determined the mean
predict(lm(mpg ~ wt, data=mtcars), newdata, interval="confidence") #predicts lower and upper value at 95% confidence interval
# Use "prediction" interval to tell you where you can expect to see the next data point sampled
predict(lm(mpg ~ wt, data=mtcars), newdata, interval="prediction") #predicts lower and upper value at 95% prediction interval

#Linear model with multiple-variables
lm(formula = mpg ~ ., data = mtcars)
summary(lm(formula = mpg ~ ., data = mtcars))
#based on summary: for every 1% increase in "cyl", we expect a .111144 decrease in mpg, holding all other variables constant
#based on summary: for every 1% increase in "disp", we expect a .01334 decrease in mpg, holding all other variables constant
#Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1. The last column show this. In this case, all show "" except one with ".", which means at 0.1 alpha level is the t-test of "wt" significant
#if we do only:summary(lm(mpg ~ wt, data=mtcars)), the coefficient for "wt" = -5.3445. Thus, decreases more than having all the variables (-3.71) 
#Hipothesis Testing. To see the new mean is equal to the one from the population
t.test(mtcars$mpg, alternative="two.sided",mu=20 ,conf.level = 0.95)
  #if p-value < alpha, typically 5% or 0.05 then reject Ho.Otherwise, you accept the two means are equivalent
t.test(mtcars$mpg, alternative="less",mu=20 ,conf.level = 0.95) #evaluate if Ho<20, in this case accept because p-value>alpha
t.test(mtcars$mpg, alternative="greater",mu=20 ,conf.level = 0.95) #evaluate if Ho>20, in this case accept because p-value>alpha
sum(mtcars$cyl>4) ##Counts how many cars are > 4 cyl
table(mtcars$cyl>4,mtcars$carb) ##Counts how many cars are > 4 cyl and number of cars by type of carb
names(mtcars) ## to see name of columns
names(mtcars)[2:3] ## to see from columns 2 to 3 
varNames <- names(mtcars) ##Shows names of the columns
varNames[[2]] ## shows the name of 2nd column
dim(mtcars) ## (rown,columns)
table(mtcars$cyl) ##to see the categories and quantities under "cyl"
lapply(mtcars, class) ## to see type of variables 
str(mtcars) #metrics
str(mtcars$hp) ##metrics per column
summary(mtcars$disp) ##metrics per column, e.g. "disp"
mean(is.na(mtcars$disp))## to see the percentage of empty values in a column
## $d is the diagonal, and the 1st values represents the column's highst dominance

##How to simplify data when too many rows?
svd(mtcars)
## to add a new column with a calculation: mtcars$newColumn<-(mtcars$mpg+mtcars$hp)
## to merge data frames based on a column: merge(Dataframe1,dataframe2,by.x="columnName1",by.y="columnName2")
##Example merge data:
  ##fileurl3a = 'https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FGDP.csv'
  ##dst3a = '/Users/zhusiqi/Desktop/coursera/R_jhu/geting_and_cleaning_data/week3/q3a.csv'
  ##fileurl3b = 'https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FEDSTATS_Country.csv'
  ##dst3b = '/Users/zhusiqi/Desktop/coursera/R_jhu/geting_and_cleaning_data/week3/q3b.csv'
  ##download.file(fileurl3a, dst3a, mode = 'wb') ##sometimes without mode 'wb'
  ##download.file(fileurl3b, dst3b, mode = 'wb') ##sometimes without mode 'wb'
  ##gdp = fread(dst3a, skip=5, nrows = 190, select = c(1, 2, 4, 5), col.names=c("CountryCode", "Rank", "Economy", "Total"))
  ##edu = fread(dst3b) ##fread() allows you to clean the data
  ##merge = merge(gdp, edu, by = 'CountryCode')


class(mtcars) ##type of class, normally data frame
to_see_certain_columns<-mtcars[,c("mpg","hp")]
to_see_certain_rows<-grep("^10", mtcars$mpg, value = TRUE) ## Shows cars with mpg that starts with "10"
 ##grep("^.+(s)$", gdp$Economy, value = TRUE) ## to see rows that end with certain string of characters, eg."s" Package: grep {base} 
 ##grep("Fiscal year end: June", merge$`Special Notes`) ## to see rows that contain certain string o characters in a column eg."Fiscal year end: June"   
 ##z<-grep("Fiscal year end: June", merge$`Special Notes`)
 ##sum(z) ## to count "TRUE" values from function grep("Fiscal year end: June", merge$`Special Notes`)
sum(is.na(mtcars$hp)) ## counts how many "NA" are under column "hp"
mtcars[mtcars$hp>170,] ##to see certain rows by filtering a column
mtcars[mtcars$hp>170|mtcars$cyl>6,]  ## to see certain rows by filtering 2 columns "|" means "or", "&" means "and"
  ##Or use Dplyr package, filter(mtcars, hp>170 & cyl>6)
table(mtcars$hp,mtcars$cyl) ## show two dimential table, row = hp, vs. col = cyl
table(mtcars$cyl %in% c(6)) ## shows number cars with 6 cylinders
stat2<-subset(mtcars,hp<170)

##Clustering data
subset(mtcars, cyl== 8, select = c(hp, wt)) ## another subset
dist(subset(mtcars, cyl== 8, select = c(hp, wt))) ##calc dist between all points
distance<-dist(subset(mtcars, cyl== 8, select = c(hp, wt)))
subset<-subset(mtcars, cyl== 8, select = c(hp, wt))
cluster<-hclust(distance)
cluster ##enter cluster and press enter. it displays info
plot(cluster)
## to create a heatmap
Distance_adjusted<-as.matrix(distance) ## to make "distance" a matrix
heatmap(Distance_adjusted)
##Clustering - Measure distance for data in relation to centroids
cx<-c(170,200,300) ##eyeball centroids based on chart, create a vector
cy<-c(3.7,5.2,3.6) ##eyeball centroids based on chart, create a vector
cbind(cx,cy) ## create a matrix with vectors
points(cx,cy,col=c("red","orange","purple"),pch=3,cex=2,lwd=2) ##Plot centroids (3)
subset<-subset(mtcars, cyl== 8, select = c(hp, wt))
x<-subset$hp ## create coordinate "x" from subset
y<=subset$wt ## create coordinate "y" from subset
## Create a function that cal distance between centroids and points from columns (points):
mdist<-function(x,y,cx,cy){
  distTmp <- matrix(NA,nrow=3,ncol=14) ##14 are the titles or categories under mtcars, cyl== 8, select = c(hp, wt), or 14 different cars 
  distTmp[1,] <- (x-cx[1])^2 + (y-cy[1])^2
  distTmp[2,] <- (x-cx[2])^2 + (y-cy[2])^2
  distTmp[3,] <- (x-cx[3])^2 + (y-cy[3])^2  
  return(distTmp)
}
mdist(x,y,cx,cy) ## shows distances
calc<-mdist(x,y,cx,cy)
apply(calc,2,which.min) ## Shows the points (14) where they belong per centroid (1,2,3)
newClust<-apply(calc,2,which.min)
cols1<- c("red","orange","purple")
points(x,y,pch=19,cex=2,col=cols1[newClust])
## "A"
tapply(x,newClust,mean) ##Calc mean with the new arrangement for "x", which is the new cx
tapply(y,newClust,mean) ##Calc mean with the new arrangement for "y", which is the new cy
## that will give us the new coordinates "cx" and "cy" for the new centroid
newCx<-tapply(x,newClust,mean)
newCy<-tapply(y,newClust,mean)
cbind(newCx,newCy)
points(newCx,newCy,col=cols1,pch=8,cex=2,lwd=2 ## new centraids added to the plot
mdist(x,y,newCx,newCy) ##shows distances to the new centroids
calc2<-mdist(x,y,newCx,newCy)
apply(calc2,2,which.min) ## Shows the points (14) where they belong per centroid (1,2,3) - the new centroid
newClust2<-apply(calc2,2,which.min)
points(x,y,pch=19,cex=2,col=cols1[newClust2]) ## replotting in case points change colors (new cluster) based on new centroids
##if points don't change colors based on new centroids, then this is the end, otherwise we need to repeat from "A" to "B" until points don't change
## "B"

## short method instead of "A" to "B":
kmeans(subset,centers=3) ## Subset is the data. Take the centroid from the output
## create cx and cy from the output:
cx<-c(263.8000,187.1429,150)
cy<-c(3.899000,4.219857,3.477500)
cbind(cx,cy)
points(cx,cy,col=c("red","orange","purple"),pch=3,cex=2,lwd=2)

##To use Singular Value Decomposition of a Matrix to simplify data
svd(mtcars) especially used when having multiple columns with correlated variables
svd(scale(mtcars))
Function svd, $d = diagonal, it shows all the columns in order of dominance


## Dplyr package. rename(mtcars, hp=HorsePower) ## it will change the name of the column
## Dplyr package. deter<-mutate(mtcars,  efficiency= factor(1*(hp>170),  labels=c("Weak","Powerful"  ) 
        ##effective<-group_by(deter,efficiency )
        ##effective
        ##summarize(effective,hp=mean(hp),mpg=max(mpg),cyl=median(cyl))
        ##merge() ## to joint multiple tables based on a certain variable.
stat3<-stat2[1:3,"hp"]## to capture only 3 rows de los hp<170, if multi columns: c("white","red")
stat3 ## to print only 3 rows hp<170
dim(stat2) ## shows total rows and columns, but rows are interesting to new how many records
##if you want to simplify then >attach(mtcars), that allows you write "mpg instead of mtcars$mpg
mean(mtcars$mpg[mtcars$cyl==8],na.rm=TRUE) ##eliminates NA's
mean(mtcars$mpg)
mean(mtcars$mpg>22) ##to calculate the mean after filtering values
median(mtcars$mpg)
max(mtcars$mpg)
min(mtcars$mpg)
sd(mtcars$mpg)
range(mtcars$mpg)
rowMeans(mtcars[,2:3])
quantile(mtcars$mpg, c(.025,.975)) ## alpha=5%

##Statistics

#Question 2
#Suppose that diastolic blood pressures (DBPs) for men aged 35-44 are normally distributed with a mean of 80 (mm Hg) and a standard deviation of 10. About what is the probability that a random 35-44 year old has a DBP less than 70?
pnorm(targetDBP, mean = ??, sd = ??)

#Question 3
#Brain volume for adult women is normally distributed with a mean of about 1,100 cc for women with a standard deviation of 75 cc. What brain volume represents the 95th percentile?
qnorm(quantile, mean = ??, sd = ??)

#Question 4
#Refer to the previous question. Brain volume for adult women is about 1,100 cc for women with a standard deviation of 75 cc. Consider the sample mean of 100 random adult women from this population. What is the 95th percentile of the distribution of that sample mean?
SE <- sd/sqrt(n)
qnorm(quantile, mean = mean, sd = SE)

#Question 5
#You flip a fair coin 5 times, about what's the probability of getting 4 or 5 heads?
p <- 0.5
n <- 5
quantile <- 3 # 4 or 5 out of 5, with lower
pbinom(quantile, size=n, prob=p, lower.tail = FALSE)

#Question 6
#The respiratory disturbance index (RDI), a measure of sleep disturbance, for a specific population has a mean of 15 (sleep events per hour) and a standard deviation of 10. They are not normally distributed. Give your best estimate of the probability that a sample mean RDI of 100 people is between 14 and 16 events per hour?
mean <- 15
sd <- 10
n <- 100
SE <- sd/sqrt(n)
left <- 14
right <- 16
percentageLeft <- pnorm(left, mean = mean, sd = SE) * 100
percentageRight <- pnorm(right, mean = ??, sd = SE) * 100
percentageRight - percentageLeft

#Question 7
#Consider a standard uniform density. The mean for this density is .5 and the variance is 1 / 12. You sample 1,000 observations from this distribution and take the sample mean, what value would you expect it to be near?
quantile <- 0.5
mean <- 0.5
sd <- 1/12
n <- 1000
SE <- mean/sqrt(n)
qnorm(quantile, mean = mean, sd = SE)

#Question 8
#The number of people showing up at a bus stop is assumed to be Poisson with a mean of 5 people per hour. You watch the bus stop for 3 hours. About what's the probability of viewing 10 or fewer people?
t <- 3
lambda <- 5
quantile <- 10
ppois(quantile, lambda = t * lambda)

##p-value
p-value = t.test(data$before, data$later, paired=T, var.equal=T, alt="two.sided")$p.value ## paired=same number of rows for the 2 columns. 2 sides of gauss curve

##p-value
# parent have 8 kids, 7 girls and 1 boy, 1 sided: Ha>6; 2 sided: Ha<=7
#2 sided t-test = lower.tail=TRUE, la colita. de lo contrario es el area grande bajo curva gauss
Ho<-7
n=8
prob<-0.5
pbinom(Ho, size=n, prob=prob, lower.tail=T) ## H: 0.5 (prob),Ho>2
#1 sided t-test
Ho<-6
n=8
prob<-0.5
pbinom(Ho, size=n, prob=prob, lower.tail=F)

##p-value
rate <- 1/100 ## benchmark, what's considered a reference
errors <- 10
days <- 1787
poisson.test(errors, T = days, r = rate, alt="less")$p.value

##p-value
#1 sided t-test
n_y <- 9 # subjects treated
n_x <- 9 # subjects placebo
??_y <- 1.5# kg/m2 std.dev. treated 
??_x <- 1.8# kg/m2 std.dev. placebo 
??_y <- -3#  kg/m2 average difference treated
??_x <- 1#  kg/m2 average difference placebo
??_p <- (((n_x - 1) * ??_x^2 + (n_y - 1) * ??_y^2)/(n_x + n_y - 2))
pt((??_y - ??_x) / (??_p * (1 / n_x + 1 / n_y)^.5), df=n_y + n_x -2,lower.tail=F)
#Two sided t-test
n_y <- 9 # subjects treated
n_x <- 9 # subjects placebo
??_y <- 1.5# kg/m2 std.dev. treated 
??_x <- 1.8# kg/m2 std.dev. placebo 
??_y <- -3#  kg/m2 average difference treated
??_x <- 1#  kg/m2 average difference placebo
??_p <- (((n_x - 1) * ??_x^2 + (n_y - 1) * ??_y^2)/(n_x + n_y - 2))
pt((??_y - ??_x) / (??_p * (1 / n_x + 1 / n_y)^.5), df=n_y + n_x -2,lower.tail=T)

##Power.t.test
#Researchers would like to conduct a study of 100 healthy adults to detect a four year mean brain volume loss of .01 mm3  
#Assume that the standard deviation of four year volume loss in this population is .04 mm3  
#About what would be the power of the study for a 5% one sided test versus a null hypothesis of no volume loss?
power.t.test(n=100, delta=.01, sd=.04, alt="one.sided", type="one.sample", sig.level=.05)

##Confidence Interval (alpha=5%)
n <- 9
mu <- 1100
sd <- 30
t <- qt(1-0.05/2, n-1)
mu + c(-1, 1) * t * sd / sqrt(n)

##Simple chart
par(mfrow=c(1,2),mar=c(4,4,2,1),oma = c(0, 0, 2, 0)) ##Creates 2 charts per view side by side
with(mtcars, plot(mpg, hp))
text(mean(mtcars$mpg),max(mtcars$hp),"Performance") ## mean(mtcars$mpg),max(mtcars$hp) determine the coordinates to position label "Performance"
abline(h=200,lwd=2,lty=2,col="blue") ##horizontal line
title(main="Performance")
bigcyl<-subset(mtcars,cyl==8)
points(bigcyl$mpg,bigcyl$hp,col="blue",pch=17)
notbigcyl <- subset(mtcars, cyl!=8) ## diff from 8 cyl
points(notbigcyl$mpg,notbigcyl$hp,col="red",pch=8)
legend("topright",pch=c(17,8),col=c("blue","red"),legend=c("8 cyl","Other cyl"))
abline(v=median(mtcars$mpg),lty=2,lwd=2)
##if using multiple charts under same view, here is the main title:
mtext("Ozone and Weather in New York City", outer = TRUE)
  
##Other chart
par(mfrow=c(1,1),mar=c(4,4,2,1),oma = c(0, 0, 2, 0)) ##Creates 1 charts per view side by side (to correct in case you had 2 side by side)
boxplot(mpg~cyl, mtcars,xlab = "Cylinder",ylab = "mpg", col.axis = "blue", col.lab = "red")
title(main="Performance")
##Other chart
boxplot(mtcars$disp,mtcars$hp)
boxplot(log10(mtcars$disp),log10(mtcars$hp)) ##to zoom in when having too many points and the boxplot looks to small, use Log10 to amplify  

##Other system for Charts: GGPLOT2
qplot(mpg, disp, data = mtcars) ##to see relationsship between two variables 
qplot(mpg, disp, data = mtcars, color=cyl) ## To see relationship between two variables and color by a 3rd variable: cyl 
qplot(mpg, disp, data = mtcars, color=cyl,geom=c("point","smooth")) ## geoms are the type of shape for dots in charts, and grey area is the 95% confidence level
##see the difference when making the variables factor:
mtcars$mpg <- as.factor(mtcars$mpg)
mtcars$disp <- as.factor(mtcars$disp)
mtcars$cyl <- as.factor(mtcars$cyl)
qplot(mpg, disp, data = mtcars) ##to see relationsship between two variables 
qplot(mpg, disp, data = mtcars, color=cyl) ## To see relationship between two variables and color by a 3rd variable: cyl 
qplot(mpg, disp, data = mtcars, color=cyl,geom=c("point","smooth")) ## geoms are the type of shape for dots in charts, and grey area is the 95% confidence level

(ggplot(mtcars, aes(disp, mpg)))+ geom_point(aes(colour = factor(cyl)))
(qplot(disp, mpg, data = mtcars, facets = . ~ cyl))+geom_point(aes(size = 3))
##Line chart
ggplot(data=mtcars, aes(x=disp, y=mpg))+geom_line()

##Bar chart
ggplot(data=mtcars,
       aes(x=reorder(cyl, mpg), y=cyl, fill=mpg)) +
  geom_bar(stat="identity") +
  coord_flip() + 
  xlab("Type") +
  ylab("mpg") +
  theme(legend.position="none")

##Kind of Scatter Plot:
## Or assign gplot to a variable "g": g<-qplot(disp, mpg, data = mtcars, facets = . ~ cyl)
## Thus, it's easier: g +  geom_point(aes(size = 3)
## Or function ggplot:
## g<-ggplot(mtcars,aes(disp,mpg))
## g+geom_point()+geom_smooth(method="lm") + facet_grid(.~cyl) ##facets = Panels
## everything in 1 chart:
## g + geom_point(aes(color = factor(cyl)),size = 4, alpha = 1/2)+geom_smooth(method="lm") + labs(title="Test!") + labs(x="Displacement", y="Mileage")
## everything in panels:
## g + geom_point(aes(color = factor(cyl)),size = 4, alpha = 1/2)+geom_smooth(method="lm") + labs(title="Test!") + labs(x="Displacement", y="Mileage")+facet_grid(.~cyl)  
## everything in panels, two variables as a function of two other variables:
## g+geom_point()+facet_grid(gear~cyl,margins=TRUE)+geom_smooth(method="lm",se=FALSE,size =1, color="black")+labs(x="Displacement",y="Mileage",title="Test")  
## qplot(disp,mpg,data=mtcars, color=cyl, facets=.~cyl) + geom_smooth(method="lm")
##Kind of histogram:
qplot(mpg,data=mtcars,facets =cyl~.,binwidth=2)

mtcars[order(mtcars$mpg),] ## ascending, if "-" mtcars$mpg descending
mtcars[order(mtcars$mpg,-mtcars$hp),] ## multiple columns ordered
stat<-split(mtcars,mtcars$cyl) ## to see an element as a function of other (dataset, cyl)
stat2<-split(mtcars$hp,mtcars$cyl)
## if you want to see total "hp" by cyl: lapply(stat,sum)
## if you want to see total count (cars) by cyl: lapply(stat,nrow)
## if you want to convert list to data frame: as.data.frame(lapply(stat,nrows))
countcars<-aggregate(. ~ cyl, data=mtcars, FUN=length) ##FUN = length, function counts cars per cyl. FUN=sum, sums values
countcars <- count(mtcars, c('cyl')) ## (plyr package) counts total cars without taking into account type of cyl
## Split by date:
doc$date <- as.Date(doc$date,format = "%m/%d/%Y")
stat<-split(doc,doc$date)
sapply( stat, function(x) sum(x$steps) )

## How to replace NA's with mean: (3 represents NA's under column 3, doc2 equals doc2<-read.csv("activity2.csv"))
doc$date <- as.Date(doc$date,format = "%m/%d/%Y")
for(i in 3:ncol(doc2)){
  doc2[is.na(doc2[,i]), i] <- mean(doc2[,i], na.rm = TRUE)
}

##To cut rows in intervals (histograms), library(Hmisc)
merge$RankGroups <- cut2(merge$Rank, g=5) ## cut in 5 intervals 
table(merge$RankGroups, merge$`Income Group`)
print(stat) ##new look of data as a function of "cyl" after split
##barplot
sapply(stat, function(x) mean(x$mpg) ) ## calculates the mean on column "mpg" based on "split" (cyl)
barplot(sapply( stat, function(x) sum(x$disp) )) ## plot of total disp by cyl
barplot((sapply( stat, function(x) sum(x$disp))),col="green",xlab="dose",ylab="length",main="Analysis")
lapply(stat,function(x) colMeans(x[,c("mpg","disp","hp")])) ##calculates the mean on each column of vecto "c" based on "split" (cyl)
tapply(mtcars$hp, mtcars$cyl, mean) ## it will show average hp per group of cylinder

str(stat) ## new metrics based on "split" (cyl) over all the other variables
plot(x=mtcars$mpg, y=mtcars$hp)
mtcars[,2]<-as.numeric(mtcars[,2]) ## column 2
hist(mtcars[,2]) ##histogram stat all rown, column 2
}

mns = NULL
for (i in 1 : 1000) mns = c(mns, mean(runif(40)))
hist(mns)
