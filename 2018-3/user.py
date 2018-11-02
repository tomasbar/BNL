#!/usr/bin/python
# -*- coding: utf-8 -*-
# vi: ts=4 sw=4




################################################################################
#  Short-term settings (specific to a particular user/experiment) can
# be placed in this file. You may instead wish to make a copy of this file in
# the user's data directory, and use that as a working copy.
################################################################################


#logbooks_default = ['User Experiments']
#tags_default = ['CFN Soft-Bio']

import pickle

from ophyd import EpicsSignal
from bluesky.suspenders import SuspendFloor

beam_current = EpicsSignal('SR:OPS-BI{DCCT:1}I:Real-I')
sus = SuspendFloor(beam_current, 100, resume_thresh=101)
RE.install_suspender(sus)
#RE.clear_suspenders()

if False:
    # The following shortcuts can be used for unit conversions. For instance,
    # for a motor operating in 'mm' units, one could instead do:
    #     sam.xr( 10*um )
    # To move it by 10 micrometers. HOWEVER, one must be careful if using
    # these conversion parameters, since they make implicit assumptions.
    # For instance, they assume linear axes are all using 'mm' units. Conversely,
    # you will not receive an error if you try to use 'um' for a rotation axis!
    m = 1e3
    cm = 10.0
    mm = 1.0
    um = 1e-3
    nm = 1e-6
    
    inch = 25.4
    pixel = 0.172 # Pilatus
    
    deg = 1.0
    rad = np.degrees(1.0)
    mrad = np.degrees(1e-3)
    urad = np.degrees(1e-6)
    
    


def get_default_stage():
    return stg


class SampleTSAXS(SampleTSAXS_Generic):
    
    def __init__(self, name, base=None, **md):
        super().__init__(name=name, base=base, **md)
        self.naming_scheme = ['name', 'extra', 'exposure_time']


class SampleGISAXS(SampleGISAXS_Generic):
    
    def __init__(self, name, base=None, **md):
        super().__init__(name=name, base=base, **md)
        self.naming_scheme = ['name', 'extra', 'th', 'exposure_time']
        self.naming_scheme = ['name', 'extra', 'clock', 'temperature', 'exposure_time']


