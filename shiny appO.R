library(shiny)
library(shinydashboard)
library(fontawesome)
library(plotly)
library(crayon)
library(readr)
library(DT)
library(shinyjs)
library(highcharter)




ui <- shinyUI(
  dashboardPage( skin = 'green',
                 dashboardHeader( title = tags$h2(HTML('<font face="serif" size="6">Rwanda Labour Force Survey 2022</font>')),titleWidth =600,
                                  
                                  tags$li( class = "dropdown",tags$a(href = "https://www.statistics.gov.rw/publication/1919",icon("globe"),HTML("<b>website</b>")
                                    )),
                                  tags$li(class = "dropdown",tags$a(href = "https://github.com/ABonheur001?tab=repositories",icon("github"),HTML("<b>GitHub Repository</b>")
                                    )),
                                  dropdownMenu(type = "notification",
                                               notificationItem( text = HTML("<b>Labour survey 2023(Q1)</b>"),icon = icon("circle-info"),href = "https://www.statistics.gov.rw/publication/1935"),
                                              notificationItem( text = HTML("<b>Labour survey 2023(Q2)</b>"),icon = icon("circle-info"),href = "https://www.statistics.gov.rw/publication/2002"),
                                              notificationItem( text = HTML("<b>Labour survey 2023(Q3)</b>"),icon = icon("circle-info"),href = "https://www.statistics.gov.rw/publication/2068")
                                                                                      
                                  )),
                 
                 dashboardSidebar(
                   sidebarMenu( 
                     menuItem("Home Bar",icon = icon("house-chimney"),tabName = "desc"),
                     menuItem("Overview", tabName = "maindash", icon = icon("binoculars")),
                     menuItem("Labor force status",tabName = "lab",icon = icon("signs-post")),
                     menuItem("Distribution", icon = icon("earth-africa",),
                              menuSubItem("Province",tabName = "province",icon = icon("map-location")),
                              menuSubItem("district",icon = icon("location-dot"),tabName = 'disc'))
                    
                     )),
                 
                 dashboardBody(
                   tabItems(
                     tabItem( tabName = "desc",
                         
                        fluidRow(
                              column(width = 12,img(src = "cover1.png", width = "100%", height = "auto"))),
                        
                        HTML("<div style='margin-top: 2cm;'></div>"),
                        fluidRow(column(width = 8,offset = 2,
                                        HTML(
                                          '
        <div style="font-size: 23px; line-height: 1.6; color: #555; font-family: Arial, sans-serif; font-weight: bold;">
          This dashboard enlightens a user on key indicators of Rwanda\'s labor landscape, serving as a comprehensive guide to the nation\'s employment dynamics. it
        gives clear overview about labor force during year of 2022.
        </div>
        '
                                        ))
                              ),
                        HTML("<div style='margin-top: 1cm;'></div>"),
                        fluidRow(column(width = 8,offset = 4,
                                        HTML(
                                          '
        <div style="font-size: 16px; line-height: 1.6; color: #555; font-family: Arial, sans-serif;">
          Sourced from National institute of Stattistics of Rwanda. for more infomation
          <a href="https://www.statistics.gov.rw/" target="_blank">Click here</a>
        </div>
        '
                                        ))),
                                 
                        fluidRow(column(width = 2,offset = 5,img(src = "logo.png", width = "60%", height = "auto"))
                                 )),
                     
                     tabItem(tabName = "maindash",
                             fluidRow(

                               column( width = 6,offset = 3,
                                       tags$h1(HTML('<b><font face="serif" size="6">Rwanda Labour Force Survey 2022 Dashboard</font></b></u>')))
                                      ),
                             HTML("<div style='margin-top: 1cm;'></div>"),
                             
                             fluidRow(   
                                    column(width = 5,offset = 2,
                                          infoBox(title = HTML("<b>Total Population</b>"),value = " 13,078,028 people",
                                               icon = icon("people-group"),fill = TRUE,color = 'navy',width = 10)),
                                    column( width = 5,     
                                          infoBox(title = HTML("<b>Working age population (16+)</b>"),subtitle = "60.8% of Total Population",value = " 7,963,586 people",
                                               icon = icon("users-rectangle") ,width = 10,color = 'navy',fill = TRUE))),
                            
                             
                             fluidRow(tags$h2(HTML('<font face="serif" size="6">Working age overview</font>')),
                                       
                                       
                                       infoBox(title = HTML("<b>Labour force</b>"),subtitle = "56% of working population",value = "4,463,296 people",
                                               icon = icon("users-viewfinder"),color = "purple"),
                                       infoBox(title = HTML("<b>Outside Labor Force</b>"),subtitle = "44% of working population",value = "3,500,290 people",
                                               icon = icon("person-circle-xmark"),color = "navy"),
                                       infoBox(title = HTML("<b>Subsistence Food Staff Production</b>"),subtitle = "37.5% of outside labor force people",value = "1,310,734 people",
                                               icon = icon("wheat-awn-circle-exclamation"),color = "maroon")
                             ),
                             fluidRow(
                                      infoBox(title = HTML("<b>youth (neet) rate</b>"),value = "35.6%",subtitle = "Not employed nor in education/training.",
                                               icon = icon("user-tie"),color = 'green'),
                                       infoBox(title = HTML("<b>Annual Unemployment rate</b>"),icon = icon("arrow-trend-down"),value = " 20.5%",color = 'red',
                                               subtitle = "916,944 persons seeking & available to work for pay or profit."),
                                       infoBox(title = HTML("<b>Employment-to-population ratio</b>"),value = "44.5%",
                                               icon = icon("arrow-trend-up")),
                             ),
                             fluidRow(   
                               column(width = 5,offset = 2,
                                      infoBox(title = HTML("<b>average hours worked per week</b>"),value = "36.1 hours",
                                              icon = icon("business-time"), color = 'navy',width = 10)),
                               column( width = 5,     
                                       infoBox(title = HTML("<b>labour underutilization rate</b>"),value = "57.6%",
                                               icon = icon("circle-info"), color = 'navy',width = 10))),
                             
                             
                             
                             fluidRow(tags$h2(HTML('<font face="serif" size="6">Diverse Graphical Representations</font>')),
                               style = "text-align: left;"),
                             fluidRow(
                               box(plotlyOutput("trend"),title = "6 Year labour force indicator's trend", solidHeader = TRUE,
                                   status = "primary", collapsible = TRUE,collapsed = FALSE, width = 5),
                               box(plotlyOutput("occupation"),width = 6,collapsible = TRUE, collapsed = FALSE,
                                   status = "primary",solidHeader = TRUE, title = "Work force occupation categories")
                             ),
                             fluidRow(
                               box(plotlyOutput("gen"),width = 4,collapsible = TRUE, collapsed = FALSE,status = "primary",solidHeader = TRUE, title = "Working age population"),       
                               box(plotlyOutput("NEET"),width = 4,solidHeader = TRUE,status = "primary",collapsible = TRUE,title = "Not in Employement,Not in Education or Training"),
                               box(plotlyOutput("labor"),width = 4,title = "Labor underutilization",solidHeader = TRUE,status = "primary",collapsible = TRUE)
                                      
                                      ),
                             
                             
                             fluidRow(tags$h2(HTML('<font face="serif" size="6">2022 summarized table of labour force indicators</font>'))
                                      ,style = "text-align: center; text-decoration: underline;"),
                             fluidRow(
                             dataTableOutput("combined_table"))
                             
                             ),
                     
                     tabItem(tabName = "lab",
                      
                       fluidRow( tags$h2(HTML('<font face="serif" size="6">Employment</font>')),
                         box(plotlyOutput("unemployment"),width = 4,title = "Unemployment by gender, age and location",
                             solidHeader = TRUE,status = "primary",collapsible = TRUE,collapsed = TRUE),
                         box(plotlyOutput("employ"), title = "Unemployment rate by educational attainment ",solidHeader = TRUE, 
                             collapsible = TRUE, collapsed = TRUE,width = 4, status = "primary"),
                         box(plotlyOutput("status"),width = 4,icon = icon("person-half-dress"),collapsible = TRUE, collapsed = TRUE,
                             status = "primary",solidHeader = TRUE, title = "Sex distribution of employment status")
                       ),
                       fluidRow(tags$h2(HTML('<font face="serif" size="6">Branches of economic activities</font>')),
                                
                                infoBox(title = HTML("<b>Market oriented agriculture</b>"), value = "46.8% of employed population",icon = icon("money-bill-wheat"),
                                        color = 'green',subtitle = "1,659,693 population",fill = TRUE),
                                infoBox(title = HTML("<b>Services</b>"),value = "35.9% were employed in service sector",
                                        color = 'blue',icon = icon("bell-concierge"),subtitle = "1,273,140 population" ,fill = TRUE),
                                infoBox(title = HTML("<b></b>"),value = "17.3% were located in service sector",
                                        color = 'aqua',icon = icon("industry"),subtitle = "613,519 population" ,fill = TRUE)
                       ),
                       
                       fluidRow(tags$h2(HTML('<font face="serif" size="6">Time series data for branch of economic activities</font>')),
                       
                                             style = "text-align: center;",height = 70,width = 12,background = NULL),
                      fluidRow(
                               box(highchartOutput("agriculture"),width = 4,title = "Agriculture",solidHeader = TRUE,collapsible = TRUE,collapsed = FALSE,status = "success"),
                               box(highchartOutput("serv"),width = 4,title = "Service",solidHeader = TRUE,collapsible = TRUE,collapsed = FALSE,status = "primary"),
                               box(highchartOutput("indu"),width = 4,title = "Industry",solidHeader = TRUE,collapsible = TRUE,collapsed = FALSE,status = "info")
                        )),
                     
                     tabItem(tabName = "province",tags$h2(HTML('<font face="serif" size="6">Labour force Distribution</font>')),
                             tabBox(id="t1", width =4,
                                    tabPanel(title = "Kigali City",plotlyOutput("kigali")),
                                    tabPanel(title = "Northern Province",plotlyOutput("north")),
                                    tabPanel(title = "Southern Province",plotlyOutput("south")),
                                    tabPanel(title = "Eastern Province", plotlyOutput("east")),
                                    tabPanel(title = "Western Province", plotlyOutput("west"))),
                             fluidRow(box(title = "population outside labor force",plotlyOutput("outside"),solidHeader = TRUE,
                                          status = "primary",width = 7))
                             
                     ),
                     tabItem(tabName = 'disc',tags$h2(HTML('<font face="serif" size="6">2022 summarized table of labour force indicators</font>')),
                             dataTableOutput("district")

                             )
                     
                   )
                 )
  ))

