# Script bonus: explorando plantas baianas da Caatinga

# Usar os comandos a seguir caso nao tenha os pacotes instalados:
#remotes::install_github("ropensci/taxview")
#remotes::install_github("liibre/rocc")

library(rocc)
library(taxview)

# Baixando as plantas endêmicas do Brasil que ocorrem no estado da Bahia onde ocorre o bioma Caatinga
sp_caa <- rocc::search_flora(domain = "Caatinga", endemism = TRUE, stateProvince = "BA")

head(sp_caa)

dim(sp_caa)

# Checando a hierarquia taxonomica das especies
out <- tv_prep_ids(sp_caa, ids = sp_caa$id, db = "ncbi")

# Resumindo os dados
res <- tv_summarise(out)
