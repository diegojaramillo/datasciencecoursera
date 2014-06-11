#Pollutantmean function, Diego Jaramillo Celis
#Parameters:
# 1.Directory: character vector that indicate the location of the CSV files
# 2.Pollutant: the pollutant (ulfate, nitrate) for which we will calculate the mean 
# 3.id: integer vector indicating the monitor ID numbers to be used

#the function return the mean of the pollutant across all monitors... 
#... list in the 'id' vector (ignoring NA values)

pollutantmean <- function(directory, pollutant, id = 1:332){
  
  #Exploro el directorio para cargar al vector todos los nombres de archivos
  #Scan the directory for load to vector all the file names on it
  directorio <- dir (directory, all.files=FALSE, full.names=TRUE)
  
  #Vector usado solo para conocer la media cuando se requiere leer varios archivos
  #Vector used only to know the mean when read several files
  vec<-vector()  
  
  #ciclo para leer los archivos solicitados 
  #loop for read the requested files 
  for (i in id){
    
    #seleccionar el archivo a cargar
    #select file to be load
    path<-directorio[[i]]
    
    #leer el archivo
    #Read the file
    archivo<-read.csv(path)
    
    #seleccionar los valores del contaminante ingresado
    #select values for the input pollutant
    valR<-archivo[, pollutant]
    
    #Vector resultante (esto es para el manejo de varios id)
    #resultant vector (for manage several files id)
    vec<- c(vec, valR)
  }
  
  #Calculo de la media redondeando a 3 digitos sobre el vector resultante
  #Mean rounded to 3 digits over the resultant vector
  round(mean(vec, na.rm = TRUE), digits = 3)
}