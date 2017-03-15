.title ECE423_HW7
.options post
.inc tsmc25.net


**Parameters**
.param l1 = 0.24u
.param l2 = 0.48u
.param l3 = 1.02u
.param la = 0.3u
.param lb = 0.42u
.param lc = 0.54u

.param w0 = 1.5u
.param wa = 3u
.param wb = 4.98u
.param wc = 10.02u
.param wd = 19.98u
.param we = 40.02u
.param wf = 79.98u
.param wg = 160.02u
.param wh = 186u
.param wi = 319.98u
.param wj = 640.02u
.param wk = 120u
.param wl = 480u

.param w09 = 130.02u
.param w9 = '160.02u - w09'


.param ch = 199.98u


.subckt opamp vg1 vg2 out1 out2 gcm ncmn Vdd GND!
** COMMON MODE REFERENCE **
Vcm vgcm 0 DC=1V

** CURRENT SOURCE **
Iref nref22 0 50u

** INPUT **
M0 n1 nref1 Vdd Vdd 	CMOSP l='lb' w='wi' ad='.66u*wi' as='.66u*wi' pd='1.32u+2*wi' ps='1.32u+2*wi'
M1 n2 vg1 n1 Vdd 	CMOSP l='l1' w='wg' ad='.66u*wg' as='.66u*wg' pd='1.32u+2*wg' ps='1.32u+2*wg'
M2 n3 vg2 n1 Vdd 	CMOSP l='l1' w='wg' ad='.66u*wg' as='.66u*wg' pd='1.32u+2*wg' ps='1.32u+2*wg'

**Gain Stage **
M3 n3 nref4 0 0 	CMOSN l='l2' w='wh' ad='.66u*wh' as='.66u*wh' pd='1.32u+2*wh' ps='1.32u+2*wh'
M4 n2 nref4 0 0 	CMOSN l='l2' w='wh' ad='.66u*wh' as='.66u*wh' pd='1.32u+2*wh' ps='1.32u+2*wh'
M5 n4 nref3 n3 0 	CMOSN l='l2' w='wf' ad='.66u*wf' as='.66u*wf' pd='1.32u+2*wf' ps='1.32u+2*wf'
M6 n7 nref3 n2 0 	CMOSN l='l2' w='wf' ad='.66u*wf' as='.66u*wf' pd='1.32u+2*wf' ps='1.32u+2*wf'
M7 n4 nref2 n5 Vdd 	CMOSP l='l2' w='wg' ad='.66u*wg' as='.66u*wg' pd='1.32u+2*wg' ps='1.32u+2*wg'
M8 n7 nref2 n6 Vdd 	CMOSP l='l2' w='wg' ad='.66u*wg' as='.66u*wg' pd='1.32u+2*wg' ps='1.32u+2*wg'
M9 n5 gcm Vdd Vdd 	CMOSP l='lc' w='w9' ad='.66u*w9' as='.66u*w9' pd='1.32u+2*w9' ps='1.32u+2*w9'
M10 n6 gcm Vdd Vdd 	CMOSP l='lc' w='w9' ad='.66u*w9' as='.66u*w9' pd='1.32u+2*w9' ps='1.32u+2*w9'
M09 n5 nref1 Vdd Vdd 	CMOSP l='lc' w='w09' ad='.66u*w09' as='.66u*w09' pd='1.32u+2*w09' ps='1.32u+2*w09'
M010 n6 nref1 Vdd Vdd 	CMOSP l='lc' w='w09' ad='.66u*w09' as='.66u*w09' pd='1.32u+2*w09' ps='1.32u+2*w09'

