
shinyServer(function(input, output) {

   image <- reactive({
    req(input$image_path)
    imager::load.image(input$image_path$datapath)
  })
  
   output$image <- renderPlot({
       plot(as.raster(image()))
   })
  
   
   output$prediction <- renderTable({
     inFile <- input$image_path
     
     if (is.null(inFile))
       return(NULL)
     
     withProgress(message = 'Predicting...', value = 1, {
       
       # load the image (copy an image from Photos)
       img_path <- inFile$datapath
       img <- image_load(img_path, target_size = c(224,224))
       x <- image_to_array(img)
       x <- array_reshape(x, c(1, dim(x)))/255
       features_rete<- conv_base %>% predict(x)
       reshape_features <- function(features) array_reshape(features, dim = c(1,7 * 7 * 1280))
       features_rete<-reshape_features(features_rete)
       previsione<-model_cnn %>% predict(features_rete)
       previsione<-round(previsione,4)*100
       previsione<-as.data.frame(previsione)
       names(previsione)<-c("AMD","Cataract","Diabetes","Glaucoma","Hypertension","Myopia","Normal")
       previsione
   })
   
   
})
}) 