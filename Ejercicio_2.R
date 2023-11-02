rm(list=ls())
setwd("/Users/cande/Desktop/Labo/parcial/")

n<-as.numeric(readline("Ingrese un numero: "))

while(is.na(n)){
  # if(!is.na(n)){
   # break
  #}
  n<-as.numeric(readline("Ingrese un nuevamente numero: "))
}

#-------------------------------------------------------------------------------
#Usando CICLO FOR

serie_fibonacci<-c()
for(i in 0:(n+1)){
  if(i==0){
    fibonacci<-0
  } else if (i==1){
    fibonacci<-1
  } else {
    fibonacci<-serie_fibonacci[i-1]+serie_fibonacci[i-2]
  }
  serie_fibonacci<-c(serie_fibonacci,fibonacci)
}
print(serie_fibonacci)

#-------------------------------------------------------------------------------
#Usando CICLO WHILE
serie_fibonacci<-c()
i<-0
while(i<(n+2)){
  if(i==0){
    fibonacci<-0
  } else if (i==1){
    fibonacci<-1
  } else {
    fibonacci<-serie_fibonacci[i-1]+serie_fibonacci[i-2]
  }
  serie_fibonacci<-c(serie_fibonacci,fibonacci)
  i<-i+1
  
}
print(serie_fibonacci)

#-------------------------------------------------------------------------------
#Usando CICLO REPEAT

serie_fibonacci<-c()
i<-0
repeat{
  if(i==(n+2)){
    break
  }
  if(i==0){
    fibonacci<-0
  } else if (i==1){
    fibonacci<-1
  } else{
    fibonacci<-serie_fibonacci[i-1]+serie_fibonacci[i-2]
  }
  serie_fibonacci<-c(serie_fibonacci,fibonacci)
  i<-i+1
}
print(serie_fibonacci)







