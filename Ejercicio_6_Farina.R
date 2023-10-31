#Ejercicio 6 del parcial de Laboratorio de Procesamiento de Informacion 
#Meteorol?gica de Candelaria Russo Fari?a

rm(list=ls())
#setwd("/Users/juliamindlin/Dropbox/Docencia/Laboratorio_datos/Parcial")
setwd("/Users/cande/Desktop/Labo/parcial/")

#NO ARMA LA FUNCION PARA EL FORMATO CORRECTO
#Escribir una funcion que reciba una fecha con el formato ?DD-MM-AAAA? y devuelva
#una secuencia de caracteres indicando a que estacion corresponde. La salida 
#puede ser ?DEF?, ?MAM?,?JJA? o ?SON?. 

#Aclaracion: no supe como poner el formato de las fechas bien. El codigo corre 
#ingresando fehas de este formado DDMMAAAA, ejemplo 06082001

fecha<-function(fecha){
  long_fecha<-nchar(fecha)
  mes<-as.numeric(substr(fecha,long_fecha-5,long_fecha-4))
  if(mes==12 | mes==1 | mes==2 ){
    verano<-"DEF"
  } else if (mes==3 | mes==4 | mes==5){
    otono<-"MAM"
  } else if (mes==6 | mes==7 | mes==8){
    inviero<-"JJA"
  } else if(mes==9 | mes==10 | mes==11){
    primavera<-"SON"
  }
}

#--------------------------------- i -------------------------------------------
#BIEN, ACARREA EL ERROR DEL  FORMATO
#Escribir un codigo que pida el ingreso por consola de la fecha e imprima el mensaje:
#?La fechaingresada corresponde a la estacion ?DEF/MAM/JJA/SON? segun corresponda 
#utilizando la funcion.
#El codigo debe corroborar que los datos ingresados son correctos y volver a pedir 
#el ingreso de un valor correcto en caso contrario.

ingreso<-as.numeric(readline("Ingrese una fecha "))
while(is.na(ingreso)){
  if(!is.na(ingreso)){
    break
  }
  ingreso<-as.numeric(readline("Ingrese nuevamente una fecha "))
}
ingresos<-fecha(ingreso)
print(paste("La fecha ingresada corresponde a la estacion",ingresos))

#--------------------------------- ii ------------------------------------------
#BIEN, ACARREA EL ERROR DEL FORMATO
#Generar una lista llamada fechas con cuatro fechas y aplicar la funcion a la lista,
#generando una nueva lista estaciones que contenga estaciones correspondientes a 
#las cuatro fechas de la lista fechas.

fechas<-list(06082001,14121968,24022006,20111968)
estaciones<-lapply(fechas, fecha)
names(estaciones)<-fechas
#Aclaracion: se deberia usar la funcion lapply que es lo mismo que la funcion 
#apply pero para listas. No me esta saliendo
