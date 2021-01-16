library(shiny)


ui<-navbarPage( title = div(tags$a(img(src="12.jpg",height=40,align="left")),style = "position: relative; top: -5px;",""),
               inverse = T,collapsible = T,
               ## 第一个页面
               tabPanel("Gene Ontology",
                        sidebarLayout(
                          sidebarPanel(width = 2,textAreaInput("text_area_list",
                                                               label = "Please input protein id, one per line",
                                                               height = "200px",
                                                               width="180px",
                                                               value="Pg00001"),
                                       selectInput('id_type',label="Input gene-id Type:",
                                                   selected = "A",choices = c("A","B","C")),
                                       helpText("You are!"),
                                       numericInput("pval_cutoff",label = "pvalue-Cutoff",
                                                    value=1,min = 0.001,max=1,step = 0.001),
                                       numericInput("qval_cutoff",label="qvalue-CutOff",value=1,
                                                    min = 0.001,max=1,step=0.001),
                                       hr(),
                                       helpText("After submit it may take 1-2 minutes. Check Progress bar in right side cornor"),
                                       actionButton("submit",label = "Submit",icon=icon('angle-double-right')),
                                       tags$hr()
                                       ),
                          mainPanel(
                            helpText("Note: After submit it may take 1-2 minutes. Check Progress bar in right side cornor."),
                            tags$hr(),
                            textOutput("gene_number_info"),
                            tags$hr(),
                            DT::dataTableOutput(outputId = "gene_number_info_table")
                          )
                        )),
               
               ##第二个页面
               tabPanel("XXX Ontology",
                        #titlePanel(""),
                        sidebarLayout(
                          sidebarPanel(
                            helpText("Select a stock to examine.

                                    Information will be collected from Yahoo finance.",width = 4),
                            textInput("symb", "Symbol", "SPY"),
                            dateRangeInput("dates",
                                           "Date range",
                                           start = "2013-01-01",
                                           end = as.character(Sys.Date())),
                            
                            br(),#换行符
                            br(),
                            
                            checkboxInput("log", "Plot y axis on log scale",
                                          value = FALSE),
                            
                            checkboxInput("adjust",
                                          "Adjust prices for inflation", value = FALSE)
                          ),
                          mainPanel(
                            plotOutput("plot")
                          )
                        )
                    ),
               
               ## 第三个页面
               tabPanel("实时输入输出",
                        titlePanel("实时输入输出"),
                        sidebarLayout(
                          sidebarPanel(
                            h1("Input Something"),
                            textAreaInput("inputsomething",
                                          label = "在这写",
                                          height = "200px",
                                          width="180px",
                                          value="")
                            # textInput("inputsomething", label = "", value = "",
                            #           placeholder = "在这写")
                          ),
                          mainPanel(
                            h1("OutputSomething:"),
                            textOutput("results")
                          )
                        )
               ),
               
               ##第四个页面
               tabPanel("有道翻译",
                        sidebarLayout(
                          sidebarPanel(
                            h1("有道实时翻译"),
                            textAreaInput("inputword",
                                          label = "单词查询",
                                          height = "200px",
                                          width="380px",
                                          value="call me")
                            # textInput("inputword", label = "", value = "",
                            #           placeholder = "call me")
                          ),
                          mainPanel(
                            helpText("现阶段只能翻译两个之内的单词，抱歉"),
                            h1("英文翻译结果："),
                            br(),
                            textOutput("wordresult")
                          )
                        )
               ),
               
               ##第五个页面
               tabPanel("天气预报观察",
                        sidebarLayout(
                          sidebarPanel(
                            
                          ),
                          mainPanel(
                            
                          )
                        )
               ),
               
               ##第六个页面
               tabPanel("XXX Ontology",
                        sidebarLayout(
                          sidebarPanel(
                            
                          ),
                          mainPanel(
                            
                          )
                        )
               ),
               ##第七个页面
               tabPanel("XXX Ontology",
                        sidebarLayout(
                          sidebarPanel(
                            
                          ),
                          mainPanel(
                            
                          )
                        )
               ),
               
               ##第八个页面
               tabPanel("XXX Ontology",
                        sidebarLayout(
                          sidebarPanel(
                            
                          ),
                          mainPanel(
                            
                          )
                        )
               )
               
 )