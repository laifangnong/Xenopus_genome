#python quary_fasta.py gene_symbol_dir gtffile fasta_file scale
#python /media/laifangnong/SE/ZGA/xl_genome/quary_fasta.py /media/laifangnong/SE/ZGA/step_0/ter /media/laifangnong/SE/ZGA/xl_genome/GCF_001663975.1_Xenopus_laevis_v2_genomic.gff /media/laifangnong/SE/ZGA/xl_genome/GCF_001663975.1_Xenopus_laevis_v2_genomic.fna 500
#python /media/laifangnong/SE/ZGA/xl_genome/quary_fasta.py /media/laifangnong/SE/ZGA/step_0/test /media/laifangnong/SE/ZGA/xl_genome/GCF_001663975.1_Xenopus_laevis_v2_genomic.gff /media/laifangnong/SE/ZGA/xl_genome/GCF_001663975.1_Xenopus_laevis_v2_genomic.fna 500
import sys,os
import sys,os
from Bio.Seq import Seq
#scale=sys.argv[4]
def quary_fasta(gene_symbol_dir,gtffile):
	gtf_file=open(gtffile,'r')
	#sub_gtf=open('sub_gtf.gtf','w')
	sub_gtf_dir={}
	for i in gtf_file.readlines():
		#print i
		if i.startswith('#'):
			pass
		else:
			try:
				if i.split('\t')[2]=='gene':
					#sub_gtf.write(i)
					sub_gtf_dir[i.split('\t')[-1].split(';')[2].split('=')[1]]=[i.split('\t')[0],i.split('\t')[3],i.split('\t')[4],i.split('\t')[6]]#chr start stop +/- 
			except:
					continue
	#print sub_gtf_dir
	#sub_gtf.close()

	in_gtf={}
	symbol_dir=os.listdir(gene_symbol_dir)
	range_symbol_dir=range(len(symbol_dir))
	for i in range_symbol_dir:
		tmp_file=open(gene_symbol_dir+'/'+symbol_dir[i],'r')
		#tmp_new_file=open(gene_symbol_dir+'/'+symbol_dir[i].split('.')[0]+'_in_gtf.txt','w')#op
		for j in tmp_file:
			#print j.split('\t')[0].split('|')[0][:-2] 
			if j.split('\t')[0].split('|')[0][:-2] in sub_gtf_dir.keys():
				#print sub_gtf_dir[j.split('\t')[0].split('|')[0][:-2]]
				#print sub_gtf_dir[j.split('\t')[0].split('|')[0][:-2]].append(symbol_dir[i])
				#t=sub_gtf_dir[j.split('\t')[0].split('|')[0][:-2]].append(symbol_dir[i])
				in_gtf[j.split('\t')[0].split('|')[0][:-2]]=sub_gtf_dir[j.split('\t')[0].split('|')[0][:-2]]#.append(symbol_dir[i])
				
	#print in_gtf
	return in_gtf

