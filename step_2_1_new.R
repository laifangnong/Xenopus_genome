#Rscript.exe F:/ZGA/step_2_1.new.R 2 #arg[1] stage
args<-commandArgs(T)
arg1<-args[1]
setwd("F:\\ZGA\\step_2_1")
getwd()
library(pheatmap)
dt<-read.csv('F:/ZGA/TairaUeno_XENLA_stage.JGIv18pV2_cdna_final.bwa_mem+rsem.indiv_tpm.txt',sep='\t',header=T)#arg1
dt2<-dt[,2:length(dt[1,])]
rownames(dt2)<-dt[,1]
x<-1:28
x<-colnames(dt)
dt_T_name<-c(x[2],x[4],x[6],x[8],x[10],x[12],x[14],x[16],x[18],x[20],x[22])
dt_U_name<-c(x[3],x[5],x[7],x[9],x[11],x[13],x[15],x[17],x[19],x[21],x[23])

dt_T<-cbind(dt[,2],dt[,4],dt[,6],dt[,8],dt[,10],dt[,12],dt[,14],dt[,16],dt[,18],dt[,20],dt[,22])
dt_U<-cbind(dt[,3],dt[,5],dt[,7],dt[,9],dt[,11],dt[,13],dt[,15],dt[,17],dt[,19],dt[,21],dt[,23])
colnames(dt_T)<-dt_T_name
colnames(dt_U)<-dt_U_name
rname<-dt[,1]
rownames(dt_T)<-dt[,1]
rownames(dt_U)<-dt[,1]

x_T<-1:11
x_U<-1:11
######################################
sub_dt_T<-dt_T[is.na(dt_T[,1])==FALSE,]
sub_dt_T<-sub_dt_T[sub_dt_T[,1]!=0,]
write(sub_dt_T,file='sub_dt_T.txt',sep='\t')
sub_new_T<-as.data.frame(c())
col_name<-c()
row_name<-c()

length_T<-length(sub_dt_T[,1])

for (i in 1:length_T){
	tryCatch(
		if (as.numeric(sub_dt_T[i,as.numeric(arg1)+1])/as.numeric(sub_dt_T[i,as.numeric(arg1)])>2){
			if (as.numeric(sub_dt_T[i,as.numeric(arg1)+1])/as.numeric(sub_dt_T[i,as.numeric(arg1)])<=3){
				sub_new_T<-rbind(sub_new_T,sub_dt_T[i,])
				row_name<-c(row_name,row.names(sub_dt_T)[i])}}
				,error=function(e){""})}

sub_new_T<-as.data.frame(sub_new_T)
rownames(sub_new_T)<-row_name

#print (dt_T_name)
#print (sub_new_T[1:5,])
colnames(sub_new_T)<-dt_T_name
####################################
name=paste('T_St_',as.numeric(arg1),'_',as.numeric(arg1)+1,'_FC_2_3.txt',sep='')
#write.table(sub_new_T,file='sub_new_T_2_3.txt',sep='\t',quote=FALSE)
write.table(sub_new_T,file=name,sep='\t',quote=FALSE)


#sub_new_T[grep(pattern='unnamed',row.names(sub_new_T)),]##grep匹配row.names()包含unnamed行
ALL<-seq(1:length(sub_new_T[,1]))
sub_new_T<-sub_new_T[setdiff(ALL,grep(pattern='unnamed',row.names(sub_new_T))),]#不含unnamed行
name2=paste('T_St_',as.numeric(arg1),'_',as.numeric(arg1)+1,'_FC_2_3.png',sep='')
png(file=name2, bg="transparent", width = 800, height=600) 
pheatmap(as.matrix(log(sub_new_T+1,2)),cluster_col=FALSE,cexRow=0,cellheight=1,show_rownames = FALSE, show_colnames = FALSE)
dev.off()
#########################################################3
sub_dt_T<-dt_T[is.na(dt_T[,1])==FALSE,]
sub_dt_T<-sub_dt_T[sub_dt_T[,1]!=0,]
write(sub_dt_T,file='sub_dt_T.txt',sep='\t')
sub_new_T<-as.data.frame(c())
col_name<-c()
row_name<-c()
length_T<-length(sub_dt_T[,1])

