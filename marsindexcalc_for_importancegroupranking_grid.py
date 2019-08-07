import numpy as np
import os
import sys

ntsamples= 300
nsamples=60
#reps=int(nsamples*0.1)
nsgrid = 1659
npara = 12
vegtype='7'
gridportion = '20'
varname = 'gpp'
psDatapreappendix='./psData_after_IO.txt'
psDatapreappendix_tmp='./psData_after_IO_Tmplt'
parasamplesdir = '/home/gongwei/Sharefiles/USA/sampleforsens'
psDatadir='/home/gongwei/Sharefiles/USA/griddistribution/scripts'
psuadeprocessfile='matlabmarsa.m'

pergridobjfile='../Oridata/obj'+varname+'veg'+vegtype+'_'+gridportion+'pa_paras_'+str(ntsamples)+'.txt'
outputfile = varname+'v'+vegtype+'pa'+gridportion+'s'+str(nsamples)+'_mars_grid.txt'

pergridobjdata=np.loadtxt(pergridobjfile)
reformdata=np.zeros((nsgrid,npara))

# A. Generate psData
for i in range(nsgrid):
#for i in range(29,30):
    #Read Original Sample values.
    os.chdir(parasamplesdir)
    sample_file=open('parasamples'+str(nsamples)+'.txt','r')
    sample_lines=sample_file.readlines()
    sample_file.close()
    #Delete invalid samples
    b=[]
    valisamplelines=[]
    for ni in range(nsamples):
        if(str(pergridobjdata[i][ni])=='nan'):
            b.append(ni)
        else:
            valisamplelines.append(sample_lines[ni])
    print b
    valiobjdata=np.delete(pergridobjdata[i],b)

    # Sensitivity analysis based on valid samples
    valinsamples=len(valisamplelines)
    os.chdir(psDatadir)
    syscomm1='sed \'s/repsamples/'+str(valinsamples)+'/g\' '+psDatapreappendix_tmp+'> '+psDatapreappendix
    os.system(syscomm1)

#  Read in affiliated parts after PSUADE_IO
    psuadeotherparts=open(psDatapreappendix,'r')
    psuadeotherparts_lines=psuadeotherparts.readlines()
    psuadeotherparts.close()

#  Write values to psDatapre.txt
    myfile=open('./psDataobj'+varname+'v'+vegtype+'pa'+gridportion+'s'+str(valinsamples)+'.txt',"w")
    print >> myfile, "%s" %('PSUADE_IO (Note : inputs not true inputs if pdf ~=U)')
    if valinsamples < 1000:
        print >> myfile, "%2d %1d %3d" %(npara,1,valinsamples)
    else:
        print >> myfile, "%2d %1d %4d" %(npara,1,valinsamples)

    for j in range(valinsamples):
        if j < 9:
            print >> myfile, "%1d %1d" %(j+1,1)
        elif j < 99:
                print >> myfile, "%2d %1d" %(j+1,1)
        elif j < 999:
            print >> myfile, "%3d %1d" %(j+1,1)
        else:
            print >> myfile, "%4d %1d" %(j+1,1)
        for k in range(npara):
            k1 = k*12
            k2 = (k+1)*12
            sample_value = eval(valisamplelines[j][k1:k2])
#           print i, j
            print >> myfile, "%24.16e" %(sample_value)

        print >> myfile, "%24.16e" %(valiobjdata[j]) # soil_s
    print >> myfile, "%s" %('PSUADE_IO')
    myfile.writelines(psuadeotherparts_lines)
    myfile.close()


# B. Mars score
    os.system('psuade psDataobj'+varname+'v'+vegtype+'pa'+gridportion+'s'+str(valinsamples)+'.txt')
    marsa_score=np.loadtxt(psuadeprocessfile , delimiter = "," , usecols=(0,) , dtype=str)
    os.remove('psDataobj'+varname+'v'+vegtype+'pa'+gridportion+'s'+str(valinsamples)+'.txt')
    for j in range(npara):
        reformdata[i][j]=eval(marsa_score[j])

    print i+1
np.savetxt(outputfile,reformdata,fmt="%12.4f %12.4f %12.4f %12.4f %12.4f %12.4f %12.4f %12.4f %12.4f %12.4f %12.4f %12.4f")
