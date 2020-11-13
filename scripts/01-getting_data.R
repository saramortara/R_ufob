# Script para download de dados de ocorrência de uma espécie

# bibliotecas
library(rgbif)
library(flora)

# Nome da especie
species <- "Ziziphus joazeiro"

# Checando o status da especie na flora do Brasil 2020
species_check <- get.taxa(species,
                          domain = TRUE,
                          life.form = TRUE,
                          habitat = TRUE,
                          vegetation.type = TRUE,
                          endemism = TRUE)

# Buscando por sinonimos
species_syn <- get.synonyms(species)

occs <- occ_search(scientificName = species,
                   limit = 1500)

# Numero de registros
nrow(occs$data)

# Inspecionando o objeto
occs

summary(occs$data$decimalLatitude)
summary(occs$data$decimalLongitude)

# Removendo as coordenadas com NA
occs_data <- occs$data[!is.na(occs$data$decimalLatitude) & occs$data$decimalLongitude, ]
# Checando novamente
summary(occs_data[, c("decimalLatitude", "decimalLongitude")])

# Salvando os dados brutos
write.csv(occs_data, "data/Ziziphys_joazeiro_raw.csv", row.names = FALSE)
