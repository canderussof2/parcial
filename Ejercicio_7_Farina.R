#Ejercicio 7 del parcial de Laboratorio de Procesamiento de Informacion 
#Meteorol?gica de Candelaria Russo Fariña

rm(list=ls())
#setwd("/home/clinux01/Escritorio/Parcial Russo Fari?a/")
#setwd("/Users/juliamindlin/Dropbox/Docencia/Laboratorio_datos/Parcial")
setwd("/Users/cande/Desktop/Labo/parcial/")
#archivo datos ejercicio7.RData Datos mensuales de temperatura maxima (?C), 
#m??nima (?C) y precipitacion (mm), para el periodo 1980-2004.

#datos mensuales me habla de 1 por mes. 1 a?o tiene 12 datos. Hay 25 a?os

#--------------------------------- i -------------------------------------------
#BIEN 
#Abrir los datos con load() y armar un dataframe con el nombre indicado y 
#ordenado que contenga los anios (?Anios?), meses (?Meses?), temperatura maxima 
#(?Tmax?), temperatura m??nima (?Tmin?) y precipitacion (?PP?).

load("datos_ejercicio7.RData")
df_anios<-data.frame(anios,meses,Tmax,Tmin,PP)
colnames(df_anios)<-c("Anios","Meses","Tmaxima","Tminima",
                      "Precipitacion")
#--------------------------------- ii ------------------------------------------
#BIEN
#Calcular la temperatura maxima promediada entre Octubre, Noviembre y Diciembre 
#para cada anio y guardarla en un vector

temp_octubre<-df_anios$Tmaxima[df_anios$Meses==10] #me quedo con los datos de la
#columna de Tmax que cumplan que en la columna meses sean 10
temp_noviembre<-df_anios$Tmaxima[df_anios$Meses==11]
temp_diciembre<-df_anios$Tmaxima[df_anios$Meses==12]

temp_prom<-c() #vector vacio
i<-1
j<-1
k<-1

while(i<=25){
  promedio<-sum(temp_octubre[i],temp_noviembre[j]+temp_diciembre[k])/3
  temp_prom<-c(temp_prom,promedio)
  i<-i+1
  j<-j+1
  k<-k+1
}

#--------------------------------- iii -----------------------------------------
#BIEN 
#Imprimir por pantalla en la misma oracion cuando ocurrio (mes y ano) la
#temperatura maxima mas alta y la temperatura m??nima mas baja.

#Temperatura maxima
temp_max<-max(df_anios$Tmaxima)
mes_temp_max<-df_anios$Meses[df_anios$Tmaxima==temp_max]
anio_temp_max<-df_anios$Anios[df_anios$Tmaxima==temp_max]

#Temperatura minima
temp_min<-min(df_anios$Tminima)
mes_temp_min<-df_anios$Meses[df_anios$Tminima==temp_min]
anio_temp_min<-df_anios$Anios[df_anios$Tminima==temp_min]

print(paste("La temperatura mas alta fue de", temp_max,"°C. Ocurrio en el mes",
            mes_temp_max,"del año",anio_temp_max,".La temperatura más baja fue de",
            temp_min,"°C. Ocurrio en el mes", mes_temp_min,"del año",anio_temp_min,"."))

#--------------------------------- iv ------------------------------------------
#NO CALCULA EL PROMEDIO ANUAL, SOLO DA EL ANIO DEL MES CON MAS LLUVIA 
#Imprimir por pantalla cual fue el ano mas lluvioso y con cuanto milimetraje

max_lluvia<-max(df_anios$Precipitacion)
anio_max_lluvia<-df_anios$Anios[df_anios$Precipitacion==max_lluvia]

print(paste("El año mas lluvioso fue el",anio_max_lluvia,"con",max_lluvia,"mm llovidos."))

#--------------------------------- iv corregido --------------------------------
datos_1980<-mean(df_anios$Precipitacion[df_anios$Anios==1980]) #prom 1980

todos_datos<-c()
for (anio in 1980:2004){
  datos_prom_anio<-mean(df_anios$Precipitacion[df_anios$Anios==anio])
  todos_datos<-c(todos_datos,datos_prom_anio)
}

maximo_lluvia<-max(todos_datos)
posic_anio_max_lluvia<-which(todos_datos==maximo_lluvia)
anio_max_lluvia<-1980+posic_anio_max_lluvia

print(paste("El año mas lluvioso fue el",anio_max_lluvia,"con",maximo_lluvia,"mm llovidos."))


