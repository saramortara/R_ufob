# Eexplorando o IPT Flora do Brasil

# Usar os comandos a seguir caso nao tenha os pacotes instalados:
#remotes::install_github("liibre/Rocc")
# install.packages("wesanderson")

library(Rocc)
library(dplyr)

# 1. Explorando o IPT Flora do Brasil ------------------------------------------
ipt_flora <- update_flora()
#output tambem salvo em: /home/sara/.cache/R/finch

# classe do objeto
class(ipt_flora)

# estrutura
names(ipt_flora)

# arquivos
names(ipt_flora$data)

dim(ipt_flora$data$taxon.txt) # 134.865 taxa

# Guardando o objeto taxon
taxon <- ipt_flora$data$taxon.txt
head(taxon)

# todos os ranks
table(taxon$taxonRank)

# todos os nomes
table(taxon$taxonomicStatus)

# quantas espécies aceitas?
spp_aceita <- taxon[taxon$taxonRank == "ESPECIE" & taxon$taxonomicStatus == "NOME_ACEITO", ]
nrow(spp_aceita)

# quantas espécies de leguminosas aceitas?
sort(table(spp_aceita$family))
nrow(spp_aceita[spp_aceita$family == "Fabaceae", ])

# uma genero: Rhamnaceae Ziziphus
ziziphus <- spp_aceita[spp_aceita$genus == "Ziziphus", ]
ziziphus

# 2. Relacionando tabelas diferentes -------------------------------------------
distribution <- ipt_flora$data$distribution.txt
head(distribution)

ziziphus_distr <- merge(ziziphus, distribution, by = "id")
dim(ziziphus)
dim(distribution)
dim(ziziphus_distr)

length(unique(ziziphus_distr$id))

View(ziziphus_distr)

# Especies de Ziziphus da Caatinga
ziziphus_caa <- ziziphus_distr[grep("Caatinga", ziziphus_distr$occurrenceRemarks), ]
ziziphus_spp <- ziziphus_caa[!duplicated(ziziphus_caa[, c("scientificName", "occurrenceRemarks")]),
             c("scientificName", "occurrenceRemarks")]

write.csv(ziziphus_spp, "outputs/00_Ziziphus_Caatinga.csv", row.names = FALSE)
