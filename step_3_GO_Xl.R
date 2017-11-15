#Rscript.exe F:/ZGA/step_3_GO_Xl.R F:/ZGA/step_0/ter/ter_fold_2_3_stage_2_3.txt ter_fold_2_3_stage_2_3.txt
library(clusterProfiler)
args<-commandArgs(T)
setwd('F:/ZGA/step_3/GO')
arg1<-args[2]
arg2<-args[1]
dt1<-read.table(arg2,stringsAsFactors = F,sep='\t')
name<-c()
length_row<-length(dt1[,1])
for (i in 1:length_row){
name<-c(name,substring(unlist(strsplit(dt1[i,1],split='|',fixed=TRUE))[1],1,as.numeric(nchar(unlist(strsplit(dt1[i,1],split='|',fixed=TRUE))[1])-2)))
}

#print (name)
#print (name[!duplicated(name)])
gene<-name[!duplicated(name)]
eg = bitr(name, fromType="SYMBOL", toType="ENTREZID", annoDb="org.Xl.eg.db")

#eg

ggo1 <- groupGO(gene= eg[,2],organism = "xenopus",ont = "CC",level = 3,readable = TRUE)
#summary(ggo1)
#ids <- bitr(name, fromType="SYMBOL", toType="UNIPROT", annoDb="org.Xl.eg.db")


###########


ggo1 <- groupGO(gene= eg[,2],organism = "xenopus",ont = "CC",level = 3,readable = TRUE)
name1=paste('ggo_CC_',unlist(strsplit(arg1,split='.',fixed=TRUE))[1],'.png',sep='')
png(name1)
tryCatch(barplot(ggo1, drop=TRUE, showCategory=12), error = function(e) {""})
dev.off()
name1=paste('ggo1_CC_',unlist(strsplit(arg1,split='.',fixed=TRUE))[1],'.csv',sep='')
write.csv(summary(ggo1),file=name1)

ggo2 <- groupGO(gene= eg[,2],organism = "xenopus",ont = "BP",level = 3,readable = TRUE)
name2=paste('ggo_BP_',unlist(strsplit(arg1,split='.',fixed=TRUE))[1],'.png',sep='')
png(name2)
tryCatch(barplot(ggo2, drop=TRUE, showCategory=12), error = function(e) {""})
dev.off()
name2=paste('ggo2_BP_',unlist(strsplit(arg1,split='.',fixed=TRUE))[1],'.csv',sep='')
write.csv(summary(ggo2),file=name2)

ggo3 <- groupGO(gene= eg[,2],organism = "xenopus",ont = "MF",level = 3,readable = TRUE)
name3=paste('ggo_MF_',unlist(strsplit(arg1,split='.',fixed=TRUE))[1],'.png',sep='')
png(name3)
tryCatch(barplot(ggo3, drop=TRUE, showCategory=12), error = function(e) {""})
dev.off()
name3=paste('ggo3_MF_',unlist(strsplit(arg1,split='.',fixed=TRUE))[1],'.csv',sep='')
write.csv(summary(ggo3),file=name3)


#######################################################



ego <- enrichGO(gene= eg[,2],
organism = "xenopus",
ont = "CC", 
pvalueCutoff  = 0.05)
name1=paste('ego1_CC_',unlist(strsplit(arg1,split='.',fixed=TRUE))[1],'.png',sep='')
png(name1)
tryCatch(barplot(ego, showCategory=8), error = function(e) {    ""   })
dev.off()
name2=paste('ego2_CC_',unlist(strsplit(arg1,split='.',fixed=TRUE))[1],'.png',sep='')
png(name2)
tryCatch(dotplot(ego), error = function(e) {    ""   })
dev.off()
name3=paste('ego3_CC_',unlist(strsplit(arg1,split='.',fixed=TRUE))[1],'.png',sep='')
png(name3)
tryCatch(enrichMap(ego), error = function(e) {    ""   })
dev.off()
name1=paste('ego1_CC_',unlist(strsplit(arg1,split='.',fixed=TRUE))[1],'.csv',sep='')
write.csv(summary(ego),file=name1)




ego2 <- enrichGO(gene= eg[,2],organism = "xenopus",ont = "MF", pvalueCutoff  = 0.05)
name1=paste('ego1_MF_',unlist(strsplit(arg1,split='.',fixed=TRUE))[1],'.png',sep='')
png(name1)
tryCatch(barplot(ego2, showCategory=8), error = function(e) {    ""   })
dev.off()
name2=paste('ego2_MF_',unlist(strsplit(arg1,split='.',fixed=TRUE))[1],'.png',sep='')
png(name2)
tryCatch(dotplot(ego2), error = function(e) {    ""   })
dev.off()
name3=paste('ego3_MF_',unlist(strsplit(arg1,split='.',fixed=TRUE))[1],'.png',sep='')
png(name3)
tryCatch(enrichMap(ego2), error = function(e) {    ""   })
dev.off()
name2=paste('ego2_MF_',unlist(strsplit(arg1,split='.',fixed=TRUE))[1],'.csv',sep='')
write.csv(summary(ego2),file=name2)




ego3 <- enrichGO(gene= eg[,2],organism = "xenopus",ont = "BP", pvalueCutoff  = 0.05)
name1=paste('ego1_BP_',unlist(strsplit(arg1,split='.',fixed=TRUE))[1],'.png',sep='')
png(name1)
tryCatch(barplot(ego3, showCategory=8), error = function(e) {    ""   })
dev.off()
name2=paste('ego2_BP_',unlist(strsplit(arg1,split='.',fixed=TRUE))[1],'.png',sep='')
png(name2)
tryCatch(dotplot(ego3), error = function(e) {    ""   })
dev.off()
name3=paste('ego3_BP_',unlist(strsplit(arg1,split='.',fixed=TRUE))[1],'.png',sep='')
png(name3)
tryCatch(enrichMap(ego3), error = function(e) {    ""   })
dev.off()
name3=paste('ego3_BP_',unlist(strsplit(arg1,split='.',fixed=TRUE))[1],'.csv',sep='')
write.csv(summary(ego3),file=name3)