server <- shinyServer(function(input, output){
  
  # SUMMARY TABLE

combined_table <- data.frame(
      working_age = c("Total working age", "16-24 yrs", "25-34 yrs", "35-54 yrs", "55-64 yrs", "65+ yrs"),
      Male = c(3753869, 1240100, 836335, 1115710, 315173, 246550),
      Female = c(4209718, 1247037, 921081, 1323098, 362107, 356395),
      Urban = c(1637017, 520901, 449868, 486589, 101659, 78000),
      Rural = c(6326569, 1966236, 1307548, 1952220, 575621, 524944),
      Labour_force_participation_rate = c("56.0%", "41.2%", "76.0%", "70.8%", "43.5%", "13.2%"),
      Employment_population_ratio = c("44.5%", "29.9%", "59.6%", "58.9%", "36.7%", "11.7%"),
      Unemployment_rate = c("20.5%", "27.5%", "21.5%", "16.9%", "15.6%", "11.7%")
    )
    output$combined_table <- renderDT({
      datatable(
        combined_table,
        extensions = 'Buttons', 
        options = list(
          dom = 'Bfrtip',  
          buttons = c('copy', 'csv', 'excel', 'pdf', 'print'),
          searching = FALSE,
          lengthChange = FALSE
        ))%>%
        formatStyle(
          1:ncol(combined_table),  # Target the first column
          fontWeight = styleEqual("Total working age", "bold")
            # Bold if the value is "Total working age"
        )
    })
    observe({
      shinyjs::disable("combined_table_copy")
      shinyjs::disable("combined_table_csv")
      shinyjs::disable("combined_table_excel")
      shinyjs::disable("combined_table_pdf")
      shinyjs::disable("combined_table_print")
    })
  
  
  
  
  
  
  #labor underutilization
  output$labor <- renderPlotly({
    plot_ly( labels = c("unemployed","Time related underemployed","Potential labor force"), values = c(916944, 1125425,1246103), hole = 0.4,
             type = "pie")%>%
      layout(plot_bgcolor = "lightgrey",paper_bgcolor = "lightgrey",legend = list(orientation = "h", y = -0.2))
  })
  
  # working age occupation
  output$occupation <- renderPlotly({
    occupation <- c("subsistance agriculture","market orientaded agri","non agriculture sector","others outside labour force")
    values <- c(1759278,1660185,1886167, 2657956)
    colorsss <- c("blue","purple","chocolate","maroon")
    plot_ly(x = occupation, y = values, color = occupation,colors = colorsss,type = "bar")%>%
      layout(title = "Work force occupation chat",margin = list(t = 80), xaxis = list(title= "categories"), yaxis = list(title = "population"),
             paper_bgcolor = "lightgrey",plot_bgcolor = "lightgrey")
  })
  
  #Distribution by province
  output$kigali <- renderPlotly({
    categories <- factor(c("Employed", "Unemployed","Total labor force"),levels = c("Unemployed", "Employed","Total labor force"))
    values <- c(647629,171084,818713)
    plot_ly(x = categories, y = values, type = "bar",color = categories,colors = c("purple","orange","navy"))%>%
      layout(title = "Kigali city",margin = list(t = 80), xaxis = list(title = "Categories"), yaxis =list(title = "population"),
             legend = list(orientation = "h", y = -0.2))
  })
  output$north <- renderPlotly({
    categories <- factor(c("Employed", "Unemployed","Total labor force"),levels = c("Unemployed", "Employed","Total labor force"))
    values <- c(599887, 154168,754055)
    plot_ly(x = categories, y = values,type = "bar",color = categories,colors = c("purple","orange","navy") )%>%
      layout(title = "Northern Province",margin = list(t = 80), xaxis = list(title = "Categories"), yaxis =list(title = "population"),
             legend = list(orientation = "h", y = -0.2))
    
  })
  output$south <- renderPlotly({
    categories <- factor(c("Employed", "Unemployed","Total labor force"),levels = c("Unemployed", "Employed","Total labor force"))
    values <- c(811479,222851,1034330)
    plot_ly(x = categories, y = values,type = "bar",color = categories,colors = c("blue","orange","navy"))%>%
      layout(title = "Southern Province",margin = list(t = 80), xaxis = list(title = "Categories"), yaxis =list(title = "population"),
             legend = list(orientation = "h", y = -0.2))
  })
  output$east <- renderPlotly({
    categories <- factor(c("Employed", "Unemployed","Total labor force"),levels = c("Unemployed", "Employed","Total labor force"))
    values <- c( 837313,197904,1035217)
    plot_ly(x = categories, y = values,type = "bar",color = categories,colors = c("blue","orange","navy"))%>%
      layout(title = "Eastern Province",margin = list(t = 80), xaxis = list(title = "Categories"), yaxis =list(title = "population"),
             legend = list(orientation = "h", y = -0.2))
  })
  output$west <- renderPlotly({
    categories <- factor(c("Employed", "Unemployed","Total labor force"),levels = c("Unemployed", "Employed","Total labor force"))
    values <- c( 650043,170937,820980)
    plot_ly(x = categories, y = values,type = "bar",color = categories,colors = c("green","orange","navy"))%>%
      layout(title = "Western Provinve",margin = list(t = 80), xaxis = list(title = "Categories"), yaxis =list(title = "population"),
             legend = list(orientation = "h", y = -0.2))
  })
  

#District summary  table
  
  Districttable <- read_csv(file = "District.csv")
  Districttable <- Districttable[,c(1,2,3,4,5,6)]
  output$district <- renderDT({
    datatable(
      Districttable,
      extensions = 'Buttons', 
      options = list(
        dom = 'Bfrtip',  
        buttons = c('copy', 'csv', 'excel', 'pdf', 'print'),
        searching = TRUE

      
      ))%>%
      formatStyle(1,
        fontWeight = styleEqual("Location", "bold"))
  })



  
#Time-series chat for employment in verious branch of economic activities
  
  #agricculture
  output$agriculture <- renderHighchart({
  tablee<-data.frame(
  years <- c("2017","2018","2019","2020","2021","2022"),
  percentages <- c(41.9,39.5,37.4,40.5,47.7,46.8))
  hchart(tablee,"column",hcaes(x=years, y=percentages),
         name ="percentage",
         colorByPoint = FALSE,color = 'darkgreen')
    })
 
    #services
  output$serv <- renderHighchart({

  dtable <- data.frame(
    Years <- c("2017",'2018',"2019","2020",'2021',"2022"),
    Percentages<- c(41.5,41.7,43.9,39.1,35.1,35.9))
  hchart(dtable,"column",hcaes(x=Years, y=Percentages),
         name ="percentage",
         colorByPoint = FALSE,color = 'blue')
  })
  
  #industry
  output$indu<- renderHighchart({
 tab <- data.frame(
      years <- c("2017",'2018',"2019","2020","2021","2022"),
  Percentages<- c(16.6,18.8,18.7,20.5,17.2,17.3))
 
  hchart(tab,"column",hcaes(x=years, y=Percentages),
         name ="Percentage",
         colorByPoint = FALSE,color = 'deepskyblue')
  })
 


  
 
  
  #outside labor force pop
  
  output$outside <- renderPlotly({
    category <- factor(c("Kigali city", "Northern province","southern province", "western province","Eastern provonce"),
                       levels =c("Kigali city", "Northern province","southern province", "western province","Eastern provonce"))
    pop <- c(398068, 586854, 956483, 697402, 861483)
    data <- data.frame(category,pop)
    plot_ly(x = category, y = pop, type = "bar",color = category, colors = c('orange', 'deepskyblue', 'navy','gray', 'darkgreen'))%>%
      layout(title = "Outside labor force bar chat",margin = list(t = 80), xaxis = list(title = "province"),
             yaxis = list(title = "population"),plot_bgcolor = "lightgrey",paper_bgcolor = "lightgrey",legend = list(orientation = "h", y = -0.2))
  })
  
  # warking age pie
  output$gen <- renderPlotly({
    
    plot_ly( labels = c("male","Female"), values = c(3753869, 4209718), hole = 0.4,
             type = "pie")%>%
      layout(title = "16+ above by sex chat",margin = list(t = 80),legend = list(orientation = "h", y = -0.2),plot_bgcolor = "lightgrey",paper_bgcolor = "lightgrey")
  })
  
  #Unemployment in different categories
  output$unemployment <- renderPlotly({
    category <- factor(c("Male", "Female", "Youth", "Adults","Urban", "Rural"), levels = c("Male", "Female", "Youth", "Adults","Urban", "Rural"))
    gender <- c( 17.9, 23.7)
    age <- c( 25.6, 17.1)
    location <- c(20.4, 20.6)
    plot_ly( x = category[1:2] , y = gender ,name = "Gender",type = "bar")%>%
      add_trace(x = category[3:4], y = age,name = "Age")%>%
      add_trace(x = category[5:6], y = location, name = "Location")%>%
      layout(title = "Unemployment Distribution",margin = list(t = 80),xaxis = list(title = "Categories"), yaxis = list(title = "Percentages"),
             plot_bgcolor = 'white',paper_bgcolor = "white",legend = list(orientation = "h", y = -0.2))
  })
  
   #Employment status
  output$status <- renderPlotly({
    categories <- factor(c("Employed", "Unemployed","Total labor force"),levels = c("Employed", "Unemployed","Total labor force"))
    Male <- c( 1977704, 429744)
    Female <- c( 1568648, 487200)
    
    colors <- c("green","deepskyblue",'navy')
    plot_ly(x = categories[1:2], y = Male,name = 'Male',marker = list(color = colors[1]), type = 'bar')%>%
      add_trace(y = Female, name = 'Female',marker = list(color = colors[2]) )%>%
      add_trace(x = categories[3], y = 4463296, name = "Total labor force" ,marker =list(color = colors[3]))%>%
      layout(title = "Employment status",margin = list(t = 80),xaxis = list(title = "Categories"), yaxis =list(title = "population"),
             paper_bgcolor = "white",plot_bgcolor = "white",legend = list(orientation = "h",y = -0.2))
    
  })
  
  #Employment by education attained
  
  output$employ <- renderPlotly({
    education <- factor(c("None","Primary","Lower Sec","Upper Sec","University","Completed TVET"), levels = c("None","Primary","Lower Sec","Upper Sec","University","Completed TVET"))
    rate <- c(18.4,19.7, 23.8, 32.4, 17.3,18.9)
    plot_ly(x = education, y = rate, type = "bar")%>%
      layout(title = "Unemployment chat",margin = list(t = 80),xaxis = list(title = "Education Completed"),
             yaxis =list(title = "percentages"),plot_bgcolor = "white",paper_bgcolor = "white",showlegend = FALSE )
    
  })
  
  #6year labor force indication  
  output$trend <- renderPlotly({
    years <- c("2017","2018","2019","2020","2021","2022")
    percen <- c(17.3, 15.1, 15.2, 17.9, 21.1, 20.5)
    participation <- c(53.4,54.2,53.4,56.4,54,56)
    Emp_pop <- c(44.2, 46, 45.3, 46.3, 42.6, 44.5)
    plot_ly(x = years,y = percen,name = "Unemployment rate",type = "scatter",mode = "lines+markers")%>%
      add_trace(y = participation,name = "Labor force perticipation rate")%>%
      add_trace(y = Emp_pop, name = "Employment to population ratio")%>%
      layout(xaxis = list(title = "years"),yaxis =list(title = "percentages"),
             paper_bgcolor = "lightgrey",plot_bgcolor = "lightgrey",legend = list(orientation = "h", y = -0.2))
    
  })
  
  #Income distribution by education
  output$income <- renderPlotly({
    education <- factor(c("None","Primary","L Secondary","U Secondary","University"),levels = c("None","Primary","L Secondary","U Secondary","University"))
    cash <- c( 29090, 38470, 54152, 93175, 305585)
    plot_ly(x = education, y = cash,color = education,colors = "navy",type = 'bar')%>%
      
      layout(showlegend = FALSE,xaxis = list(title = "Level of education"),yaxis =list(title = "amount in Rwf"),plot_bgcolor = "lightgrey")
  })
  
  #Not in education, employed or in training
  output$NEET <- renderPlotly({
    categ <- c("Urban", "Rural")
    Male <- c( 79048,425417)
    Female <- c(134258,579167)
    
    
    plot_ly(x = categ, y = Male,name = "Male",type = "bar")%>%
      add_trace(y = Female,name = "Female")%>%
      layout(title = "NEET Chat",margin = list(t = 80),xaxis = list(title = "gender"),yaxis = list(title ="population"),
             paper_bgcolor = "lightgrey", plot_bgcolor = 'lightgrey')
  })
 
  
  
  
}) 

shinyApp(ui = ui, server = server)

            