** SECOND STAGE **
M11 n8 nref1 Vdd Vdd 	CMOSP l='l2' w='wl' ad='.66u*wl' as='.66u*wl' pd='1.32u+2*wl' ps='1.32u+2*wl'
M12 n9 nref1 Vdd Vdd 	CMOSP l='l2' w='wl' ad='.66u*wl' as='.66u*wl' pd='1.32u+2*wl' ps='1.32u+2*wl'
M13 out1 nref2 n8 Vdd 	CMOSP l='l2' w='wl' ad='.66u*wl' as='.66u*wl' pd='1.32u+2*wl' ps='1.32u+2*wl'
M14 out2 nref2 n9 Vdd 	CMOSP l='l2' w='wl' ad='.66u*wl' as='.66u*wl' pd='1.32u+2*wl' ps='1.32u+2*wl'
M15 out1 n4 0 0 	CMOSN l=.36u w='wg' ad='.66u*wg' as='.66u*wg' pd='1.32u+2*wg' ps='1.32u+2*wg'
M16 out2 n7 0 0 	CMOSN l=.36u w='wg' ad='.66u*wg' as='.66u*wg' pd='1.32u+2*wg' ps='1.32u+2*wg'
*M17 n88 nref4 0 0 	CMOSN l='l1' w='wg' ad='.66u*wg' as='.66u*wg' pd='1.32u+2*wg' ps='1.32u+2*wg'
*M18 n99 nref4 0 0 	CMOSN l='l1' w='wg' ad='.66u*wg' as='.66u*wg' pd='1.32u+2*wg' ps='1.32u+2*wg'

** BIASING TRANSISTORS **
Mb1 nref1 nref1 Vdd Vdd     CMOSP l='l1' w='wd' ad='.66u*wd' as='.66u*wd' pd='1.32u+2*wd' ps='1.32u+2*wd'
Mb2 nref22 nref22 nref1 Vdd CMOSP l='l1' w='wd' ad='.66u*wd' as='.66u*wd' pd='1.32u+2*wd' ps='1.32u+2*wd'
Mb3 nb1 nref1 Vdd Vdd 	    CMOSP l='l1' w='wd' ad='.66u*wd' as='.66u*wd' pd='1.32u+2*wd' ps='1.32u+2*wd'
Mb4 nref4 nref22 nb1 Vdd    CMOSP l='l1' w='wd' ad='.66u*wd' as='.66u*wd' pd='1.32u+2*wd' ps='1.32u+2*wd'
Mb5 nref4 nref4 0 0 	    CMOSN l='l1' w='wc' ad='.66u*wc' as='.66u*wc' pd='1.32u+2*wc' ps='1.32u+2*wc'
Mb6 nb2 nref1 Vdd Vdd 	    CMOSP l='l1' w='wd' ad='.66u*wd' as='.66u*wd' pd='1.32u+2*wd' ps='1.32u+2*wd'
Mb7 nref3 nref22 nb2 Vdd    CMOSP l='l1' w='wd' ad='.66u*wd' as='.66u*wd' pd='1.32u+2*wd' ps='1.32u+2*wd'
Mb8 nref3 nref3 0 0 	    CMOSN l='l1' w='w0' ad='.66u*w0' as='.66u*w0' pd='1.32u+2*w0' ps='1.32u+2*w0'
Mb9 nref2 nref2 Vdd Vdd     CMOSP l='l1' w='wa' ad='.66u*wa' as='.66u*wa' pd='1.32u+2*wa' ps='1.32u+2*wa'
*Mb10 nref2 nref2 nb3 0     CMOSN l='l1' w='wd' ad='.66u*wd' as='.66u*wd' pd='1.32u+2*wd' ps='1.32u+2*wd'
Mb11 nref2 nref4 0 0 	    CMOSN l='l1' w='wc' ad='.66u*wc' as='.66u*wc' pd='1.32u+2*wc' ps='1.32u+2*wc'


