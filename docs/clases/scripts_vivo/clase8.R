### CARGO LIBRERIAS 

library(polArverse)
library(tidyverse)
library(geofacet)
library(leaflet)
library(sf)


### DESCARGO FUENTES DE DATOS

### GEO 

geoAr::show_arg_codes() # PARA CONOCER EL DICCIONARIO DE GEOS DISPONIBLE


CORDOBA_geometry <- get_geo(geo = "CORDOBA") %>% 
  add_geo_codes()


CORDOBA_geometry %>% 
  ggplot2::ggplot() + #  SETTING color
  ggplot2::geom_sf(color = "blue")


### ELECTORAL CORDOBA

show_available_elections(viewer = T, source = "data")

cor_dip2005 <- get_election_data("cordoba",	"dip",	"gral",	2005, level = "departamento")

tablas_unidas <- cor_dip2005 %>% 
  left_join(CORDOBA_geometry)


class(CORDOBA_geometry)

class(tablas_unidas)


sf::st_as_sf(tablas_unidas)


readr::read_csv("archivo.csv")

readxl::read_excel("archivo_excel.xls")



metrobus <- sf::read_sf("https://cdn.buenosaires.gob.ar/datosabiertos/datasets/transporte-y-obras-publicas/metrobus/recorrido-de-metrobus.geojson")


caba <-  get_geo(geo = "CABA", simplified = FALSE)

ggplot(metrobus) +
  geom_sf(data = caba) +
  geom_sf(aes(color = METROBUS))





leaflet(metrobus) %>% 
  leaflet::addPolylines() %>% 
  addArgTiles()

### MAPEANDO CORDOBA


tabla_plot <- tablas_unidas %>% 
  get_names() %>% 
  st_as_sf() %>% # LE AGREGO class sf al objeto
  select(nombre_lista, votos, coddepto, depto) %>% 
  #filter(coddepto == "002")
  mutate(nombre_lista = fct_lump(f = nombre_lista,
                                 n = 3,
                                 w = votos, 
                                 other_level = "Otro")) %>% 
  group_by(nombre_lista, depto, coddepto) %>% 
  summarise(votos = sum(votos)) %>% 
  arrange(depto, desc(votos))


tabla_plot %>% 
  group_by(depto) %>% 
  transmute(votos_emitidos = sum(votos))  %>% 
  slice(1) %>% 
  ggplot() +
  geom_sf(aes(fill = votos_emitidos)) +
  theme_void() +
  scale_fill_viridis_c(option = "B")
  

grilla_cordoba <- get_grid("CORDOBA")


ggplot(tabla_plot %>% 
         group_by(depto) %>% 
         mutate(pct = round(votos/sum(votos)*100,2))) +
  geom_col(aes(pct, nombre_lista, fill = nombre_lista)) +
  facet_geo(~ coddepto, grid = grilla_cordoba, 
            label = "name")
