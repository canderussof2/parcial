rm(list=ls())
temp<-rnorm(120,mean=25,sd=0.5)
temperatura<-array(data=c(temp),dim=c(120,1))
class(temperatura)
pp<-rnorm(120,mean=67,sd=0.5)
precip<-array(data=c(pp),dim=c(120,1))
anios<-array(data=rep(2000:2009,c(12,12,12,12,12,12,12,12,12,12)),dim=c(120,1))
meses<-array(data=rep(1:12,12),dim=c(120,1))

datos<-cbind(anios,meses,temperatura,precip)
colnames(datos)<-c("Anios","Meses","Temperatura","Precipitacion")
dim(datos)

septiembre<-seq(from=9,to=120,by=12)
temp_sept<-c()
acu_sept<-c()
for(i in septiembre){
  t_sept<-datos[i,3]
  a_sept<-datos[i,4]
  temp_sept<-c(temp_sept,t_sept)
  acu_sept<-c(acu_sept,a_sept)
}

octubre<-seq(from=10,to=120,by=12)
temp_oct<-c()
acu_oct<-c()
for(i in octubre){
  t_oct<-datos[i,3]
  a_oct<-datos[i,4]
  temp_oct<-c(temp_oct,t_oct)
  acu_oct<-c(acu_oct,a_oct)
}

noviembre<-seq(from=11,to=120,by=12)
temp_nov<-c()
acu_nov<-c()
for(i in noviembre){
  t_nov<-datos[i,3]
  a_nov<-datos[i,4]
  temp_nov<-c(temp_nov,t_nov)
  acu_nov<-c(acu_nov,a_nov)
  
}

prom_temp_prim_anual<-c()
prom_acu_prim_anual<-c()
for(i in 1:10){
  prom_temp_prim<-(temp_sept[i]+temp_oct[i]+temp_nov[i])/3
  prom_acu_prim<-(acu_sept[i]+acu_oct[i]+acu_nov[i])/3
  prom_temp_prim_anual<-c(prom_temp_prim_anual,prom_temp_prim)
  prom_acu_prim_anual<-c(prom_acu_prim_anual,prom_acu_prim)
}

array_t_prim<-array(data=prom_temp_prim_anual,dim=c(10,1))
array_a_prim<-array(data=prom_acu_prim_anual,dim=c(10,1))
array_prim<-cbind(array_t_prim,array_a_prim)
anios<-2000:2009
rownames(array_prim)<-anios
colnames(array_prim)<-c("Prom Temp","Prom Acu")

dimnames(array_prim)<-list(anios,c("Prom Temp","Prom Acu"))
dim(array_prim)