for (i in 1:length_T){
	tryCatch(
		if (as.numeric(sub_dt_T[i,as.numeric(arg1)+1])/as.numeric(sub_dt_T[i,as.numeric(arg1)])>3){
			if (as.numeric(sub_dt_T[i,as.numeric(arg1)+1])/as.numeric(sub_dt_T[i,as.numeric(arg1)])<=4){
				sub_new_T<-rbind(sub_new_T,sub_dt_T[i,])
				row_name<-c(row_name,row.names(sub_dt_T)[i])}}
				,error=function(e){""})}

sub_new_T<-as.data.frame(sub_new_T)
rownames(sub_new_T)<-row_name
colnames(sub_new_T)<-dt_T_name
name=paste('T_St_',as.numeric(arg1),'_',as.numeric(arg1)+1,'_FC_3_4.txt',sep='')
#write.table(sub_new_T,file='sub_new_T_2_3.txt',sep='\t',quote=FALSE)
write.table(sub_new_T,file=name,sep='\t',quote=FALSE)


#sub_new_T[grep(pattern='unnamed',row.names(sub_new_T)),]##grep匹配row.names()包含unnamed行
ALL<-seq(1:length(sub_new_T[,1]))
sub_new_T<-sub_new_T[setdiff(ALL,grep(pattern='unnamed',row.names(sub_new_T))),]#不含unnamed行
name2=paste('T_St_',as.numeric(arg1),'_',as.numeric(arg1)+1,'_FC_3_4.png',sep='')
png(file=name2, bg="transparent", width = 800, height=600) 
pheatmap(as.matrix(log(sub_new_T+1,2)),cluster_col=FALSE,cexRow=0,cellheight=1,show_rownames = FALSE, show_colnames = FALSE)
dev.off()

###################################
sub_dt_T<-dt_T[is.na(dt_T[,1])==FALSE,]
sub_dt_T<-sub_dt_T[sub_dt_T[,1]!=0,]
write(sub_dt_T,file='sub_dt_T.txt',sep='\t')
sub_new_T<-as.data.frame(c())
col_name<-c()
row_name<-c()
length_T<-length(sub_dt_T[,1])

for (i in 1:length_T){
	tryCatch(
		if (as.numeric(sub_dt_T[i,as.numeric(arg1)+1])/as.numeric(sub_dt_T[i,as.numeric(arg1)])>4){
			if (as.numeric(sub_dt_T[i,as.numeric(arg1)+1])/as.numeric(sub_dt_T[i,as.numeric(arg1)])<=5){
				sub_new_T<-rbind(sub_new_T,sub_dt_T[i,])
				row_name<-c(row_name,row.names(sub_dt_T)[i])}}
				,error=function(e){""})}

sub_new_T<-as.data.frame(sub_new_T)
rownames(sub_new_T)<-row_name
colnames(sub_new_T)<-dt_T_name
name=paste('T_St_',as.numeric(arg1),'_',as.numeric(arg1)+1,'_FC_4_5.txt',sep='')
#write.table(sub_new_T,file='sub_new_T_4_5.txt',sep='\t',quote=FALSE)
write.table(sub_new_T,file=name,sep='\t',quote=FALSE)


