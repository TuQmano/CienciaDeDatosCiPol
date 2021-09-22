curso <- data.frame(nombre= c("Juan", "Pedro", "María", "José", 
                              "Enzo", "Ariel", "Eva"),
                    edad= c(25, 32, 21,40, 
                            30, 28, 37),
                    nacim= c(1993, 1986, 1997, 1978,
                             1988, 1990, 1981),
                    software.primario= c("spss", "stata", "stata", 
                                         "excel", "R", "stata",
                                         "spss"),
                    nivel= c(3, 5,7, 6,
                             2, 6, 8) 
)



# Calcular la edad promedio del curso
sum(curso$edad)/7  # hardcodeado el valor largo del vector edad



edad_promedio <- sum(curso$edad)/length(curso$edad) # programaticamente el largo del vector


round(x = edad_promedio,
      digits = 2)

# install.packages("tidyverse")

library(tidyverse)

curso %>%   #  Ctrl + Shift + M
  summarise(promedio = round(mean(edad), 
                             digits = 2)
  )

#### DATOS ELECTORALES


library(electorAr)

elecciones <- show_available_elections(source = "data")


#### Consultar clase de objetos  (character, numeric, data.frames, tibbles)

class(curso$nivel)


numeros_texto <- as.character(curso$nivel)

class(numeros_texto)

as.numeric(numeros_texto)

dim(curso)


gral2015 <-  get_election_data(district = 'arg', 
                               category = 'presi', 
                               round = 'gral', 
                               year = 2015, 
                               level = "departamento") %>% 
  get_names()


# MAS VOTOS EL FIT? 


# VERSION BASE


fit <- gral2015[gral2015$nombre_lista == 'ALIANZA FRENTE DE IZQUIERDA Y DE LOS TRABAJADORES', ] # > BASE
fit[fit$votos == max(fit$votos),]

# VERSION TIDY


gral2015 %>%  # > TIDY
  filter(nombre_lista == 'ALIANZA FRENTE DE IZQUIERDA Y DE LOS TRABAJADORES') %>% 
  ungroup() %>% 
  # slice_max(votos)
  filter(votos == max(votos))

curso
elecciones



### REINICIAR SESION SEGUIDO   Ctrl + Shft + F10

