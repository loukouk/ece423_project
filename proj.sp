.title ECE423_HW7
.options post
.inc "../tsmc25"


.subckt opamp vg1 vg2 out1 out2 gcm ncmn Vdd GND!
** COMMON MODE REFERENCE **
Vcm vgcm 0 DC=1V

** CURRENT SOURCE **
Iref nref22 0 40u

** MAIN TRANSISTORS **
Mn0 n0 nref4 0 0 CMOSN l=.48u w=160u ad=105.6p as=105.6p pd=321.32u ps=321.32u
Mn1 n6 vg1 n0 0 CMOSN l=.24u w=40u ad=26.4p as=26.4p pd=81.32u ps=81.32u
Mn2 n5 vg2 n0 0 CMOSN l=.24u w=40u ad=26.4p as=26.4p pd=81.32u ps=81.32u

Mp0 n1 nref1 Vdd Vdd CMOSP l=.48u w=320u ad=211.2p as=211.2p pd=641.32u ps=641.32u
Mp1 n2 vg1 n1 Vdd CMOSP l=.24u w=80u ad=52.8p as=52.8p pd=161.32u ps=161.32u
Mp2 n3 vg2 n1 Vdd CMOSP l=.24u w=80u ad=52.8p as=52.8p pd=161.32u ps=161.32u
M3 n3 nref4 0 0 cmosn l=.48u w=180u ad=105.6p as=105.6p pd=321.32u ps=321.32u
M4 n2 nref4 0 0 cmosn l=.48u w=180u ad=105.6p as=105.6p pd=321.32u ps=321.32u
M5 n4 nref3 n3 0 CMOSN l=.48u w=80u ad=52.8p as=52.8p pd=161.32u ps=161.32u
M6 n7 nref3 n2 0 CMOSN l=.48u w=80u ad=52.8p as=52.8p pd=161.32u ps=161.32u
M7 n4 nref2 n5 Vdd CMOSP l=.48u w=160u ad=105.6p as=105.6p pd=321.32u ps=321.32u
M8 n7 nref2 n6 Vdd CMOSP l=.48u w=160u ad=105.6p as=105.6p pd=321.32u ps=321.32u
M9 n5 gcm Vdd Vdd CMOSP l=.48u w=360u ad=211.2p as=211.2p pd=721.32u ps=721.32u
M10 n6 gcm Vdd Vdd CMOSP l=.48u w=360u ad=211.2p as=211.2p pd=721.32u ps=721.32u
*M09 n5 nref1 Vdd Vdd CMOSP l=.48u w=120u ad=79.2p as=79.2p pd=241.32u ps=241.32u
*M010 n6 nref1 Vdd Vdd CMOSP l=.48u w=120u ad=79.2p as=79.2p pd=241.32u ps=241.32u

** SECOND STAGE **
M11 n8 nref1 Vdd Vdd CMOSP l=.48u w=160u ad=105.6p as=105.6p pd=321.32u ps=321.32u
M12 n9 nref1 Vdd Vdd CMOSP l=.48u w=160u ad=105.6p as=105.6p pd=321.32u ps=321.32u
M13 out1 nref2 n8 Vdd CMOSP l=.48u w=160u ad=105.6p as=105.6p pd=321.32u ps=321.32u
M14 out2 nref2 n9 Vdd CMOSP l=.48u w=160u ad=105.6p as=105.6p pd=321.32u ps=321.32u
M15 out1 nref3 n88 0 CMOSN l=.48u w=80u ad=52.8p as=52.8p pd=161.32u ps=161.32u
M16 out2 nref3 n99 0 CMOSN l=.48u w=80u ad=52.8p as=52.8p pd=161.32u ps=161.32u
M17 n88 n4 0 0 CMOSN l=.48u w=80u ad=52.8p as=52.8p pd=161.32u ps=161.32u
M18 n99 n7 0 0 CMOSN l=.48u w=80u ad=52.8p as=52.8p pd=161.32u ps=161.32u

