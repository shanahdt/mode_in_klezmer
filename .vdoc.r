#
#
#
#
#
library(tidyverse)
library(DT)
library(janitor)
df <- read.csv("data/beregovski-metadata.tsv", sep="\t", header=TRUE)
df <- df |> clean_names()
df <- df |>  select(tune, genre, source, instrument_or_voice, mode, modulation_pathway, one_mode, mode_notes)
df |>          
    datatable(filter="top", rownames=FALSE, escape=FALSE)
#
#
#
