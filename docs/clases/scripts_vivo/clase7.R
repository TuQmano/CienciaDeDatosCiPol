library(tidyverse)
library(datos)

(p <- ggplot(data = millas) +
  geom_point(mapping = aes(x = cilindrada, y = autopista)) +
  facet_wrap(~ clase, ncol = 1, scales = "free_y"))



ggplot(data = millas) +
  geom_point(mapping = aes(x = cilindrada, y = autopista)) +
  coord_polar()

millas %>% 
  filter(fabricante == "audi")

ggplot(millas, aes(cilindrada, autopista)) +
  geom_point() +
  geom_point(data = millas %>% 
               filter(fabricante == "audi"), color = "blue", size =3) +
  geom_smooth(se = TRUE) +
  labs(title = "Performance de los AUDI", 
       subtitle = "Un gráfico del TuQmano", 
       y = "Etiqueta Y",  
       x = "Etiqueta X", 
       caption = "FUENTE: {datos} 'R Para Ciencia de Datos'") +
  ggthemes::theme_wsj() +
  theme(plot.title =  element_text(size = 30, color =  "red"), 
        plot.subtitle = element_text(color = "green"))




tuc <- geoAr::get_geo(geo = "TUCUMAN")  %>% 
  geoAr::add_geo_codes()

  mapa_tuc <- ggplot2::ggplot(tuc) + #  SETTING color
  ggplot2::geom_sf(color = "blue")

  
class(mapa_tuc)  
  
  mapa_tuc +
   aes(fill = mapa_tuc$data$nomdepto_censo)
  
  
  
  
  
  library(patchwork)
  
  (p1 <- ggplot(mtcars) + geom_point(aes(mpg, disp)))
  
  
  (p2 <- ggplot(mtcars) + geom_boxplot(aes(gear, disp, group = gear)))

      p1/p2
  
      
      p3 <- ggplot(mtcars) + geom_smooth(aes(disp, qsec))
      p4 <- ggplot(mtcars) + geom_bar(aes(carb))
      
      (p1 | p2 | p3) / p4
      
      
      
      
      library(cowplot)
      logo_file <- "https://github.com/electorArg/polAr/blob/master/hex/hex-polAr.png?raw=true"
      ggdraw(cow_plot) +
        draw_label(label = "HECHO CON", color = "blue", size = 40, angle = 45 , alpha = .5) +
        draw_image(logo_file, x = 1, y = 1.1, hjust = 1, vjust = 1, width = 0.15)  
      
      
      ggplot(tuc) +
        aes(fill = nomdepto_censo) +
        geom_sf(size = 1L) +
        scale_fill_hue() +
        labs(title = "Mapa de Tucuman", fill = "Departamentos") +
        theme_minimal()
      
      
      
library(ggplot2)

ggplot(tuc) +
 aes(fill = nomdepto_censo) +
 geom_sf(size = 1L) +
 scale_fill_hue() +
 labs(title = "Mapa de Tucuman", fill = "Departamentos") +
 theme_minimal()

ggplot(tuc) +
 aes(fill = nomdepto_censo) +
 geom_sf(size = 1L) +
 scale_fill_hue() +
 labs(title = "Mapa de Tucuman", fill = "Departamentos") +
 cowplot::theme_map()




library(polArverse)


show_arg_codes()
  

get_geo("NEUQUEN")