#class Sample(SampleTSAXS):
class Sample(SampleGISAXS):

    def __init__(self, name, base=None, **md):
       
       super().__init__(name=name, base=base, **md)
       
       #self.detector='SAXS'
       
       #self.naming_scheme = ['name', 'extra', 'clock', 'temperature', 'th', 'exposure_time']
       #self.naming_scheme = ['name', 'extra', 'th', 'exposure_time']
       self.naming_scheme = ['name', 'extra', 'th', 'exposure_time']
       #self.naming_scheme = ['name', 'extra', 'y', 'th', 'clock', 'exposure_time']
       #self.naming_scheme = ['name', 'extra', 'th', 'exposure_time']
       #self.naming_scheme = ['name', 'extra', 'clock', 'temperature', 'exposure_time']

       
       self.md['exposure_time'] = 10
       
       #self.incident_angles_default = [0.08, 0.10, 0.12, 0.15, 0.20]
       #self.incident_angles_default = [0.08, 0.10, 0.12, 0.14, 0.16, 0.18, 0.20]
       #self.incident_angles_default = [0.05, 0.08, 0.10, 0.12, 0.15]
       #self.incident_angles_default = [0.02, 0.04, 0.05, 0.06, 0.08, 0.09, 0.1, 0.12, 0.15]
       #self.incident_angles_default = [0.02, 0.04, 0.06, 0.08, 0.1, 0.12, 0.15]
       #self.incident_angles_default = [0.0]
       self.incident_angles_default = [0.09, 0.11, 0.13, 0.15, 0.18,0.2, 0.22, 0.25]   #for 11kev

       self.x_pos_default = [-1, 0, 1]


    def _set_axes_definitions(self):
        '''Internal function which defines the axes for this stage. This is kept
        as a separate function so that it can be over-ridden easily.'''
        super()._set_axes_definitions()
        
        self._axes_definitions.append( {'name': 'phi',
                            'motor': srot,
                            'enabled': True,
                            'scaling': +1.0,
                            'units': 'deg',
                            'hint': None,
                            } )
        self._axes_definitions.append( {'name': 'trans2',
                            'motor': strans2,
                            'enabled': True,
                            'scaling': +1.0,
                            'units': 'deg',
                            'hint': None,
                            } )
        
    def _measureTimeSeries(self, exposure_time=None, num_frames=10, wait_time=None, extra=None, measure_type='measureTimeSeries', verbosity=3, **md):
        
        self.naming_scheme_hold = self.naming_scheme
        self.naming_scheme = ['name', 'extra', 'clock', 'exposure_time']
        super().measureTimeSeries(exposure_time=exposure_time, num_frames=num_frames, wait_time=wait_time, extra=extra, measure_type=measure_type, verbosity=verbosity, **md)
        self.naming_scheme = self.naming_scheme_hold
    
    def goto(self, label, verbosity=3, **additional):
        super().goto(label, verbosity=verbosity, **additional)
        # You can add customized 'goto' behavior here
        
    def scan_SAXSdet(self, exposure_time=None) :
        SAXS_pos=[-73, 0, 73]
        #SAXSx_pos=[-65, 0, 65]
        
        RE.md['stitchback'] = True
                
        for SAXSx_pos in SAXS_pos:
            for SAXSy_pos in SAXS_pos:
                mov(SAXSx, SAXSx_pos)
                mov(SAXSy, SAXSy_pos)
                self.measure(10)
                


    #def do(self, step=0, align_step=0, **md):
        
        #if step<=1:
            #get_beamline().modeAlignment()
            
        #if step<=2:
            #self.xo() # goto origin


        #if step<=4:
            #self.yo()
            #self.tho()
        
        #if step<=5:
            #self.align(step=align_step, reflection_angle=0.12)
            ##self.setOrigin(['y','th']) # This is done within align

        ##if step<=7:
            ##self.xr(0.2)

        #if step<=8:
            #get_beamline().modeMeasurement()
        
        #if step<=10:

            ##check the detector_opt and change to the correct detector
            ##detselect(psccd)
            ##DETx.move(4)
            ##WAXSx.move(-14.9)
            #saxs_on()
            #for detector in get_beamline().detector:
                #detector.setExposureTime(self.md['exposure_time'])
            #self.measureIncidentAngles(self.incident_angles_default, **md)


            #self.thabs(0.0)
            
    def do(self, step=0, align_step=0, **md):
        
        if step<=1:
            get_beamline().modeAlignment()
            saxs_on()
            
        if step<=2:
            self.xo() # goto origin


        if step<=4:
            self.yo()
            self.tho()
        
        if step<=5:
            self.align(step=align_step)
            #self.setOrigin(['y','th']) # This is done within align

        #if step<=7:
            #self.xr(0.2)

        if step<=8:
            get_beamline().modeMeasurement()
        
        if step<=10:

            #check the detector_opt and change to the correct detector
            saxs_on()
            #for detector in get_beamline().detector:
                #detector.setExposureTime(self.md['exposure_time'])
            #self.measureIncidentAngles(self.incident_angles_default, **md)
            self.measureIncidentAngles(self.incident_angles_default, exposure_time=10)
            self.thabs(0.0)   
            
            #maxs_on()
            #for detector in get_beamline().detector:
                #detector.setExposureTime(self.md['exposure_time'])
            #self.measureIncidentAngles(self.incident_angles_default, **md)
            #self.thabs(0.0)           
        
        
        
    def IC_int(self):
        
        ion_chamber_readout1=caget('XF:11BMB-BI{IM:3}:IC1_MON')
        ion_chamber_readout2=caget('XF:11BMB-BI{IM:3}:IC2_MON')
        ion_chamber_readout3=caget('XF:11BMB-BI{IM:3}:IC3_MON')
        ion_chamber_readout4=caget('XF:11BMB-BI{IM:3}:IC4_MON')
        
        ion_chamber_readout=ion_chamber_readout1+ion_chamber_readout2+ion_chamber_readout3+ion_chamber_readout4
        
        return ion_chamber_readout>1*5e-08