#sub_new_T[grep(pattern='unnamed',row.names(sub_new_T)),]##grep匹配row.names()包含unnamed行
ALL<-seq(1:length(sub_new_T[,1]))
sub_new_T<-sub_new_T[setdiff(ALL,grep(pattern='unnamed',row.names(sub_new_T))),]#不含unnamed行
name2=paste('T_St_',as.numeric(arg1),'_',as.numeric(arg1)+1,'_FC_4_5.png',sep='')
png(file=name2, bg="transparent", width = 800, height=600) 
pheatmap(as.matrix(log(sub_new_T+1,2)),cluster_col=FALSE,cexRow=0,cellheight=1,show_rownames = FALSE, show_colnames = FALSE)
dev.off()
###############################
sub_dt_T<-dt_T[is.na(dt_T[,1])==FALSE,]
sub_dt_T<-sub_dt_T[sub_dt_T[,1]!=0,]
write(sub_dt_T,file='sub_dt_T.txt',sep='\t')
sub_new_T<-as.data.frame(c())
col_name<-c()
row_name<-c()
length_T<-length(sub_dt_T[,1])

for (i in 1:length_T){
	tryCatch(
		if (as.numeric(sub_dt_T[i,as.numeric(arg1)+1])/as.numeric(sub_dt_T[i,as.numeric(arg1)])>5){
			if (as.numeric(sub_dt_T[i,as.numeric(arg1)+1])/as.numeric(sub_dt_T[i,as.numeric(arg1)])<=1000){
				sub_new_T<-rbind(sub_new_T,sub_dt_T[i,])
				row_name<-c(row_name,row.names(sub_dt_T)[i])}}
				,error=function(e){""})}

sub_new_T<-as.data.frame(sub_new_T)
rownames(sub_new_T)<-row_name
colnames(sub_new_T)<-dt_T_name
name=paste('T_St_',as.numeric(arg1),'_',as.numeric(arg1)+1,'_FC_5_1000.txt',sep='')
#write.table(sub_new_T,file='sub_new_T_5_1000.txt',sep='\t',quote=FALSE)
write.table(sub_new_T,file=name,sep='\t',quote=FALSE)


#sub_new_T[grep(pattern='unnamed',row.names(sub_new_T)),]##grep匹配row.names()包含unnamed行
ALL<-seq(1:length(sub_new_T[,1]))
sub_new_T<-sub_new_T[setdiff(ALL,grep(pattern='unnamed',row.names(sub_new_T))),]#不含unnamed行
name2=paste('T_St_',as.numeric(arg1),'_',as.numeric(arg1)+1,'_FC_5_1000.png',sep='')
png(file=name2, bg="transparent", width = 800, height=600) 
pheatmap(as.matrix(log(sub_new_T+1,2)),cluster_col=FALSE,cexRow=0,cellheight=1,show_rownames = FALSE, show_colnames = FALSE)
dev.off()
############################################


##########################################
#sub_new_T[grep(pattern='unnamed',row.names(sub_new_T)),]##grep匹配row.names()包含unnamed行
##install.packages('dplyr')
##library(dplyr)
##sub_new_T2 = filter(sub_new_T, IP_CR_RSK_RTG_ID !='22140023')
#ALL<-seq(1:length(sub_new_T[,1]))
#sub_new_T<-sub_new_T[setdiff(ALL,grep(pattern='unnamed',row.names(sub_new_T))),]#不含unnamed行

#pheatmap(as.matrix(log(sub_new_T+1,2)),cluster_col=FALSE,cexRow=0,cellheight=1,show_rownames = FALSE, show_colnames = FALSE)
###################################
#A<-log(sub_new_T+1,2)#log2(TPM+1)





###########################
############################
#############################
######################################
sub_dt_U<-dt_U[is.na(dt_U[,1])==FALSE,]
sub_dt_U<-sub_dt_U[sub_dt_U[,1]!=0,]
write(sub_dt_U,file='sub_dt_U.txt',sep='\t')
sub_new_U<-as.data.frame(c())
col_name<-c()
row_name<-c()

length_U<-length(sub_dt_U[,1])

for (i in 1:length_U){
	tryCatch(
		if (as.numeric(sub_dt_U[i,as.numeric(arg1)+1])/as.numeric(sub_dt_U[i,as.numeric(arg1)])>2){
			if (as.numeric(sub_dt_U[i,as.numeric(arg1)+1])/as.numeric(sub_dt_U[i,as.numeric(arg1)])<=3){
				sub_new_U<-rbind(sub_new_U,sub_dt_U[i,])
				row_name<-c(row_name,row.names(sub_dt_U)[i])}}
				,error=function(e){""})}

