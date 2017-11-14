#Rscript.exe F:/ZGA/step3_kegg_plot_Xl.R F:/ZGA/step_0/ter F:/ZGA/step_0/ter/ter_fold_0_1_stage_2_3.txt
args<-commandArgs(T)
setwd('F:/ZGA/step_3')
library(clusterProfiler)
library(pathview)
arg1<-args[1]#input_dir
arg2<-args[2]#input_file

#arg1<-"d:/genex/"
#arg2<-"DEG_all_D_L_1.csv"
setwd(arg1)#"D:/work/7.6/DEG_ALL"
dt1<-read.table(arg2,stringsAsFactors = F,sep='\t')#'DEG_all_D_L_1.csv'
#dt1<-read.table('F:/ZGA/step_0/ter/ter_fold_0_1_stage_2_3.txt',stringsAsFactors = F,sep='\t',header=TRUE)#'DEG_all_D_L_1.csv'


name<-c()
length_row<-length(dt1[,1])
for (i in 1:length_row){
name<-c(name,substring(unlist(strsplit(dt1[i,1],split='|',fixed=TRUE))[1],1,as.numeric(nchar(unlist(strsplit(dt1[i,1],split='|',fixed=TRUE))[1])-2)))
}


eg = bitr(name, fromType="SYMBOL", toType="ENTREZID", annoDb="org.Xl.eg.db")

ids <- bitr(name, fromType="SYMBOL", toType="UNIPROT", annoDb="org.Xl.eg.db")




kk <- enrichKEGG(gene=eg[,2],organism="xenopus",pvalueCutoff=0.05,readable=TRUE)
kegg<-summary(kk)

all_kegg_plot_path <-paste(strsplit(arg2,split="\\.")[[1]][1],"/",sep="")
#all_kegg_plot_path <-'F:/ZGA/step_0/ter/ter_fold_0_1_stage_2_3/'

dir.create(all_kegg_plot_path)
setwd(all_kegg_plot_path)
write.csv(kegg,file="kegg.csv")

data_gene_exp <-dt1
data_gene_exp <-data_gene_exp[!duplicated(data_gene_exp[,1]),]
data_gene_exp <-data_gene_exp[!is.na(data_gene_exp[,1]),]
rownames(data_gene_exp)<-data_gene_exp[,1]


data_gene_exp <-data_gene_exp[eg[,"SYMBOL"],]
rownames(data_gene_exp)<-eg[,"ENTREZID"]

data_kegg_enrich <-read.csv("kegg.csv",header = T,stringsAsFactors = F)
kegg_id <-data_kegg_enrich[,"ID"]
kegg_id <-gsub("[a-z]","",kegg_id)
kegg_enrich_gene <-data_kegg_enrich[,"geneID"]
kegg_enrich_gene <-strsplit(kegg_enrich_gene,split="/")
#print("haha")


name_data_gene_exp<-c()
length_row_new<-length(data_gene_exp[,1])
for (i in 1:length_row_new){
name_data_gene_exp<-c(name_data_gene_exp,substring(unlist(strsplit(data_gene_exp[i,1],split='|',fixed=TRUE))[1],1,as.numeric(nchar(unlist(strsplit(data_gene_exp[i,1],split='|',fixed=TRUE))[1])-2)))
}

data_gene_exp<-cbind(name_data_gene_exp,data_gene_exp[,1:length(data_gene_exp[1,])])
for (i in 1:length(kegg_enrich_gene)){
  temp_data<-data_gene_exp[data_gene_exp$name_data_gene_exp%in%kegg_enrich_gene[[i]],]

  #temp_data <-data_gene_exp[kegg_enrich_gene[[i]],]##################
  #temp_data <-temp_data[,c("value1","log2(value2/value1)")]
  #temp_data <-temp_data[,c(2:5)]#############
  #temp_data <-temp_data[,c(2:5)]##############+3
  tmp<-strsplit(arg2,split='/',fixed=TRUE)
  #print(arg2)
  #print(tmp)
  tmp_n<-length(unlist(tmp))
  #print(tmp_n)
  tmp_file<-unlist(strsplit(arg2,split='/',fixed=TRUE))[tmp_n]
  #print(tmp_file,)
  #print('ddd')
  tmp_file<-unlist(strsplit(tmp_file,split='.',fixed=TRUE))[1]
  #print(tmp_file)
  #print('ccc')
  tmp_file_len<-length(unlist(strsplit(tmp_file,split='_',fixed=TRUE)))
  #print(tmp_file_len)
  #print(unlist(strsplit(tmp_file,split='_',fixed=TRUE)))
  #print('bbb')
  #print(as.numeric(unlist(strsplit(tmp_file,split='_',fixed=TRUE))[tmp_file_len]))
  #print('aaa')
  tmp_col1<-as.numeric(unlist(strsplit(tmp_file,split='_',fixed=TRUE))[tmp_file_len])+2
  tmp_col2<-as.numeric(unlist(strsplit(tmp_file,split='_',fixed=TRUE))[tmp_file_len])+3
 # print(tmp_col1)
  #print(tmp_col2)
  #print(temp_data[,tmp_col2])
 # print(temp_data[,tmp_col1])
  temp_data_new <-as.data.frame(as.numeric(temp_data[,tmp_col2])/as.numeric(temp_data[,tmp_col1]))
  rownames(temp_data_new)<-row.names(temp_data)
  #print (temp_data)
  temp_data_new <-as.matrix(temp_data_new)
 x.inv <- try(pathview(gene.data =as.data.frame(temp_data_new), pathway.id =
                          kegg_id[i], species = "xla",limit = list(gene = 2, cpd = 2),bins = list(gene = 20, cpd = 10), out.suffix ="xxx",
                        kegg.native = TRUE), silent=TRUE)
  if ('try-error' %in% class(x.inv)) {next
    }else  pv.out <- x.inv
}




