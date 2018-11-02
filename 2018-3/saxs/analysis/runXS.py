#!/usr/bin/python3
# -*- coding: utf-8 -*-

# Imports
########################################

import sys, os
# Update this to point to the directory where you copied the SciAnalysis base code
#SciAnalysis_PATH='/home/kyager/current/code/SciAnalysis/main/'
SciAnalysis_PATH='/home/xf11bm/software/SciAnalysis2018C1/'
SciAnalysis_PATH in sys.path or sys.path.append(SciAnalysis_PATH)

import glob
from SciAnalysis import tools
from SciAnalysis.XSAnalysis.Data import *
from SciAnalysis.XSAnalysis import Protocols





# Experimental parameters
# For pilatus2M
########################################


mask_dir = SciAnalysis_PATH + '/SciAnalysis/XSAnalysis/masks/'

if True:
    # SAXS detector on CMS
    #calibration = Calibration(wavelength_A=0.9184) # 13.5 keV
    calibration = Calibration(wavelength_A=12.398/11) # 13.5 keV
    calibration.set_image_size(1475, height=1679) # Pilatus2M
    calibration.set_pixel_size(pixel_size_um=172.0)
    #calibration.set_beam_position(402.0, 443.0)
    
    #for 5m setup
    calibration.set_beam_position(733, 1679-583)
    calibration.set_distance(3.81)


    
    mask = Mask(mask_dir+'Pilatus2M_gaps-mask.png')
    #mask = Mask(mask_dir+'Pilatus2M_pipe-mask.png')
    #mask = Mask(mask_dir+'Pilatus2M_beamstop-mask.png')
    
    mask.load(mask_dir+'Pilatus2M_unblocked_area-mask.png')
    #mask.load(mask_dir+'Pilatus2M_beamstop-mask.png')
    
    
    #mask = Mask(mask_dir+'Pilatus2M_generic-mask.png')
    #mask.load('./pilatus2M_current-mask.png')
    

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

infiles = glob.glob(os.path.join(source_dir, '*.tiff'))
#infiles = glob.glob(os.path.join(source_dir, 'BY_170718LS_0deg_x0.700_y0.000_1.00s_180786_saxs.tiff'))
#infiles = glob.glob(os.path.join(source_dir, 'AgBH_5m_th0.000_10.00s_20323_saxs.tiff'))

infiles.sort()


# Analysis to perform
########################################

load_args = { 'calibration' : calibration, 
             'mask' : mask,
             #'rot180' : True,
             }
run_args = { 'verbosity' : 3,
            }

process = Protocols.ProcessorXS(load_args=load_args, run_args=run_args)



protocols = [
    #Protocols.calibration_check(show=False, AgBH=True, q0=0.010, num_rings=4, ztrim=[0.05, 0.01], ) ,
    #Protocols.circular_average(ylog=True, plot_range=[0, 0.18, None, None]) ,
    #Protocols.sector_average(angle=0, dangle=20, ylog=True, plot_range=[0, 0.3, None, None], show_region=True) ,
    Protocols.linecut_qr(qz=0.03, dq=0.01, show_region=False) ,
    #Protocols.q_image(blur=1.0, bins_relative=0.5, plot_range=[-0.1, 3.0, 0, 3.0], _xticks=[0, 1.0, 2.0, 3.0], ztrim=[0.2, 0.01]) , #for WAXS
    Protocols.q_image(blur=1.0, bins_relative=0.5, plot_range=[-0.05, 0.05, 0, 0.15], _xticks=[0, 1.0, 2.0, 3.0], ztrim=[0.2, 0.01]) ,
    #Protocols.qr_image(blur=None, bins_relative=0.8, plot_range=[-0.1, 3.0, 0, 3.0], _xticks=[0, 1.0, 2.0, 3.0], ztrim=[0.38, 0.002], dezing_fill=True) ,
    #Protocols.q_phi_image(bins_relative=0.25, plot_range=[0, 3.0, 0, +90]) ,
    Protocols.thumbnails(crop=None, resize=1.0, blur=None, cmap=cmap_vge_hdr, ztrim=[0.001, 0.0001]) , # For SAXS
    #Protocols.thumbnails(crop=None, resize=1.0, blur=None, cmap=cmap_vge, ztrim=[0.0, 0.0001], zmin=1010) , # For WAXS
    ]
    



# Run
########################################
process.run(infiles, protocols, output_dir=output_dir, force=False)


# Loop
########################################
# This code is typically only used at the beamline (it loops forever, watching for new files).
import time
donefiles = []
while True:

    infiles = glob.glob(os.path.join(source_dir, '*.tiff'))
    #infiles = glob.glob(os.path.join(source_dir, 'Mix22*.tiff'))

    for infile in infiles:
        if infile in donefiles:
            pass

        else:
            process.run([infile], protocols, output_dir=output_dir, force=False)

        donefiles.append(infile)

    time.sleep(4)






