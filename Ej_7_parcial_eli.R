rm(list=ls())
matrices<-function(matriz1,matriz2){
  filas_m1<-nrow(matriz1)
  filas_m2<-nrow(matriz2)
  col_m1<-ncol(matriz1)
  col_m2<-ncol(matriz2)
  if(col_m1==col_m2 & filas_m1!=filas_m2){
    nueva_matriz<-rbind(matriz1,matriz2)
  } else if (col_m1!=col_m2 & filas_m1==filas_m2){
    nueva_matriz<-cbind(matriz1,matriz2)
  } else if (col_m1==col_m2 & filas_m1==filas_m2){
    nueva_matriz<-matriz_1+matriz_2
  } else {
    print(paste("No se puede realizar ninguna operacion"))
  }
  return(nueva_matriz)
}


matriz_1<-matrix(data=c(1:10),nrow=2,ncol=5,byrow=T)
matriz_2<-matrix(data=c(11:15),nrow=1,ncol=5,byrow=T)

matrices(matriz_1,matriz_2)

nueva_matriz<-matriz_1+matriz_2
