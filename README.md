# Um exemplo de um projeto de análise

Esta é uma estrutura básica de um projeto. 

    .
    ├── data            # dados brutos e processados
    ├── docs            # apresentacao
    ├── figs            # figuras geradas pelos codigos
    ├── outputs         # outputs gerados pelos codigos
    ├── R_ufrb_demo.Rproj   
    ├── README.md       # explicação sobre o projeto
    └── scripts         # codigo

Este projeto contém um exemplo de download de dados de uma espécie, _Ziziphys joazeiro_, incluindo uma limpeza das coordenadas e um mapa com os pontos de ocorrência.


## Biblbiotecas

Você irá precisar dos seguintes pacotes instalados em sua máquina:

```
CoordinateCleaner
flora
ggplot2*
ggspatial*
rgbif
sf*
```

* pacotes utilizados para elaboração do mapa em script 04

O script 00 contém uma rotina mais avançada utilizando dois pacotes não disponíveis no CRAN. Usar os comandos abaixo para instalá-los.

```
remotes::install_github("ropensci/taxview")
remotes::install_github("liibre/taxview")

```
