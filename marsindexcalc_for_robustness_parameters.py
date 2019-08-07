import numpy as np
import os
import sys

ntsamples= 240
nsamples= 60
#reps=int(nsamples*0.1)
reps=300
nsgrid = 418
npara = 12
vegtype='7'
gridportion = '5pa'
varname = 'flh'
psDatapreappendix='./psData_after_IO.txt'
psDatapreappendix_tmp='./psData_after_IO_Tmplt'
parasamplesdir = '/home/gongwei/Sharefiles/USA/sampleforsens'
psDatadir='/home/gongwei/Sharefiles/USA/griddistribution/scripts'
psuadeprocessfile='matlabmarsa.m'

pergridobjfile='../Oridata/aibaseobj'+varname+'veg'+vegtype+'_'+gridportion+'_paras_'+str(ntsamples)+'.txt'
outputfile = 'aibase'+varname+'v'+vegtype+gridportion+'s'+str(nsamples)+'p'+str(reps)+'_mars_grid.txt'
valinumberfile = 'valinumber_aibase'+varname+'v'+vegtype+gridportion+'s'+str(nsamples)+'p'+str(reps)+'.txt'

pergridobjdata=np.loadtxt(pergridobjfile)
reformdata=np.zeros((nsgrid,reps,npara))
valinumber = np.zeros(nsgrid)

# A. Generate psData
for i in range(nsgrid):
#for i in range(58,58):
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
    if len(b) > 0:
        print 'nan obj appears in sample '+str(b)
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

#  Parameter Bootstrapping
    np.random.seed(123)
    y=np.arange(valinsamples*reps).reshape(valinsamples,reps)
    x=np.arange(valinsamples)
    for ix in range(valinsamples):
        x[ix]=ix+1

    repx=np.random.choice(x, (reps, valinsamples), replace=True)
#print repx
    for iy in range(reps):
        for jy in range(valinsamples):
            y[jy][iy] = repx[iy][jy]

#  Bootstrapping of parameters in each grid
#  Write values to psDatapre.txt
    for parairep in range(reps):
#    for parairep in range(56,57):
        myfile=open('./psDataobj'+varname+'v'+vegtype+gridportion+'s'+str(valinsamples)+'.txt',"w")
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
                sample_value = eval(valisamplelines[int(y[j][parairep]-1)][k1:k2])
#           print i, j
                print >> myfile, "%24.16e" %(sample_value)

            print >> myfile, "%24.16e" %(valiobjdata[y[j][parairep]-1]) # soil_s
        print >> myfile, "%s" %('PSUADE_IO')
        myfile.writelines(psuadeotherparts_lines)
        myfile.close()


# B. Mars score
        os.system('psuade psDataobj'+varname+'v'+vegtype+gridportion+'s'+str(valinsamples)+'.txt')
        if os.path.exists(psuadeprocessfile):
            marsa_score=np.loadtxt(psuadeprocessfile , delimiter = "," , usecols=(0,) , dtype=str)
            for j in range(npara):
                reformdata[i][valinumber[i]][j]=eval(marsa_score[j])
            os.remove(psuadeprocessfile)
            valinumber[i] = valinumber[i] + 1
            print 'sgrid '+str(i+1)+' parareps '+str(parairep+1)
        else:
            print "Invalid grid" + str(i+1) + ' parareps '+str(parairep+1)
#        os.remove('psDataobj'+varname+'v'+vegtype+gridportion+'s'+str(valinsamples)+'.txt')

#    print i+1
    print 'sgrid '+str(i+1)+' valid number is '+str(valinumber[i])
    valireformdata=reformdata[i,:valinumber[i],:]
    if(i==0):
        np.savetxt(outputfile,valireformdata,fmt="%12.4f %12.4f %12.4f %12.4f %12.4f %12.4f %12.4f %12.4f %12.4f %12.4f %12.4f %12.4f")
    else:
        appendfile=open(outputfile,'a')
        np.savetxt(appendfile,valireformdata,fmt="%12.4f %12.4f %12.4f %12.4f %12.4f %12.4f %12.4f %12.4f %12.4f %12.4f %12.4f %12.4f")
        appendfile.close()

np.savetxt(valinumberfile,valinumber,fmt='%d')