sub_new_U<-as.data.frame(sub_new_U)
rownames(sub_new_U)<-row_name
colnames(sub_new_U)<-dt_U_name
####################################
name=paste('U_St_',as.numeric(arg1),'_',as.numeric(arg1)+1,'_FC_2_3.txt',sep='')
#write.table(sub_new_U,file='sub_new_U_2_3.txt',sep='\t',quote=FALSE)
write.table(sub_new_U,file=name,sep='\t',quote=FALSE)


#sub_new_U[grep(pattern='unnamed',row.names(sub_new_U)),]##grep匹配row.names()包含unnamed行
ALL<-seq(1:length(sub_new_U[,1]))
sub_new_U<-sub_new_U[setdiff(ALL,grep(pattern='unnamed',row.names(sub_new_U))),]#不含unnamed行
name2=paste('U_St_',as.numeric(arg1),'_',as.numeric(arg1)+1,'_FC_2_3.png',sep='')
png(file=name2, bg="transparent", width = 800, height=600) 
pheatmap(as.matrix(log(sub_new_U+1,2)),cluster_col=FALSE,cexRow=0,cellheight=1,show_rownames = FALSE, show_colnames = FALSE)
dev.off()
#########################################################3
sub_dt_U<-dt_U[is.na(dt_U[,1])==FALSE,]
sub_dt_U<-sub_dt_U[sub_dt_U[,1]!=0,]
write(sub_dt_U,file='sub_dt_U.txt',sep='\t')
sub_new_U<-as.data.frame(c())
col_name<-c()
row_name<-c()
length_U<-length(sub_dt_U[,1])

for (i in 1:length_U){
	tryCatch(
		if (as.numeric(sub_dt_U[i,as.numeric(arg1)+1])/as.numeric(sub_dt_U[i,as.numeric(arg1)])>3){
			if (as.numeric(sub_dt_U[i,as.numeric(arg1)+1])/as.numeric(sub_dt_U[i,as.numeric(arg1)])<=4){
				sub_new_U<-rbind(sub_new_U,sub_dt_U[i,])
				row_name<-c(row_name,row.names(sub_dt_U)[i])}}
				,error=function(e){""})}

sub_new_U<-as.data.frame(sub_new_U)
rownames(sub_new_U)<-row_name
colnames(sub_new_U)<-dt_U_name
name=paste('U_St_',as.numeric(arg1),'_',as.numeric(arg1)+1,'_FC_3_4.txt',sep='')
#write.table(sub_new_U,file='sub_new_U_2_3.txt',sep='\t',quote=FALSE)
write.table(sub_new_U,file=name,sep='\t',quote=FALSE)


#sub_new_U[grep(pattern='unnamed',row.names(sub_new_U)),]##grep匹配row.names()包含unnamed行
ALL<-seq(1:length(sub_new_U[,1]))
sub_new_U<-sub_new_U[setdiff(ALL,grep(pattern='unnamed',row.names(sub_new_U))),]#不含unnamed行
name2=paste('U_St_',as.numeric(arg1),'_',as.numeric(arg1)+1,'_FC_3_4.png',sep='')
png(file=name2, bg="transparent", width = 800, height=600) 
pheatmap(as.matrix(log(sub_new_U+1,2)),cluster_col=FALSE,cexRow=0,cellheight=1,show_rownames = FALSE, show_colnames = FALSE)
dev.off()

###################################
sub_dt_U<-dt_U[is.na(dt_U[,1])==FALSE,]
sub_dt_U<-sub_dt_U[sub_dt_U[,1]!=0,]
write(sub_dt_U,file='sub_dt_U.txt',sep='\t')
sub_new_U<-as.data.frame(c())
col_name<-c()
row_name<-c()
length_U<-length(sub_dt_U[,1])

