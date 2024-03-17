ui <- navbarPage(
  "Shiny ODR",
  theme = shinythemes::shinytheme("united"),
  tabPanel(
    "ophtalmic diseases recognition",
  # App title ----
  # Sidebar layout with input and output definitions ----
  sidebarLayout(
    # Sidebar panel for inputs ----
    sidebarPanel(width = 4,
      # Input: File upload
      fileInput("image_path", label = "Input a JPEG image"),
      "This application uses pre-trained MobileNetV2 (top layer excluded) to 
       recognise ophtalmic diseases.
       
       Images are collected by Shanggong Medical Technology Co., Ltd. 
       from different hospitals and medical centers in China. 
       In these institutions, fundus images are captured by various cameras in the market, such as Canon, 
       Zeiss and Kowa, resulting into varied image resolutions. "
    ),
    # Main panel for displaying outputs ----
    mainPanel(
      # Output: Histogram ----
      plotOutput(outputId = "image"),
      tableOutput("prediction")
    )
  )
)
)