def extract_fasta(gtf_list,fasta_file,scale):
	#print gtf_list
	tmp_fasta_dir='/'.join(fasta_file.split('/')[0:-1])+'/tmp_fasta'
	if not os.path.exists(tmp_fasta_dir):
		os.makedirs(tmp_fasta_dir)
	else:
		pass
	print '/'.join(fasta_file.split('/')[0:-1])+'/samtools_commond.sh'
	cmd_file=open('/'.join(fasta_file.split('/')[0:-1])+'/samtools_commond.sh','w')
	for i in gtf_list:
		#print i
		#print gtf_list[i][3]
		#print ('samtools faidx '+str(fasta_file)+' '+i+':'+str(int(gtf_list[i][1])-int(scale))+'-'+str(gtf_list[i][1])+'>'+str(tmp_fasta_dir)+'sense_'+i+'_'+str(gtf_list[i][1])+'_'+str(int(gtf_list[i][1])-int(scale))+'_'+str(gtf_list[i][1])+'.fa'+'\n')
		try:
			if gtf_list[i][3]=='+':

				cmd_file.write('samtools faidx '+str(fasta_file)+' '+str(gtf_list[i][0])+':'+str(int(gtf_list[i][1])-int(scale))+'-'+str(gtf_list[i][1])+' > '+str(tmp_fasta_dir)+'/sense_'+i+'_'+'_'+str(int(gtf_list[i][1])-int(scale))+'_'+str(gtf_list[i][1])+'.fa'+'\n')
				#samtools faidx /media/laifangnong/SE/ZGA/xl_genome/GCF_001663975.1_Xenopus_laevis_v2_genomic.fna NC_030724.1:10000-20000 >  /media/laifangnong/SE/ZGA/xl_genome/chr1.fa
			elif gtf_list[i][3]=='-':
				cmd_file.write('samtools faidx '+str(fasta_file)+' '+str(gtf_list[i][0])+':'+str(gtf_list[i][2])+'-'+str(int(gtf_list[i][2])+int(scale))+' > '+str(tmp_fasta_dir)+'/antisense_'+i+'_'+'_'+str(gtf_list[i][2])+'-'+str(int(gtf_list[i][2])+int(scale))+'.fa'+'\n')
		except:
			continue		
	os.system('sh '+'/'.join(fasta_file.split('/')[0:-1])+'/samtools_commond.sh')



def rc_anti_sense(fastadir):
	fasta_dir=os.listdir(fastadir)
	range_fasta_dir=range(len(fasta_dir))
	tmp_outputdir='/'.join(fastadir.split('/')[0:-1])+'/tmp_fasta_rc_anti'
	if not os.path.exists(tmp_outputdir):
		os.makedirs(tmp_outputdir)
	else:
		pass
	for i in range_fasta_dir:
		if fasta_dir[i].startswith('antisense'):
			tmp_file=open(fastadir+'/'+fasta_dir[i],'r')
			rc_tmp_file=open(tmp_outputdir+'/rc_'+fasta_dir[i],'w')
			head=''
			sequence=''
			for j in tmp_file.readlines():
				if j.startswith('>'):
					head=j
				else:
					sequence=sequence+j
			my_seq=Seq(sequence)
			seq_rc=str(my_seq.reverse_complement())
			seq_rc=seq_rc+'\n'
			rc_tmp_file.write(head.strip())
			rc_tmp_file.write(seq_rc)
		else:
			cmd='cp '+fastadir+'/'+fasta_dir[i]+' '+tmp_outputdir+'/'+fasta_dir[i]
			os.system(cmd)

#rc_dir
def merge_fasta(fastadir):
	fasta_dir=os.listdir(fastadir)
	range_fasta_dir=range(len(fasta_dir))
	#outputdir='/'.join(fastadir.split('/')[0:-1])+'/merge_fa_'+sys.argv[4]
	#/media/laifangnong/SE/ZGA/step_4/input/ter/ter_fold_0_1_stage_2_3
	outputdir=sys.argv[1]+'_fasta_'+sys.argv[4]

	if not os.path.exists(outputdir):
		os.makedirs(outputdir)
	else:
		pass
	outputfile=open(outputdir+'/merge_'+sys.argv[4]+'.fa','w')
	for i in range_fasta_dir:
		tmp_file=open(fastadir+'/'+fasta_dir[i],'r')
		outputfile.write('>'+fasta_dir[i]+'\n')
		for j in tmp_file:
			if j.startswith('>'):
				continue
			else:
				outputfile.write(j)
		#outputfile.write('\n')




#python quary_fasta.py gene_symbol_dir gtffile fasta_file scale
gtf_list=quary_fasta(sys.argv[1],sys.argv[2])
extract_fasta(gtf_list,sys.argv[3],sys.argv[4])
fastadir='/'.join(sys.argv[3].split('/')[0:-1])+'/tmp_fasta'
rc_anti_sense(fastadir)
rc_fastadir='/'.join(sys.argv[3].split('/')[0:-1])+'/tmp_fasta_rc_anti'
merge_fasta(rc_fastadir)
os.system('rm -r '+fastadir)
os.system('rm -r '+rc_fastadir)