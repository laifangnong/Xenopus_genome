#Rscript F:\ZGA\step_2.R

setwd('F:/ZGA')
load_data<-function(path){
	files<-dir(path,pattern='\\.txt',full.names=TRUE)
	name<-list.files(path)
	number<-length(name)
	tables<-lapply(files,function(x) read.table(x,header=TRUE))
	list_re<-list(NAME=name,TABLE=tables,NUMBER=number)
	return(list_re)}

paths<-'F:/ZGA/step_0/ter'
S<-load_data(paths)
as.data.frame(S$TABLE[2])[1:5,]
#,fill=TRUE
all_mean<-function(NAME,TABLE,NUMBER){
	ALL_col<-c()
	for (i in 1:NUMBER){   #每个table
		len_col=length(as.data.frame(TABLE[i])[1,])
		#print (len_col)
		mean_col<-c()
		for (j in 2:len_col){
			mean_col<-c(mean_col,mean(as.data.frame(TABLE[i])[,j]))	
		}
		ALL_col<-rbind(ALL_col,mean_col)		
	}
	return(ALL_col)
	#print (ALL_col)
}
MEAN_A<-all_mean(S$NAME,S$TABLE,S$NUMBER)
MEAN_A<-as.data.frame(MEAN_A)
NAME_A<-S$NAME
new_mean<-cbind(NAME_A,MEAN_A)
write.table(new_mean,file='step_2_ter.txt',sep='\t',quote=FALSE)

paths<-'F:/ZGA/step_0/ueno'
S<-load_data(paths)
as.data.frame(S$TABLE[2])[1:5,]
#,fill=TRUE
all_mean<-function(NAME,TABLE,NUMBER){
	ALL_col<-c()
	for (i in 1:NUMBER){   #每个table
		len_col=length(as.data.frame(TABLE[i])[1,])
		#print (len_col)
		mean_col<-c()
		for (j in 2:len_col){
			mean_col<-c(mean_col,mean(as.data.frame(TABLE[i])[,j]))	
		}
		ALL_col<-rbind(ALL_col,mean_col)		
	}
	return(ALL_col)
	#print (ALL_col)
}
MEAN_A<-all_mean(S$NAME,S$TABLE,S$NUMBER)
MEAN_A<-as.data.frame(MEAN_A)
NAME_A<-S$NAME
new_mean<-cbind(NAME_A,MEAN_A)
write.table(new_mean,file='step_2_ueno.txt',sep='\t',quote=FALSE)