** BIASING TRANSISTORS **
Mb1 nref1 nref1 Vdd Vdd CMOSP l=.48u w=20u ad=13.2p as=13.2p pd=41.32u ps=41.32u
Mb2 nref22 nref22 nref1 Vdd CMOSP l=.48u w=20u ad=13.2p as=13.2p pd=41.32u ps=41.32u
Mb3 nb1 nref1 Vdd Vdd CMOSP l=.48u w=20u ad=13.2p as=13.2p pd=41.32u ps=41.32u
Mb4 nref4 nref22 nb1 Vdd CMOSP l=.48u w=20u ad=13.2p as=13.2p pd=41.32u ps=41.32u
Mb5 nref4 nref4 0 0 CMOSN l=.48u w=10u ad=6.6p as=6.6p pd=21.32u ps=21.32u
Mb6 nb2 nref1 Vdd Vdd CMOSP l=.48u w=20u ad=13.2p as=13.2p pd=41.32u ps=41.32u
Mb7 nref3 nref22 nb2 Vdd CMOSP l=.48u w=20u ad=13.2p as=13.2p pd=41.32u ps=41.32u
Mb8 nref3 nref3 0 0 CMOSN l=.48u w=1.5u  ad=.99p as=.99p pd=4.32u ps=4.32u
Mb9 nref2 nref2 Vdd Vdd CMOSP l=.48u w=3u ad=1.98p as=1.98p pd=7.32u ps=7.32u
*Mb10 nref2 nref2 nb3 0 CMOSN l=.48u w=20u ad=13.2p as=13.2p pd=41.32u ps=41.32u
Mb11 nref2 nref4 0 0 CMOSN l=.48u w=10u ad=6.6p as=6.6p pd=21.32u ps=21.32u

** COMMON MODE FEEDBACK (WITH RESISTORS)**
*Mcm1 n11 nref1 Vdd Vdd CMOSP l=.24u w=10u ad=6.6p as=6.6p pd=21.32u ps=21.32u
*Mcm2 n12 nref2 Vdd Vdd CMOSP l=.24u w=10u ad=6.6p as=6.6p pd=21.32u ps=21.32u
*Mcm3 0 out1 n11 Vdd CMOSP l=.24u w=10u ad=6.6p as=6.6p pd=21.32u ps=21.32u
*Mcm4 0 out2 n12 Vdd CMOSP l=.24u w=10u ad=6.6p as=6.6p pd=21.32u ps=21.32u
*Rcm1 n11 n13 'var*25k'
*Rcm2 n12 n13 'var*25k'
*Mcm5 n17 ncmn Vdd Vdd CMOSP l=.24u w=10u ad=6.6p as=6.6p pd=21.32u ps=21.32u
*Mcm6 n18 ncmp Vdd Vdd CMOSP l=.24u w=10u ad=6.6p as=6.6p pd=21.32u ps=21.32u
*Mcm12 ncmn nref2 n17 Vdd CMOSP l=.24u w=10u ad=6.6p as=6.6p pd=21.32u ps=21.32u
*Mcm13 ncmp nref2 n18 Vdd CMOSP l=.24u w=10u ad=6.6p as=6.6p pd=21.32u ps=21.32u
*Mcm7 ncmn n13 n15 0 CMOSN l=.24u w=10u ad=6.6p as=6.6p pd=21.32u ps=21.32u
*Mcm8 ncmp n16 n15 0 CMOSN l=.24u w=10u ad=6.6p as=6.6p pd=21.32u ps=21.32u
*Mcm9 n15 nref4 0 0 CMOSN l=.24u w=20u ad=21.12p as=21.12p pd=41.32u ps=41.32u
*Mcm10 n16 nref1 Vdd Vdd CMOSP l=.24u w=10u ad=6.6p as=6.6p pd=21.32u ps=21.32u
*Mcm11 0 vgcm n16 Vdd CMOSP l=.24u w=10u ad=6.6p as=6.6p pd=21.32u ps=21.32u

