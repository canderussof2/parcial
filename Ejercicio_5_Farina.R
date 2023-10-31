#Ejercicio 5 del parcial de Laboratorio de Procesamiento de Informacion 
#Meteorol?gica de Candelaria Russo Fari?a

rm(list=ls())
#setwd("/home/clinux01/Escritorio/Parcial Russo Fari?a/")
setwd("/Users/cande/Desktop/Labo/parcial/")

#contienen datos mensuales de las componentes zonal y meridional del viento 
#(m/s) global para el anio 2017. Las latitudes comprendidas van de ???90 a 90 y 
#las longitudes van de 0 a 359. La resolucion es de 2,5.

#--------------------------------- i -------------------------------------------
#BIEN 
#Abrir los datos con la funcion ?load()? y guardar en un array con las 
#dimensiones correspondientes de forma tal que una dimension contenga las 
#latitudes, otra las longitudes y la ultima los meses

load("datos_u_ejercicio5.RData")
load("datos_v_ejercicio5.RData")

latitudes<-seq(-90,90,by=2.5)
longitudes<-seq(0,359,by=2.5)
meses<-1:12

#PRIMERA DIMENSION: LATITUDES
#SEGUNDA DIMENSION: LONGITUDES
#TERCERA DIMENSION: MESES

datos_u<-array(data=u,dim=c(73,144,12))
datos_v<-array(data=v,dim=c(73,144,12))

#--------------------------------- ii ------------------------------------------
#INTERPRETA MAL LA CONSIGNA, NUNCA SE PIDE CALCULAR PROMEDIOS, NO CALCULA LA VELOCIDAD DEL VIENTO
#Calcular la velocidad del viento en cada punto de grilla y tiempo y guardar en 
#un array.

#ACLARACI?N: no llegue a calcular la velocidad del viento

veloc_viento_u_ptogrilla<-apply(datos_u,c(3),mean)

veloc_viento_u_temporal<-apply(datos_u,c(1,2),mean) #ya hice el promedio temporal
veloc_viento_v_temporal<-apply(datos_v,c(1,2),mean)

veloc_viento_prom<-c()
j<-1
for(i in 1:144){
    veloc_viento<-sqrt((veloc_viento_u_temporal[i])**2+(veloc_viento_v_temporal[j])**2)
    j<-j+1
    veloc_viento_prom<-c(veloc_viento_prom,veloc_viento)
  }

veloc_viento_prom<-c()
i<-1
j<-1
while(i<=144){
  veloc_viento<-sqrt((veloc_viento_u_temporal[i])**2+(veloc_viento_v_temporal[j])**2)
  veloc_viento_prom<-c(veloc_viento_prom,veloc_viento)
  i<-i+1
  j<-j+1
}

#--------------------------------- ii correegido -------------------------------
valores_u_al_cuadrado<-c()
for (u in datos_u){
  u_al_cuadrado<-u^2
  valores_u_al_cuadrado<-c(valores_u_al_cuadrado,u_al_cuadrado)
}

valores_v_al_cuadrado<-c()
for (v in datos_v){
  v_al_cuadrado<-v^2
  valores_v_al_cuadrado<-c(valores_v_al_cuadrado,v_al_cuadrado)
}

veloc_viento <- sqrt(valores_u_al_cuadrado+valores_v_al_cuadrado)
#--------------------------------- iii -----------------------------------------
#QUE DIMENSIONES DEBERIA TENER veloc_viento? HASTA AHORA EN EL CODIGO ES UN ESCALAR
#LAS DIMENSIONES DEL NUEVO ARRAY DEBERIAN SER (73,144,12,3) Y LOS NOMBRES ESTAN BIEN
#PERO FALTA LA DINMENSION VARIABLE, definidaa como 
#variable <- c('u','v','velocidad') 

#Almacenar en un array los datos de u, v y la velocidad del viento. Nombrar las 
#posiciones de las dimensiones del array con la latitud, longitud y mes correspondiente.

#ACLARACI?N: no llegue a hacer el ii pero igualmente segu? como si estuviera hecho
array_todos<-array(data=c(datos_u,datos_v,veloc_viento),dim=c(73,144,12))
dimnames(array_todos)<-list(latitudes,longitudes,meses)

#--------------------------------- iv ------------------------------------------
#ENCUENTRA EL MAXIMO DE LAS COMPONENTES, PERO NO EL MAXIMO DE LA VELOCIDAD, 
#INCLUSO ENTENDIENDO QUE LOS ITEMS ANTERIOR NO ANDUVIERON, EL CODIGO  DEBERIA BUSCAR
#max(array_todos[variable=='velocidad'])  - 0.0/0.3

#Encontrar el punto y el mes en que la velocidad fue maxima e imprimir un mensaje 
#con el resultado en el siguiente formato: ?La velocidad maxima de viento se 
#registro el mes XMes en la latitud XLat (N/S) y longitud XLon W?.

maximo<-max(array_todos)
posic_max<-which(array_todos==maximo,arr.ind = T)
XLat<-posic_max[1]
XLon<-posic_max[2]
XMes<-posic_max[3]

print(paste("La velocidad maxima del viento se registr? en el mes",XMes,
            "en la latitud", XLat,"(N/S) y longitud",XLon,"W" ))
