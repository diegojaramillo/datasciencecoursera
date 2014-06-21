#Complete function, Diego Jaramillo Celis
#Parameters:
# 1.Directory: character vector that indicate the location of the CSV files 
# 2.id: integer vector indicating the monitor ID numbers to be used

#the function return a dataframe "id", "nobs" where 'id' is the monitor ID number... 
#... and 'nobs' is the number of complete cases

complete <- function(directory, id = 1:332) {
  
  #Exploro el directorio para cargar al vector todos los nombres de archivos
  #Scan the directory for load to vector all the file names on it
  directorio <- dir (directory, all.files=FALSE, full.names=TRUE)
  
  #dataframe usado para almacenar el resultado final
  #dataframe used only for final result
  DF <-data.frame()
  
  #nombres de las columnas del dataframe
  #dataframe columns names
  cnames<- c("id","nobs")
  
  #ciclo para leer los archivos solicitados 
  #loop for read the requested files 
  for (i in id){
    
    #seleccionar el archivo a cargar
    #select file to be load
    path<-directorio[[i]]
    
    #leer el archivo
    #Read the file
    archivo<-read.csv(path)
    
    #Seleccionar y contar los registros completos (sin NA)
    #select and count complete rows (without NA)
    nobs<-NROW(na.omit(archivo))
  
    #creación del dataframe
    #create dataframe
    dataframe<-data.frame(i, nobs)
    
    #Dar nombres a las columnas del dataframe
    #give name to Dataframe columns  
    colnames(dataframe)<-cnames
    
    #Unir los resultados del ciclo
    #Union of loop results
    DF<-rbind(DF,dataframe)
  }
  #Imprimir dataframe
  #Print dataframe
  DF
}

