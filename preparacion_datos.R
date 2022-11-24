library(caret)
library(readr)

Copia_de_Probabilidad_de_aprobados_I_A_respuestas_Respuestas_de_formulario_1_1_ <- read_csv("C:/Users/Walter Gomez/Documents/IA_Redes_Neuro/Copia de Probabilidad de aprobados (I.A) (respuestas) - Respuestas de formulario 1 (1).csv", 
                                                                                            col_types = cols(`Cantidad de años cursados:` = col_number()))
View(Copia_de_Probabilidad_de_aprobados_I_A_respuestas_Respuestas_de_formulario_1_1_)

data <- Copia_de_Probabilidad_de_aprobados_I_A_respuestas_Respuestas_de_formulario_1_1_

summary(data)

set.seed(56) # Numero inicial del cual comenzara a generar una secuencia aleatoria.
split_train_test <- createDataPartition(data$`Distancia de donde residís a la universidad en cuadras:`, p=0.6, list=FALSE) #p = porcentaje de los datos a usar, list = Si el resultado devolvera una lista o una matriz. 
dtrain<- data[split_train_test,]
dtest<-  data[-split_train_test,]

getwd()
setwd("IA_Redes_Neuro/")
data1 <- dtrain[,-c(1,2)]
data2 <- dtest[,-c(1,2)]

write.csv(data1, file="aprob_train60.csv")
write.csv(data2, file="aprob_test40.csv")
