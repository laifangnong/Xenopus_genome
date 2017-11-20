#python G:/ZGA/step5_reorder.py G:/ZGA/step_4/Xl/ter
import sys,os
topdir=sys.argv[1]
def move_null_seq(fasta_file):
	tmp_file=open(fasta_file,'r')
	outputfile=open(fasta_file.split('.')[0]+'_rm.fa','w')
	len_tmp_line=0
	tmp_line=''
	tmp_numb=0
	for i in tmp_file.readlines():
		if i.startswith('>'):
			if not len_tmp_line==0:
				outputfile.write(i.strip()+'\n')
				for j in tmp_line:
					tmp_numb+=1
					if not tmp_numb==60:
						outputfile.write(j)
					else:
						outputfile.write('\n')
						tmp_numb=0
				outputfile.write('\n')
			else:
				continue				
			len_tmp_line=0
			tmp_line=''
			tmp_numb=0
		else:
			len_tmp_line+=1
			tmp_line+=i.strip()
	tmp_file.close()
	
	


def move2root(rootdir):
	root_dir=os.listdir(rootdir)
	range_root_dir=range(len(root_dir))
	for i in range_root_dir:
		tmp_path=rootdir+'/'+root_dir[i]
		if os.path.isdir(tmp_path):
			move2root(tmp_path)
		elif os.path.isfile(tmp_path):
			if tmp_path.endswith('.fa'):
				tmp_file=topdir+'/'+tmp_path.split('/')[-2]+'.fa'
				tmp_file=tmp_file.replace('/','\\')
				#cmd='copy '+tmp_path.replace('/','\\')+' '+topdir.replace('/','\\')
				cmd='copy '+tmp_path.replace('/','\\')+' '+tmp_file
				print cmd
				os.system(cmd)
				#tmp_file=topdir+'/'+tmp_path.split('/')[-1]
				move_null_seq(tmp_file)

if __name__=='__main__':
	move2root(topdir)
			
