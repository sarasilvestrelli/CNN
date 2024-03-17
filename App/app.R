library(shiny)
library(shinythemes)
library(keras)
library(imager)
library(reticulate)

setwd("C:/Users/user/Desktop/Statistical Learning/Intro DL/Progetto - Ocular Disease")
#carica modello migliore-----------------
checkpoint_path<-".\\cp\\modello_vincente.hdf5"
model_cnn <- load_model_tf(checkpoint_path)
#carica la rete pre-allenata-------------
x<- 224
y<- 224
conv_base <- application_mobilenet_v2(
  weights = "imagenet",
  include_top = FALSE,
  input_shape = c(x, y, 3)
)
#avvia l'app----------------------------
set.seed(1234)
runApp('App')