class CapillaryHolderCustom_openWAXS(CapillaryHolder):
    
    def __init__(self, name='CapillaryHolder', base=None, **kwargs):
        
        super().__init__(name=name, base=base, **kwargs)
        
        self._positional_axis = 'x'
        
        self._axes['x'].origin = -3.81
        self._axes['y'].origin = 6.9
        self.x_spacing = 6.342 # 3.5 inches / 14 spaces
        
        # slot  1; smx = +
        # slot  8; smx = -4.1, smy = 4.1
        # slot 15; smx = -61.94
        # edge left: smx = -58.9
        # edge bottom: smy = -17.3
                
        # Set the x and y origin to be the cente                                                                                 

        #self.xsetOrigin(-16.7)
        #self.ysetOrigin(4.1+2.38)
        #self.xsetOrigin(-58.9+54.6+17.2)
        
        self.mark('right edge', x=+54.4)
        self.mark('left edge', x=-54.4)
        self.mark('bottom edge', y=-12.71)
        self.mark('center', x=0, y=0)
                    
    
    
    
class GIBarCustom_openWAXS(GIBar):
    
    def __init__(self, name='GIBar', base=None, **kwargs):
        
        super().__init__(name=name, base=base, **kwargs)
        
        self._positional_axis = 'x'
        
        #self.xsetOrigin(-58.9+54.61+17.47)
        self._axes['x'].origin = -3.31-4.3*25.4/2
        self._axes['y'].origin = 21
        
        self.mark('right edge', x=+108.2)
        self.mark('left edge', x=0)
        self.mark('center', x=54.1, y=0)
        
    def doSamples_MAXS(self, exposure_time=1):

        maxs_on()
        for sample in self.getSamples():
            if verbosity>=3:
                print('Doing sample {}...'.format(sample.name))
                
            sample.gotoOrigin()
            #sample.xr(0.3)
            sample.measureIncidentAngles(exposure_time=exposure_time)
            
        saxs_on()


        
    def check_positions(self, step=1, exposure_time=None, temperatures = range(30, 270, 10)):
        
        for sample in self.getSamples():
            sample.gotoOrigin()

            time.sleep(1)        
        
def saxs_on():
    detselect(pilatus2M)
    MAXSx.move(30)
    
def maxs_on():
    detselect(pilatus300)
    #MAXSx.move(61)
    MAXSx.move(87.5)
    MAXSy.move(60)
    

def waxs_on():
    detselect(psccd)
  


#cms.SAXS.setCalibration([738.0, 1096], 4.22, [-65, -73]) 
cms.SAXS.setCalibration([734.0, 1678-581.0], 3.81, [-65, -73])  #13.5kev, 3m setup at 2018-10-03

print('\n\n\nReminders:')
print('    Define your detectors using, e.g.: detselect(pilatus300)')
print('    Reload your user-specific script, e.g.: %run -i /GPFS/xf11bm/data/2017_2/user_group/user.py')
print('\n')

#fRE.md['experiment_alias_directory'] = '/GPFS/xf11bm/data/2018_1/StiffRoberts'


if True:
    
    # Example of a multi-sample holder
    
    md = {
        'owner' : 'beamline' ,
        'series' : 'various' ,
        }
    
    #hol = GIBar(base=stg)
    #hol = GIBarCustom(base=stg)
    hol = GIBarCustom_openWAXS(base=stg)

    #hol.addSampleSlotPosition( Sample('012-NA', **md), 1, 15+4)
    #hol.addSampleSlotPosition( Sample('013-NA', **md), 2, 31)
    #hol.addSampleSlotPosition( Sample('014-NA', **md), 3, 45+1)
    #hol.addSampleSlotPosition( Sample('AEQT-PbCl', **md), 4, 57)
    #hol.addSampleSlotPosition( Sample('003-110C', **md), 5, 68)
    #hol.addSampleSlotPosition( Sample('005-110C', **md), 6, 81)
    #hol.addSampleSlotPosition( Sample('006-110C', **md), 7, 95-5)
    #hol.addSampleSlotPosition( Sample('Yen_2018-1_sampleC', **md), 7, 65 )
    #hol.addSampleSlotPosition( Sample('Yen_2018-1_sampleD', **md), 8, 85 )
    #hol.addSampleSlotPosition( Sample('JH_60_40_arearatio_S6_8nm_S3_16nm_solid', **md), 9, 82.3 )
    #hol.addSampleSlotPosition( Sample('JH_none_arearatio_S6_8nm_S3_16nm_solid', **md), 10, 91.9 )
  
    #hol.addSampleSlotPosition( Sample('008-110C', **md), 1, 20)
    #hol.addSampleSlotPosition( Sample('010-110C', **md), 2, 35)
    #hol.addSampleSlotPosition( Sample('011-110C', **md), 3, 49)
    #hol.addSampleSlotPosition( Sample('012-110C', **md), 4, 63)
    #hol.addSampleSlotPosition( Sample('013-110C', **md), 5, 75)
    #hol.addSampleSlotPosition( Sample('014-110C', **md), 6, 90)
    #hol.addSampleSlotPosition( Sample('006-110C', **md), 7, 95-5)
   
  
    hol.addSampleSlotPosition( Sample('AEBT-Cl', **md), 1, 32)
    hol.addSampleSlotPosition( Sample('AEBT-I', **md), 2, 45)
    hol.addSampleSlotPosition( Sample('AEGT-I', **md), 3, 60)
    #hol.addSampleSlotPosition( Sample('012-110C', **md), 4, 63)
    #hol.addSampleSlotPosition( Sample('013-110C', **md), 5, 75)
    #hol.addSampleSlotPosition( Sample('014-110C', **md), 6, 90)
        
