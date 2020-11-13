# Script para criar mapa com os pontos de Z. joazeiro

# Bibliotecas
library(ggplot2)
library(sf)
library(ggspatial)

# Carregando o objeto com o limite do Brasil para o R
bra <- readRDS("data/GADM/BRA_0_sf.rds")

# Lendo o shapefile dos limites da caatinga
caa <- st_read("data/caatinga_border/caatinga_border.shp")

# Lendo os dados das coordenadas limpas
coord <- read.csv("data/Ziziphys_joazeiro_processed.csv")

# Criando o mapa ---------------------------------------------------------------
juazeiro <-
  # Cria janela de plot
  ggplot() +
  # Adiciona limite do brasil
  geom_sf(data = bra) +
  # Adiciona limite da caatinga
  geom_sf(data = caa, fill = "forestgreen") +
  # Adiciona os pontos das especies
  geom_point(data = coord, aes(x = decimalLongitude, y = decimalLatitude),
             alpha = 0.5) +
  # Adiciona escala
  annotation_scale(location = "bl", width_hint = 0.3) +
  # Adiciona norte
  annotation_north_arrow(location = "bl", which_north = "true",
                         pad_x = unit(3, "in"),
                         style = north_arrow_fancy_orienteering) +
  # Rotulos dos eixos
  xlab("Longitude") + ylab("Latitude") +
  theme_minimal()

juazeiro

# Exportando o mapa
ggsave("figs/04_mapa_Ziziphus_joaezeiro.png", height = 4, width = 6)
