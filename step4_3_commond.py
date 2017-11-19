#python /media/laifangnong/SE/ZGA/step4_3_commond.py /media/laifangnong/SE/ZGA/step_4/ter
#python /media/laifangnong/SE/ZGA/step4_3_commond.py /media/laifangnong/SE/ZGA/step_4/ueno
import sys,os
inputdir=sys.argv[1]
sh=open('/'.join(sys.argv[1].split('/')[0:-1])+'/extract_fasta_commond.sh','w')
input_dir=os.listdir(inputdir)
range_input_dir=range(len(input_dir))
for i in range_input_dir:
	#sh.write('python  /media/laifangnong/SE/ZGA/xl_genome/quary_fasta.py '+inputdir+'/'+input_dir[i]+' /media/laifangnong/SE/ZGA/xl_genome/GCF_001663975.1_Xenopus_laevis_v2_genomic.gff /media/laifangnong/SE/ZGA/xl_genome/GCF_001663975.1_Xenopus_laevis_v2_genomic.fna 500'+'\n')
	#sh.write('python  /media/laifangnong/SE/ZGA/xl_genome/quary_fasta.py '+inputdir+'/'+input_dir[i]+' /media/laifangnong/SE/ZGA/xl_genome/GCF_001663975.1_Xenopus_laevis_v2_genomic.gff /media/laifangnong/SE/ZGA/xl_genome/GCF_001663975.1_Xenopus_laevis_v2_genomic.fna 1000'+'\n')
	#sh.write('python  /media/laifangnong/SE/ZGA/xl_genome/quary_fasta.py '+inputdir+'/'+input_dir[i]+' /media/laifangnong/SE/ZGA/xl_genome/GCF_001663975.1_Xenopus_laevis_v2_genomic.gff /media/laifangnong/SE/ZGA/xl_genome/GCF_001663975.1_Xenopus_laevis_v2_genomic.fna 2000'+'\n')
	#sh.write('python  /media/laifangnong/SE/ZGA/xl_genome/quary_fasta.py '+inputdir+'/'+input_dir[i]+' /media/laifangnong/SE/ZGA/xl_genome/GCF_001663975.1_Xenopus_laevis_v2_genomic.gff /media/laifangnong/SE/ZGA/xl_genome/GCF_001663975.1_Xenopus_laevis_v2_genomic.fna 5000'+'\n')
	#sh.write('python  /media/laifangnong/SE/ZGA/xl_genome/quary_fasta.py '+inputdir+'/'+input_dir[i]+' /media/laifangnong/SE/ZGA/xl_genome/GCF_001663975.1_Xenopus_laevis_v2_genomic.gff /media/laifangnong/SE/ZGA/xl_genome/GCF_001663975.1_Xenopus_laevis_v2_genomic.fna 10000'+'\n')
	sh.write('python  /media/laifangnong/SE/ZGA/xl_genome/quary_fasta.py '+inputdir+'/'+input_dir[i]+' /media/laifangnong/SE/ZGA/xs_genome/GCF_000004195.3_Xenopus_tropicalis_v9.1_genomic.gff /media/laifangnong/SE/ZGA/xs_genome/GCF_000004195.3_Xenopus_tropicalis_v9.1_genomic.fna 500'+'\n')
	sh.write('python  /media/laifangnong/SE/ZGA/xl_genome/quary_fasta.py '+inputdir+'/'+input_dir[i]+' /media/laifangnong/SE/ZGA/xs_genome/GCF_000004195.3_Xenopus_tropicalis_v9.1_genomic.gff /media/laifangnong/SE/ZGA/xs_genome/GCF_000004195.3_Xenopus_tropicalis_v9.1_genomic.fna 1000'+'\n')
	sh.write('python  /media/laifangnong/SE/ZGA/xl_genome/quary_fasta.py '+inputdir+'/'+input_dir[i]+' /media/laifangnong/SE/ZGA/xs_genome/GCF_000004195.3_Xenopus_tropicalis_v9.1_genomic.gff /media/laifangnong/SE/ZGA/xs_genome/GCF_000004195.3_Xenopus_tropicalis_v9.1_genomic.fna 2000'+'\n')
	sh.write('python  /media/laifangnong/SE/ZGA/xl_genome/quary_fasta.py '+inputdir+'/'+input_dir[i]+' /media/laifangnong/SE/ZGA/xs_genome/GCF_000004195.3_Xenopus_tropicalis_v9.1_genomic.gff /media/laifangnong/SE/ZGA/xs_genome/GCF_000004195.3_Xenopus_tropicalis_v9.1_genomic.fna 5000'+'\n')
	sh.write('python  /media/laifangnong/SE/ZGA/xl_genome/quary_fasta.py '+inputdir+'/'+input_dir[i]+' /media/laifangnong/SE/ZGA/xs_genome/GCF_000004195.3_Xenopus_tropicalis_v9.1_genomic.gff /media/laifangnong/SE/ZGA/xs_genome/GCF_000004195.3_Xenopus_tropicalis_v9.1_genomic.fna 10000'+'\n')