for (i in 1:length_U){
	tryCatch(
		if (as.numeric(sub_dt_U[i,as.numeric(arg1)+1])/as.numeric(sub_dt_U[i,as.numeric(arg1)])>4){
			if (as.numeric(sub_dt_U[i,as.numeric(arg1)+1])/as.numeric(sub_dt_U[i,as.numeric(arg1)])<=5){
				sub_new_U<-rbind(sub_new_U,sub_dt_U[i,])
				row_name<-c(row_name,row.names(sub_dt_U)[i])}}
				,error=function(e){""})}

sub_new_U<-as.data.frame(sub_new_U)
rownames(sub_new_U)<-row_name
colnames(sub_new_U)<-dt_U_name
name=paste('U_St_',as.numeric(arg1),'_',as.numeric(arg1)+1,'_FC_4_5.txt',sep='')
#write.table(sub_new_U,file='sub_new_U_2_3.txt',sep='\t',quote=FALSE)
write.table(sub_new_U,file=name,sep='\t',quote=FALSE)


#sub_new_U[grep(pattern='unnamed',row.names(sub_new_U)),]##grep匹配row.names()包含unnamed行
ALL<-seq(1:length(sub_new_U[,1]))
sub_new_U<-sub_new_U[setdiff(ALL,grep(pattern='unnamed',row.names(sub_new_U))),]#不含unnamed行
name2=paste('U_St_',as.numeric(arg1),'_',as.numeric(arg1)+1,'_FC_4_5.png',sep='')
png(file=name2, bg="transparent", width = 800, height=600) 
pheatmap(as.matrix(log(sub_new_U+1,2)),cluster_col=FALSE,cexRow=0,cellheight=1,show_rownames = FALSE, show_colnames = FALSE)
dev.off()
###############################
sub_dt_U<-dt_U[is.na(dt_U[,1])==FALSE,]
sub_dt_U<-sub_dt_U[sub_dt_U[,1]!=0,]
write(sub_dt_U,file='sub_dt_U.txt',sep='\t')
sub_new_U<-as.data.frame(c())
col_name<-c()
row_name<-c()
length_U<-length(sub_dt_U[,1])

for (i in 1:length_U){
	tryCatch(
		if (as.numeric(sub_dt_U[i,as.numeric(arg1)+1])/as.numeric(sub_dt_U[i,as.numeric(arg1)])>5){
			if (as.numeric(sub_dt_U[i,as.numeric(arg1)+1])/as.numeric(sub_dt_U[i,as.numeric(arg1)])<=1000){
				sub_new_U<-rbind(sub_new_U,sub_dt_U[i,])
				row_name<-c(row_name,row.names(sub_dt_U)[i])}}
				,error=function(e){""})}

sub_new_U<-as.data.frame(sub_new_U)
rownames(sub_new_U)<-row_name
colnames(sub_new_U)<-dt_U_name
name=paste('U_St_',as.numeric(arg1),'_',as.numeric(arg1)+1,'_FC_5_1000.txt',sep='')
#write.table(U_sub_new_U,file='sub_new_U_5_1000.txt',sep='\t',quote=FALSE)
write.table(sub_new_U,file=name,sep='\t',quote=FALSE)


#sub_new_U[grep(pattern='unnamed',row.names(sub_new_U)),]##grep匹配row.names()包含unnamed行
ALL<-seq(1:length(sub_new_U[,1]))
sub_new_U<-sub_new_U[setdiff(ALL,grep(pattern='unnamed',row.names(sub_new_U))),]#不含unnamed行
name2=paste('U_St_',as.numeric(arg1),'_',as.numeric(arg1)+1,'_FC_5_1000.png',sep='')
png(file=name2, bg="transparent", width = 800, height=600) 
pheatmap(as.matrix(log(sub_new_U+1,2)),cluster_col=FALSE,cexRow=0,cellheight=1,show_rownames = FALSE, show_colnames = FALSE)
dev.off()
############################################
