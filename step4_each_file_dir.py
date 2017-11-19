#python /media/laifangnong/SE/ZGA/xl_genome/each_file_dir.py /media/laifangnong/SE/ZGA/step_0/ter
#python /media/laifangnong/SE/ZGA/xl_genome/each_file_dir.py /media/laifangnong/SE/ZGA/step_0/ueno
import sys,os
import sys,os
def each_file_in_each_dir(inputdir):
	input_dir=os.listdir(inputdir)
	range_input_dir=range(len(input_dir))
	for i in range_input_dir:
		inputfile=inputdir+'/'+input_dir[i]
		new_dir=inputdir+'/'+input_dir[i].split('.')[0]+''
		if not os.path.exists(new_dir):
			os.makedirs(new_dir)
		else:
			pass
		cmd='cp '+inputfile+' '+new_dir+'/'+input_dir[i]
		os.system(cmd)
each_file_in_each_dir(sys.argv[1])