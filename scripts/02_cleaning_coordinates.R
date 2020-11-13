# Script para limpeza de coordenadas geográficas

# bibliotecas
library(CoordinateCleaner)

# lendo os dados
occs_data <- read.csv("data/Ziziphys_joazeiro_raw.csv")

occ_check <- clean_coordinates(x = occs_data,
                               lon = "decimalLongitude",
                               lat = "decimalLatitude",
                               species = "species")

# Entendendo o retorno da funcao
occ_check[, grep("^\\.", names(occ_check))]

# Quantas coordenadas corretas
table(occ_check$.summary)

# Selecionando apenas as coordenadas corretas
occ_corr <- occ_check[occ_check$.summary, ]

dim(occ_check)
dim(occ_corr)

# Exportando os dados limpos
write.csv(occ_corr, "data/Ziziphys_joazeiro_processed.csv")
