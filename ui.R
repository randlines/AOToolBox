shinyUI(fluidPage(

  ##Application title
  br(),
  includeMarkdown("rmarkdown/WelcomeAO.Rmd"),
	br(),
  br(),
  br(),
	tabsetPanel(
	id = "panels",
	tabPanel("What is AO Toolbox?", includeMarkdown("rmarkdown/AnimalObserver.Rmd")),
    tabPanel("Create behavioral protocol file",
    br(),
    sidebarLayout(
  
    # Sidebar with a slider input
    sidebarPanel(
    fileInput('dyadic', '1. Upload dyadic interactions csv file',
                accept=c('text/csv', 
								 'text/comma-separated-values,text/plain', 
								 '.csv')),
	fileInput('scan', '2. Upload activity (scan) csv file',
                accept=c('text/csv',
								 'text/comma-separated-values,text/plain', 
								 '.csv')),
	fileInput('solo', '3. Upload self-directed/health csv file',
                accept=c('text/csv',
								 'text/comma-separated-values,text/plain', 
								 '.csv')),
	fileInput('foods', '4. Upload optional list of food items (csv file)',
                accept=c('text/csv',
								 'text/comma-separated-values,text/plain', 
								 '.csv')),
	textInput("version", label = '5. Enter protocol version (mandatory):', value = "vX.X"),
	hr(),
    actionButton("run", label = "Run", icon=icon("play")),
	downloadButton('downloadBehaviorsJson', 'Download behaviors.json')
    ),
    mainPanel(
      textOutput("text1"),
      tabsetPanel(id="panels2",
                  
                  tabPanel("Instructions", includeMarkdown("rmarkdown/Create_structure.Rmd"))#,
                  #tabPanel("Dyadic"),
                  #tabPanel("Scan"),
                  #tabPanel("Solo"),
                  #tabPanel("Foods"),
                  #tabPanel("View protocol")
    )
    ))),
	################################################
	################################################
    tabPanel("Create group composition file",
    br(),
    sidebarLayout(
   sidebarPanel(
    #helpText("Upload list of individuals"),
    fileInput('compo', 'Upload group composition csv file',
                accept=c('text/csv', 
								 'text/comma-separated-values,text/plain', 
								 '.csv')),
	hr(),
	downloadButton('downloadAnimalsJson', 'Download animals.json')
    ),
    mainPanel(
      tabsetPanel(id="panels3",
      tabPanel("Instructions", includeMarkdown("rmarkdown/Create_animals_list.Rmd"))#,
      #tabPanel("Group composition")
      ),
      textOutput("text2")
    )
    )
    ),
	################################################
	################################################
	tabPanel("Create global variables file",
	br(),
    sidebarLayout(
    # Sidebar with a slider input
    sidebarPanel(
    #helpText("Upload file"),
    
      fileInput('layout', '1. Upload your layout_info.json file (if you do not have one yet, skip this step and select "template" below)'),
      
      radioButtons("run3", "2. Choose whether you want to edit the uploaded layout_info.json file or use the default template",
                   c("uploaded file" = "upl",
                     "template" = "tpl")),

      actionButton("template", label = "Start editing options",  icon=icon("play")),
      br(),
      br(),
      fileInput('dayVars', '3. Upload session variables csv file',
                accept=c('text/csv', 
								 'text/comma-separated-values,text/plain', 
								 '.csv')),
	  fileInput('focalVars', '4. Upload focal variables csv file',
                accept=c('text/csv', 
								 'text/comma-separated-values,text/plain', 
								 '.csv')),
	  fileInput('scanVars', '5. Upload scan variables csv file',
                accept=c('text/csv', 
								 'text/comma-separated-values,text/plain', 
								 '.csv')),
	  fileInput('contVars', '6. Upload continuous focal variables csv file (optional)',
                accept=c('text/csv', 
								 'text/comma-separated-values,text/plain', 
								 '.csv')), 
br(),
    textInput("versionLayout", label = '7. Enter protocol version (mandatory):', value = "vX.X"),
	hr(),
    actionButton("run2", label = "Run", icon=icon("play")),
	downloadButton('downloadLayoutJson', 'Download layout_info.json')
    ),    
    mainPanel(
      tabsetPanel(id="panels4",
                  tabPanel("Instructions",
                  includeMarkdown("rmarkdown/Create_layout_info.Rmd")
                  ),
                  tabPanel("Session setup",
                  #includeMarkdown("rmarkdown/Create_structure.Rmd"),
                  br(),
                  textOutput("text3"),
   				  htmlOutput("TextPin"),
   				  br(),
                  rHandsontableOutput("layoutPin"),
                  br(), 
                  htmlOutput("TextOptions"),
                  rHandsontableOutput("layoutOptions"),
                  br(),
                  br(),
                  br(),
                  br(),
                  br(),
                  br(),
                  br(),
                  br(),
                  br(),
                  br(),
                  br(),
                  br(),
                  br(),
                  br()
                  )
                  #tabPanel("Session variables"),
                  #tabPanel("Focal variables"),
                  #tabPanel("Scan variables"),
                  #tabPanel("Continuous variables"),
                  #tabPanel("View protocol")
    )
    )
    )
    ),
	################################################
	################################################
	  tabPanel("Additional customizations", includeMarkdown("rmarkdown/Customizations.Rmd"),
	  br(),
	  br(),
	  br(),
	  br(),
	  br(),
	  br(),
	  br(),
	  br(),
	  br(),
	  br(),
	  br(),
	  br()),
    tabPanel("Convert collected data to csv",
    br(),
   
    sidebarLayout(

    # Sidebar with a slider input
    sidebarPanel(
    #helpText("Upload collected data"),
    fileInput('json.output.file', '1. Upload "Username_Date_Time.dat"'),
	fileInput('behaviors.json', '2. Upload "behaviors.json"'),
    fileInput('layout_info.json', '3. Upload "layout_info.json"'),
    downloadButton("downloadZip", label = "Download all data as zip"),
    br(), br(), h5("    OR"), br(),      
      downloadButton('downloadSessionsTable', 'Download list of sessions'),
      downloadButton('downloadFocalsTable', 'Download list of focals'),
      downloadButton('downloadBehaviorsTable', 'Download list of behaviors'),
	  downloadButton('downloadScansTable', 'Download list of scans'),
	  downloadButton('downloadBackgroundTapsTable', 'Download list of background taps'),
	  downloadButton('downloadCommentsTable', 'Download list of comments'),
	  downloadButton('downloadDayVarsTable', 'Download day variables'),
	  downloadButton('downloadFocalVarsTable', 'Download focal variables'),
	  downloadButton('downloadContinuousVarsTable', 'Download global variables'),
  	  downloadButton('downloadScanVarsTable', 'Download scan variables')
    ),
    mainPanel(
      tabsetPanel(id="panels5",
          tabPanel("Instructions", includeMarkdown("rmarkdown/Convert_datatocsv.Rmd"))),

		textOutput("sessionsTable.csv"),
		tableOutput("table1"),
		br(),
		textOutput("focalsTable.csv"),
		tableOutput("table2"),
		br(),
		textOutput("behaviorsTable.csv"),
		tableOutput("table3"),
		br(),
		textOutput("scansTable.csv"),
		tableOutput("table4"),
		br(),
		textOutput("backgroundTapsTable.csv"),
		tableOutput("table5"),
		br(),
		textOutput("commentsTable.csv"),
		tableOutput("table6"),
		br(),
		textOutput("dayVarsTable.csv"),
		tableOutput("table7"),
		br(),
		textOutput("focalVarsTable.csv"),
		tableOutput("table8"),
		br(),
		textOutput("continuousVarsTable.csv"),
		tableOutput("table9"),
		br(),
		textOutput("scanVarsTable.csv"),
		tableOutput("table10"),
		br()
)
)
)
)
)
)