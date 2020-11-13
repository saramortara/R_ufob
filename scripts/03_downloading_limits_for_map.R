# Script para download dos limites do Brasil e da Caatinga

# Download do Shapefile do Brasil direto do GADM ------------------------------

# Codigo iso3 do pais
cod <- "BRA"

# para download do maior nivel do pais (sem subdivisoes)
level <- 0

# Nome do arquivo para salvar
file <- paste0(cod, "_", level, "_sf.rds")

# Pasta onde salvar o arquivo
dir <- "./data/GADM/"

# Criando a pasta, se não existir
dir.create(dir, showWarnings = FALSE)

# Criando vetor com o nome completo do arquivo
destfile <- paste0(dir, file)

# Se o arquivo não foi baixado, faz o download e salva na pasta data/GADM
if (!file.exists(destfile)) {
  url <- paste0("https://biogeo.ucdavis.edu/data/gadm3.6/Rsf/gadm36_", file)
  download.file(url, destfile = destfile)
}

# Download do limite da Caatinga -----------------------------------------------

# Caminho para o zip com o limite
url <- "http://terrabrasilis.dpi.inpe.br/download/dataset/caatinga-aux/vector/caatinga_border.zip"

# Faz o download do zip
download.file(url, dest = "caatinga_border.zip")

# Extrai o zip para a pasta data
unzip("caatinga_border.zip", exdir = "data/")

# Apaga o arquivo zip
unlink("caatinga_border.zip")
