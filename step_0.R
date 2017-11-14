#Rscript F:/ZGA/step_0.R 4 5 2 3 1
#[[egg,1][st8,2],[st9,3],[st10,4],[st12,5],[st15,6],[st20,7],[st25,8],[st30,9],[st35,10],[st40,11]]

args<-commandArgs(T)
args_3<-as.numeric(as.character(args[3]))
args_4<-as.numeric(as.character(args[4]))
print (args_3)
print(2)
dt<-read.csv('F:/ZGA/TairaUeno_XENLA_stage.JGIv18pV2_cdna_final.bwa_mem+rsem.indiv_tpm.txt',sep='\t',header=T)#arg1
dt2<-dt[,2:length(dt[1,])]
rownames(dt2)<-dt[,1]

barplot(as.matrix(dt2[1,]))



x<-1:28


x<-colnames(dt)
#plot(x,as.matrix(dt2[1,]),type='l',ylim=c(0,30000))


#for (i in 2:length(dt2[,1])){
#lines(x,dt2[i,])
#}


dt_T_name<-c(x[2],x[4],x[6],x[8],x[10],x[12],x[14],x[16],x[18],x[20],x[22])
dt_U_name<-c(x[3],x[5],x[7],x[9],x[11],x[13],x[15],x[17],x[19],x[21],x[23])

dt_T<-cbind(
dt[,2],
dt[,4],
dt[,6],
dt[,8],
dt[,10],
dt[,12],
dt[,14],
dt[,16],
dt[,18],
dt[,20],
dt[,22])
dt_U<-cbind(
dt[,3],
dt[,5],
dt[,7],
dt[,9],
dt[,11],
dt[,13],
dt[,15],
dt[,17],
dt[,19],
dt[,21],
dt[,23])
colnames(dt_T)<-dt_T_name
colnames(dt_U)<-dt_U_name

rname<-dt[,1]
#print (rname[1])

#rownames(dt_T)<-dt[,1]
#rownames(dt_U)<-dt[,1]

#print (dt_T[1:10,])
#print (dt_U[1:10,])

x_T<-1:11
x_U<-1:11

#print (dt_T_name)
######################
library(stringr)

wd1<-paste('F:/ZGA/step_0/ter/ter_fold_',args[1],'_',args[2],'_stage_',args[3],'_',args[4], sep="")
dir.create(wd1)
print(wd1)
setwd(wd1)
#setwd('/Users/manson/Desktop/mbt/ter5/')#arg1
#fileConn<-file("G:\\mmbt\\mbt\\ter5.txt")
#print (fileConn)
L<-length(rname)

tmp_head=c()
tmp_head_0=str_c('gene','\t')

for (x in (1:length(dt_T_name))){
	if (x==1){tmp_head=str_c(tmp_head_0,dt_T_name[x],'\t')}
	else{
		tmp_head=str_c(tmp_head,dt_T_name[x],'\t')}
	
}


stat1_file<-paste('F:/ZGA/step_0/ter/ter_fold_',args[1],'_',args[2],'_stage_',args[3],'_',args[4],'.txt', sep="")
#cat(tmp_head,file="G:/mmbt/mbt/ter5.txt",sep="\n",append=TRUE)#arg1
cat(tmp_head,file=stat1_file,sep="\n",append=TRUE)#arg1


