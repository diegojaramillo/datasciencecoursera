#Complete function, Diego Jaramillo Celis
#Parameters:
# 1.Directory: character vector that indicate the location of the CSV files 
# 2.threshold: numeric vector of length 1 indicating the number of completely observed observations

corr <- function(directory, threshold = 0) {
  
  #Exploro el directorio para cargar al vector todos los nombres de archivos
  #Scan the directory for load to vector all the file names on it
  directorio <- dir (directory, all.files=FALSE, full.names=TRUE)
  
  #Vector creado en caso de no obtener datos 
  #Vector created in no data found
  crltn <- c() 
  
  for(i in 1:length(directorio)){
    
    #leer el archivo
    #Read the file
    archivo <- read.csv(directorio[[i]])
    
    #Guarda en la variable archivo, solo registros completos (sin NA)
    #Save only complete regs in "archivo" variable
    archivo <- archivo[complete.cases(archivo),]
    
    #verifica si el valor > umbral
    #verify if val > threshold
    if ( nrow(archivo) > threshold ) {
      
      #Anexa al vector las correlaciones entre sulfato y nitrato
      #Append to vector cor between sultate and nitrate
      crltn <- c(crltn, cor(archivo$sulfate, archivo$nitrate) )
    }
  }
  #Imprimir correlaciones
  #Print correlations
  crltn
}
