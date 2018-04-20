#!/usr/bin/python3
# -*- coding: utf-8 -*-

# Imports
########################################

import sys, os
#SciAnalysis_PATH='/home/kyager/current/code/SciAnalysis/main/'
#SciAnalysis_PATH='/home/xf11bm/software/SciAnalysis/'
SciAnalysis_PATH='/Users/tomas/Documents/SciAnalysis'
SciAnalysis_PATH in sys.path or sys.path.append(SciAnalysis_PATH)

import glob
from SciAnalysis import tools
from SciAnalysis.XSAnalysis.Data import *
from SciAnalysis.XSAnalysis import Protocols






# Experimental parameters
########################################

mask_dir = SciAnalysis_PATH + '/SciAnalysis/XSAnalysis/masks/'
detector = 'MAXS'

if detector == 'SAXS':
    # MAXS detector on CMS
    #calibration = Calibration(wavelength_A=0.9184) # 13.5 keV
    calibration = Calibration(wavelength_A=12.398/11) # 13.5 keV
    calibration.set_image_size(1475, height=1679) # Pilatus2M
    calibration.set_pixel_size(pixel_size_um=172.0)
    #calibration.set_beam_position(402.0, 443.0)
    
    #for 5m setup
    calibration.set_beam_position(1475-749, 1100)
    calibration.set_distance(4.22)


    
    mask = Mask(mask_dir+'Pilatus2M_gaps-mask.png')
    #mask = Mask(mask_dir+'Pilatus2M_pipe-mask.png')
    #mask = Mask(mask_dir+'Pilatus2M_beamstop-mask.png')
    
    mask.load(mask_dir+'Pilatus2M_pipe-mask.png')
    #mask.load(mask_dir+'Pilatus2M_beamstop-mask.png')
    
    
    #mask = Mask(mask_dir+'Pilatus2M_generic-mask.png')
    #mask.load('./pilatus2M_current-mask.png')

elif detector == 'MAXS':
    # MAXS detector on CMS
    #calibration = Calibration(wavelength_A=0.9184) # 13.5 keV
    calibration = Calibration(wavelength_A=12.398/11) # 13.5 keV
    calibration.set_image_size(487, height=619) # Pilatus300k
    calibration.set_pixel_size(pixel_size_um=172.0)
    #calibration.set_beam_position(402.0, 443.0)
    
    #for 5m setup
    calibration.set_beam_position(14.5, 619-8.5)
    calibration.set_distance(0.1491)

    mask = Mask(mask_dir+'Pilatus300k_main_gaps-mask.png')

    #mask.load('./Pilatus300k_current-mask.png')
    

else:
    # WAXS detector on CMS
    from SciAnalysis.XSAnalysis.DataRQconv import *
    calibration = CalibrationRQconv(wavelength_A=0.9184) # 13.5 keV
    calibration.set_image_size(1042) # psccd Photonic Sciences CCD
    calibration.set_pixel_size(pixel_size_um=101.7)
    calibration.set_distance(0.232) # Bigger number moves theory rings outwards (larger spacing)
    calibration.set_beam_position(22.0, 1042-22.0)
    calibration.set_angles(det_orient=45, det_tilt=-21, det_phi=0, incident_angle=0., sample_normal=0.)
    print('ratio Dw = {:.3f}'.format(calibration.get_ratioDw()))
    
    mask = Mask(mask_dir+'psccd_generic-mask.png')






# Files to analyze
########################################

#root_dir = '/GPFS/xf11bm/Pilatus300/'
#root_dir = '/GPFS/xf11bm/Pilatus300/2016-3/CFN_aligned-BCP/'


#source_dir = os.path.join(root_dir, '')
source_dir = '../'


#output_dir = os.path.join(source_dir, 'analysis/')
output_dir = './'


pattern = '*'
#pattern = 'AgBH*'
#pattern = '*314963*'

infiles = glob.glob(os.path.join(source_dir, pattern+'.tiff'))
infiles = glob.glob(os.path.join(source_dir, '*.tiff'))
#infiles = glob.glob(os.path.join(source_dir, 'AgBH_3m_cali_openWAXS_shortdistance_th0.000_5.00s_330042_maxs.tiff'))
#infiles = glob.glob(os.path.join(source_dir, 'MAPLE4_NA_th0.220_10.00s_330363_maxs.tiff'))