for (i in 1:L){
	tryCatch(
		if (min(dt_T[i,args_3],dt_T[i,args_4])>=args[5]){#arg5 TPM_min threshold
			if (as.numeric(dt_T[i,args_4]/dt_T[i,args_3])>args[1]){#arg1 min_threshold
				if (as.numeric(dt_U[i,args_4]/dt_U[i,args_3])<args[2]){  #arg2 max_threshold
					#print (1)
					#options(bitmapType='cairo')
					#print (as.factor(paste(rname[i],'.png', sep="")))
					#cairo_png(paste(rname[i],'.png', sep=""))#,100,100)
					
					#png(rname[i],width=100,height=100)
					#nn=paste(rname[i],'.png', sep="")
					#png(nn)#,width=800,height=800)
					#plot(x_T,as.matrix(dt_T[i,]),type='l',axes =FALSE,xlab='stage',ylab='TPM',main=rname[i])
					#axis(side=1,at=1:11,labels=dt_T_name)
					#axis(side=2,at=seq(0,max(dt_T[i,]),max(dt_T[i,]/10)))
					#dev.off()
					#print (class(dt_T[i,]))
					#print (length(dt_T[i,]))
					#writeLines(dt_T[i,], sep = "\n", fileConn)
					#tmp=dt_T[i,]
					tmp_string=c()
					for (j in 1:11){
						if (j==1){tmp_string=str_c(rname[i],dt_T[i,j],sep='\t')
						tmp_string=str_c(tmp_string,'\t',sep='')}
						else{tmp_string=str_c(tmp_string,dt_T[i,j],'\t')}}
					#print (tmp_string)
					#cat(tmp_string,file="G:/mmbt/mbt/ter5.txt",sep="\n",append=TRUE)#arg2
					cat(tmp_string,file=stat1_file,sep="\n",append=TRUE)#arg2
					tmp_string=c()
					close(fileConn)	}}

	},error=function(e){""})
}
warnings()
#############
#setwd('G:/mmbt/mbt/ueno5/')#arg1
wd1<-paste('F:/ZGA/step_0/ueno/ueno_fold_',args[1],'_',args[2],'_stage_',args[3],'_',args[4], sep="")
dir.create(wd1)
setwd(wd1)
#fileConn<-file("G:/mmbt/mbt/ter5.txt")
#print (fileConn)
L<-length(rname)

tmp_head=c()
tmp_head_0=str_c('gene','\t')

for (x in (1:length(dt_U_name))){
	if (x==1){tmp_head=str_c(tmp_head_0,dt_U_name[x],'\t')}
	else{
		tmp_head=str_c(tmp_head,dt_U_name[x],'\t')}
	
}


stat2_file<-paste('F:/ZGA/step_0/ueno/ueno_fold_',args[1],'_',args[2],'_stage_',args[3],'_',args[4],'.txt', sep="")
#cat(tmp_head,file="G:/mmbt/mbt/ueno5.txt",sep="\n",append=TRUE)#arg1
cat(tmp_head,file=stat2_file,sep="\n",append=TRUE)#arg1



for (i in 1:L){
	tryCatch(
		if (min(dt_U[i,args_3],dt_U[i,args_4])>=args[5]){#arg5 TPM_min_threshold
			if (as.numeric(dt_U[i,args_4]/dt_U[i,args_3])>args[1]){#arg1 min_threshold
				if (as.numeric(dt_U[i,args_4]/dt_U[i,args_3])<args[2]){  #arg2 max_threshold
					#nn=paste(rname[i],'.png', sep="")
					#print(nn)
					#png(nn)#,width=800,height=800)
					#plot(x_U,as.matrix(dt_U[i,]),type='l',axes =FALSE,xlab='stage',ylab='TPM',main=rname[i])
					#axis(side=1,at=1:11,labels=dt_U_name)
					#axis(side=2,at=seq(0,max(dt_U[i,]),max(dt_U[i,]/10)))
					#dev.off()
					#print (class(dt_T[i,]))
					#print (length(dt_T[i,]))
					#writeLines(dt_T[i,], sep = "\n", fileConn)
					#tmp=dt_T[i,]
					tmp_string=c()
					for (j in 1:11){
						if (j==1){tmp_string=str_c(rname[i],dt_U[i,j],sep='\t')
						tmp_string=str_c(tmp_string,'\t',sep='')}
						else{tmp_string=str_c(tmp_string,dt_U[i,j],'\t')}}
					#print (tmp_string)
					#cat(tmp_string,file="G:/mmbt/mbt/ueno5.txt",sep="\n",append=TRUE)#arg2
					cat(tmp_string,file=stat2_file,sep="\n",append=TRUE)#arg2
					tmp_string=c()
					close(fileConn)	}}

	},error=function(e){""})
}
warnings()