if False:
    
    #hol = CapillaryHolder(base=stg)
    #hol = CapillaryHolderCustom(base=stg)
    hol = CapillaryHolderCustom_openWAXS(base=stg)
    
    hol.addSampleSlot( Sample('test1'), 1.0 )
    hol.addSampleSlot( Sample('test2'), 2.0 )
    #hol.addSampleSlot( Sample('YT_Sep08_2017_sample903'), 3.0 )
    #hol.addSampleSlot( Sample('YT_Sep08_2017_sample904'), 4.0 )
    hol.addSampleSlot( Sample('FL_screen'), 5.0 )
    #hol.addSampleSlot( Sample('YT_Sep08_2017_sample906'), 6.0 )
    #hol.addSampleSlot( Sample('YT_Sep08_2017_sample906'), 7.0 )
    hol.addSampleSlot( Sample('AgBH_cali_openWAXS_11kev'), 8.0 )
    #hol.addSampleSlot( Sample('YT_Sep08_2017_sample909'), 9.0 )
    #hol.addSampleSlot( Sample('YT_Sep08_2017_sample910'), 10.0 )
    hol.addSampleSlot( Sample('Empty'), 11.0 )
    #hol.addSampleSlot( Sample('YT_Sep08_2017_sample912'), 12.0 )
    #hol.addSampleSlot( Sample('YT_Sep08_2017_sample913'), 13.0 )
    #hol.addSampleSlot( Sample('YT_Sep08_2017_sample914'), 14.0 )
    #hol.addSampleSlot( Sample('YT_Sep08_2017_sample915'), 15.0 )




    
#%run -i /GPFS/xf11bm/data/2018_1/beamline/user.py


'''
Protocol:
Load samples in glove box
put the bar on the stage. Turn on He gas. Move the MAXS out of the beam. 
close hutch/open shutter
input Sample names and positions in user.py
load user.py
#hol.listSamples()
#hol.check_positions()
#hol.doSamples()
go into the hutch and put MAXS to measurement positions
#hol.doSamples_MAXS(exposure_time=10)

sam=hol.gotoSample(2)
sam.measure()
sam.measureIncidentAngles(exposure_time=10)
sam.measureIncidentAngle(0.13, exposure_time=10)
sam.do()

#2018_02 setup
The MAXS beam stop is still the two layer lead tape. 

Measurement position for the MAXS detector
In [111]: %wa MAXSx, MAXSy
Positioner                     Value      Low Limit  High Limit Offset    
MAXSx                          61.0       0.0        70.0       0.0       
MAXSy                          60.0       0.0        0.0        0.0       



#GIBar origin for MAXS
In [49]: %mov smx 51.7

#CapillaryHolder origin for MAXS
    Positioner                     Value      Low Limit  High Limit Offset    
smx                            -5.01375   -75.0      75.0       -49.0     
smy                            6.6986     -100.0     100.0      0.0                                                                                                                             

'''


