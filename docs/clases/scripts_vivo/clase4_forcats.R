### FORCATS

# Cargo librerias
library(electorAr) # Toolbox for Argentina's Electoral Data, [github::PoliticaArgentina/electorAr] v0.0.1.0
library(tidyverse) # Easily Install and Load the 'Tidyverse', CRAN v1.3.0


# Levanto datos

show_available_elections(source = 'data', 
                         viewer = TRUE)


pba_dip_gral_2009_depto <- get_election_data(district = "pba", category = "dip", round = "gral", year = 2009,
                  level = "departamento" )

pba_dip_gral_2009_prov <- get_election_data(district = "pba", category = "dip", round = "gral", year = 2009)

# RANKING DE VOTOS
pba_dip_gral_2009_prov %>% 
  arrange(desc(votos)) %>% 
  get_names()

### Calculo a nivel provincial desde nivel departamental (REPASO)
pba_dip_gral_2009_depto %>%
  get_names() %>% 
  group_by(nombre_lista) %>% 
  summarise(votos = sum(votos)) %>%
  arrange(desc(votos)) 


### {forcats}

# fct_lump 

pba_dip_gral_2009_prov %>% 
  get_names() %>% 
  mutate(nombre_lsita =  fct_lump(f = nombre_lista, n = 3, w = votos, other_level = "Otros")) %>% 
  arrange(desc(votos))


# fct_reorder


pba_dip_gral_2009_prov %>% 
  get_names() %>% 
  ggplot() +
  geom_col(aes(votos, nombre_lista))


#Reordenado
pba_dip_gral_2009_prov %>% 
  get_names() %>% 
  ggplot() +
  geom_col(aes(votos, fct_reorder(nombre_lista, votos)))