** COMMON MODE FEEDBACK (NO RESISTORS)**
Mcm1 n11 nref4 0 0 	CMOSN l='l2' w='wc' ad='.66u*wc' as='.66u*wc' pd='1.32u+2*wc' ps='1.32u+2*wc'
Mcm2 n12 nref4 0 0 	CMOSN l='l2' w='wc' ad='.66u*wc' as='.66u*wc' pd='1.32u+2*wc' ps='1.32u+2*wc'
Mcm3 ncmn out1 n11 0 	CMOSN l='l2' w='wb' ad='.66u*wb' as='.66u*wb' pd='1.32u+2*wb' ps='1.32u+2*wb'
Mcm4 ncmn out2 n12 0 	CMOSN l='l2' w='wb' ad='.66u*wb' as='.66u*wb' pd='1.32u+2*wb' ps='1.32u+2*wb'
Mcm5 ncmp vgcm n11 0 	CMOSN l='l2' w='wb' ad='.66u*wb' as='.66u*wb' pd='1.32u+2*wb' ps='1.32u+2*wb'
Mcm6 ncmp vgcm n12 0 	CMOSN l='l2' w='wb' ad='.66u*wb' as='.66u*wb' pd='1.32u+2*wb' ps='1.32u+2*wb'
Mcm7 ncmp ncmp Vdd Vdd 	CMOSP l='l2' w='wd' ad='.66u*wd' as='.66u*wd' pd='1.32u+2*wd' ps='1.32u+2*wd'
Mcm8 ncmn ncmn Vdd Vdd 	CMOSP l='l2' w='wd' ad='.66u*wd' as='.66u*wd' pd='1.32u+2*wd' ps='1.32u+2*wd'

** PASSIVE COMPONENTS **
CL1 out1 0 'var*3p'
CL2 out2 0 'var*3p'
Cc1 n4 out1 'var*1.8p'
Cc2 n7 out2 'var*1.8p'
*Rc1 nc1 n4 'var*700'
*Rc2 nc2 n7 'var*700'
*Ccm ncmn ncmp 1p
*Ccm1 0 ncmp 'var*1p'
*Ccm2 0 ncmn 'var*1p'
*Rcm1 ncmn nc3 'var*500'
*Rcm2 ncmc nc4 'var*500'
*Cx1 n7 0 1p
*Cx2 n4 0 1p
.ends
************************

** DEFAULT SETUP ******************************
*Xop1 vg1 vg2 out1 out2 ncm ncm Vdd 0 opamp
*Cin1 vg1 0 1p
*Cin2 vg1 0 1p
*Clp1 vg1 out1 1p
*Clp2 vg2 out2 1p
***********************************************

** CMFB EVALUATION SETUP **********************
*Vcmtest vt 0 DC=1755.8982m AC=1V
*Xop1 vg1 vg2 out1 out2 vt cmfb_out Vdd 0 opamp
*Xop2 vg1 vg2 ot1 ot2 cmfb_out nf Vdd 0 opamp
************************************************

** DIFFERENTIAL GAIN SETUP ********************
Xop1 vg1 vg2 out1 out2 ncm1 ncm1 Vdd 0 opamp
Xop2 n23 n24 ot1 ot2 ncm2 ncm2 Vdd 0 opamp

Cin1 n23 vb 'var*1p'
Cin2 n24 vb 'var*1p'
Rgig1 n23 vb 'var*1g' 
Rgig2 n24 vb 'var*1g' 
Clp1 n23 out1 'var*1p'
Clp2 n24 out2 'var*1p'

Cin3 n21 vb 'var*1p'
Cin4 n22 vb 'var*1p'
Rgig3 n21 vb 'var*1g' 
Rgig4 n22 vb 'var*1g' 
Clp3 n21 ot1 'var*1p'
Clp4 n22 ot2 'var*1p'
**********************************************

** SOURCES **
Vin1 vg1 vb AC=.5,180
Vin2 vg2 vb AC=.5,0
*Vin vg1 vg2 DC=1V
VD Vdd 0 DC=2.5V
Vbb vb 0 DC=1.25V

** SIMULATION **
.param var=1
.temp 27
.op
*.pz V(cmfb_out) Vcmtest
*.pz V(out2) Vin1
.ac dec 10 1e3 1e9
.dc vin1 1.245 1.255 1u
.end
