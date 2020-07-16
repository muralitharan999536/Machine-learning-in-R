da<-iris
da
head(da)
set.seed(1234)
train<-da[,-5]
head(train)
testmo<-da[sample(150,25),]
actualclass<-testmo[,5]
test<-testmo[,-5]
class<-iris[,5]
library(class)# package for knn
sqrt(150)
knnmodel<-knn(train,test,class,8)
knnmodel
tab<-table(knnmodel,actualclass)
tab
error<-sum(diag(tab))/sum(tab)
errorrate<-error/sum(tab)
errorrate
errorrate<-as.matrix(0,100)
for (i in 1:100)# find k value
  {
    knnmodel<-knn(train,test,class,i)
    tab<-table(knnmodel,actualclass)
    error<-sum(diag(tab))/sum(tab)
    errorrate[i]<-error/sum(tab)
}
errorrate
library(e1071)#package for tuning
t1<-tune.knn(train,class,k=1:13)
summary(t1)
plot(t1)
  