** COMMON MODE FEEDBACK (NO RESISTORS)**
Mcm1 n11 nref4 0 0 CMOSN l=.48u w=10u ad=6.6p as=6.6p pd=21.32u ps=21.32u
Mcm2 n12 nref4 0 0 CMOSN l=.48u w=10u ad=6.6p as=6.6p pd=21.32u ps=21.32u
Mcm3 ncmn out1 n11 0 CMOSN l=.48u w=5u ad=3.3p as=3.3p pd=11.32u ps=11.32u
Mcm4 ncmn out2 n12 0 CMOSN l=.48u w=5u ad=3.3p as=3.3p pd=11.32u ps=11.32u
Mcm5 ncmp vgcm n11 0 CMOSN l=.48u w=5u ad=3.3p as=3.3p pd=11.32u ps=11.32u
Mcm6 ncmp vgcm n12 0 CMOSN l=.48u w=5u ad=3.3p as=3.3p pd=11.32u ps=11.32u
Mcm7 ncmp ncmp Vdd Vdd CMOSP l=.48u w=20u ad=13.2p as=13.2p pd=41.32u ps=41.32u
Mcm8 ncmn ncmn Vdd Vdd CMOSP l=.48u w=20u ad=13.2p as=13.2p pd=41.32u ps=41.32u

** PASSIVE COMPONENTS **
CL1 out1 0 'var*3p'
CL2 out2 0 'var*3p'
Cc1 n4 out1 'var*3.3p'
Cc2 n7 out2 'var*3.3p'
*Rc1 nc1 n4 'var*700'
*Rc2 nc2 n7 'var*700'
*Ccm ncmn ncmp 1p
*Ccm1 out1 nc3 'var*1p'
*Ccm2 out2 nc4 'var*1p'
*Rcm1 ncmn nc3 'var*500'
*Rcm2 ncmc nc4 'var*500'
*Cx1 n4 0 1p
*Cx2 n7 0 1p
.ends

** DEFAULT SETUP ******************************
*Xop1 vg1 vg2 out1 out2 ncm ncm Vdd 0 opamp
*Cin1 vg1 0 1p
*Cin2 vg1 0 1p
*Clp1 vg1 out1 1p
*Clp2 vg2 out2 1p
***********************************************


** CMFB EVALUATION SETUP **********************
*Vcmtest vt 0 DC=1730.75m AC=1V
*Xop1 vg1 vg2 out1 out2 vt cmfb_out Vdd 0 opamp
*Xop2 vg1 vg2 ot1 ot2 cmfb_out nf Vdd 0 opamp
***********************************************


** DIFFERENTIAL GAIN SETUP ********************
Xop1 vg1 vg2 out1 out2 ncm1 ncm1 Vdd 0 opamp
Xop2 n23 n24 ot1 ot2 ncm2 ncm2 Vdd 0 opamp

Cin1 n23 0 'var*1p'
Cin2 n24 0 'var*1p'
Rgig1 n23 0 1g 
Rgig2 n24 0 1g 
Clp1 n23 out1 'var*1p'
Clp2 n24 out2 'var*1p'

Cin3 n21 0 'var*1p'
Cin4 n22 0 'var*1p'
Rgig3 n21 0 1g 
Rgig4 n22 0 1g 
Clp3 n21 ot1 'var*1p'
Clp4 n22 ot2 'var*1p'
**********************************************


** SOURCES **
Vin1 vg1 0 DC=1.25V AC=.5,180
Vin2 vg2 0 DC=1.25V AC=.5,0
*Vin vg1 vg2 DC=1V
VD Vdd 0 DC=2.5V

** SIMULATION **
.param var=1
.temp 27
.op
*.pz V(cmfb_out) Vcmtest
*.pz V(out2) Vin1
.ac dec 10 1000 1e9
*.dc vin1 1 1.5 .0001
.end