#infiles = glob.glob(os.path.join(source_dir, 'AdityaMohite-DZA_Cs_A_731.6s_T-273.150C_th0.120_10.00s_33749_waxs.tiff'))

infiles.sort()


# Analysis to perform
########################################

load_args = { 'calibration' : calibration, 
             'mask' : mask,
             }
run_args = { 'verbosity' : 3,
            }

process = Protocols.ProcessorXS(load_args=load_args, run_args=run_args)

# Examples:
#protocols = [ Protocols.calibration_check(show=False, AgBH=True, q0=0.010, num_rings=4) ]
#protocols = [ Protocols.thumbnails(crop=0.8)] # mini
#protocols = [ Protocols.thumbnails(crop=None, resize=1.0, blur=None, file_extension='.png') ] # full-size
#protocols = [ Protocols.thumbnails(crop=None, resize=1.0, blur=None, cmap=cmap_vge, ztrim=[0, 0.001], file_extension='.png') ] # custom
#protocols = [ Protocols.q_image(q_max=0.14, blur=2.0, bins_relative=0.25, xticks=[-.1, 0, .1], ztrim=[0.01, 0.001])]
#protocols = [ Protocols.circular_average(ylog=True, plot_range=[0, 0.2, None, None]) ]
#protocols = [ Protocols.circular_average_q2I(plot_range=[0, 0.2, 0, None]) ]
#protocols = [ circular_average_q2I_fit(plot_range=[0, 0.2, 0, None]) ] # local protocol
#protocols = [ Protocols.linecut_angle(q0=0.01687, dq=0.00455*1.5, show_region=False) ]
#protocols = [ linecut_angle_fit(dq=0.00455*1.5) ]


protocols = [
    #Protocols.calibration_check(show=False, AgBH=True, num_rings=10, ztrim=[0.2, 0.01], dpi=300) ,
    ##Protocols.calibration_check(show=False, AgBH=True, q0=1.369*0.25, dq=0.002, num_rings=10, ztrim=[0.2, 0.01], dpi=300) ,
    Protocols.q_image(blur=1.0, bins_relative=0.5, plot_range=[-0.1, 3.2, 0, 3.2], _xticks=[0, 1.0, 2.0, 3.0], ztrim=[0.2, 0.01]) ,
    ##Protocols.qr_image(blur=1.0, bins_relative=0.5, plot_range=[-0.1, 3.0, 0, 3.0], _xticks=[0, 1.0, 2.0, 3.0], zmin=1010., ztrim=[None, 0.01]) ,
    Protocols.qr_image(blur=None, bins_relative=0.8, plot_range=[-0.1, 3.0, 0, 3.0], _xticks=[0, 1.0, 2.0, 3.0], ztrim=[0.38, 0.002], dezing_fill=True) ,
    ##Protocols.q_phi_image(bins_relative=0.25, plot_range=[0, 3.0, 0, +90]) ,
    Protocols.circular_average(ylog=False, plot_range=[0, 4.0, None, None], dezing=True) ,
    Protocols.linecut_angle(q0=1.02, dq=0.05, show_region=False, plot_range=[-10, 100,  None, None]) ,
    #circular_average_subtract(ylog=False, plot_range=[0, 4.0, 0, 5000], dezing=True) ,    
    Protocols.thumbnails(crop=None, resize=0.5, cmap=cmap_vge_hdr, ztrim=[0.005, 0.01]) ,
    #Protocols.thumbnails(crop=None, resize=0.5, cmap=cmap_vge, _ztrim=[0.06, 0.001], zmin=1000.0, zmax=7000) , # PSCCD
    ]
    



# Run
########################################
process.run(infiles, protocols, output_dir=output_dir, force=False)


# Loop
########################################
import time
donefiles = []
while True:

    infiles = glob.glob(os.path.join(source_dir, '*.tiff'))

    for infile in infiles:
        if infile in donefiles:
            pass

        else:
            process.run([infile], protocols, output_dir=output_dir, force=False)

        donefiles.append(infile)

    time.sleep(4)






