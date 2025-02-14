library(readxl)
library(naniar)
library(dplyr)
#5
datos<-read_xlsx("datos/online_retail_II.xlsx")
str(datos)

datos$`Customer ID`<-as.character(datos$`Customer ID`)
#6
miss_var_summary(datos)
miss_case_summary(datos)

#vis_miss(datos, cluster= T)

sum(is.na(datos))

#7
n_distinct(datos$Invoice)

#10
precio_med_pedido<- datos %>% 
  group_by(Invoice) %>% 
  summarise(media_precio= mean(Price))

#12
num_pedido<- datos %>% 
  group_by(Invoice) %>% 
  summarise(numero= sum(Quantity))

#13
precio_pedido<-datos %>% 
  group_by(Invoice) %>% 
  summarise(precio_pedido= sum(Price*Quantity))
