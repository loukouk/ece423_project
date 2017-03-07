.title ECE423_HW7
.options post
.inc "../tsmc25"


.subckt opamp vg1 vg2 out1 out2 gcm ncm Vdd GND!
** COMMON MODE REFERENCE **
Vcm vgcm 0 DC=1V

** CURRENT SOURCE **
Iref nref22 0 100u
*Ri nref22 0 20k

** MAIN TRANSISTORS **
M0 n1 gcm Vdd Vdd CMOSP l=.25u w=80u ad=52.8p as=52.8p pd=161.32u ps=161.32u
M1 n2 vg1 n1 Vdd CMOSP l=.25u w=80u ad=52.8p as=52.8p pd=161.32u ps=161.32u
M2 n3 vg2 n1 Vdd CMOSP l=.25u w=80u ad=52.8p as=52.8p pd=161.32u ps=161.32u
M3 n3 nref4 0 0 CMOSN l=.25u w=80u ad=52.8p as=52.8p pd=161.32u ps=161.32u
M4 n2 nref4 0 0 CMOSN l=.25u w=80u ad=52.8p as=52.8p pd=161.32u ps=161.32u
M5 n4 nref3 n3 0 CMOSN l=.25u w=40u ad=26.4p as=26.4p pd=81.32u ps=81.32u
M6 n7 nref3 n2 0 CMOSN l=.25u w=40u ad=26.4p as=26.4p pd=81.32u ps=81.32u
M7 n4 nref2 n5 Vdd CMOSP l=.25u w=40u ad=26.4p as=26.4p pd=81.32u ps=81.32u
M8 n7 nref2 n6 Vdd CMOSP l=.25u w=40u ad=26.4p as=26.4p pd=81.32u ps=81.32u
M9 n5 nref1 Vdd Vdd CMOSP l=.25u w=40u ad=26.4p as=26.4p pd=81.32u ps=81.32u
M10 n6 nref1 Vdd Vdd CMOSP l=.25u w=40u ad=26.4p as=26.4p pd=81.32u ps=81.32u

** SECOND STAGE **
M11 out1 nref1 Vdd Vdd CMOSP l=.25u w=40u ad=26.4p as=26.4p pd=81.32u ps=81.32u
M12 out1 n4 0 0 CMOSN l=.25u w=40u ad=26.4p as=26.4p pd=81.32u ps=81.32u
M13 out2 nref1 Vdd Vdd CMOSP l=.25u w=40u ad=26.4p as=26.4p pd=81.32u ps=81.32u
M14 out2 n7 0 0 CMOSN l=.25u w=40u ad=26.4p as=26.4p pd=81.32u ps=81.32u


** BIASING TRANSISTORS **
Mb1 nref1 nref1 Vdd Vdd CMOSP l=.25u w=10u ad=6.6p as=6.6p pd=21.32u ps=21.32u
Mb2 nref22 nref22 nref1 Vdd CMOSP l=.25u w=10u ad=6.6p as=6.6p pd=21.32u ps=21.32u
Mb3 nb1 nref1 Vdd Vdd CMOSP l=.25u w=10u ad=6.6p as=6.6p pd=21.32u ps=21.32u
Mb4 nref4 nref22 nb1 Vdd CMOSP l=.25u w=10u ad=6.6p as=6.6p pd=21.32u ps=21.32u
Mb5 nref4 nref4 0 0 CMOSN l=.25u w=10u ad=6.6p as=6.6p pd=21.32u ps=21.32u
Mb6 nb2 nref1 Vdd Vdd CMOSP l=.25u w=10u ad=6.6p as=6.6p pd=21.32u ps=21.32u
Mb7 nref3 nref22 nb2 Vdd CMOSP l=.25u w=10u ad=6.6p as=6.6p pd=21.32u ps=21.32u
Mb8 nref3 nref3 0 0 CMOSN l=.25u w=2u ad=1.32p as=1.32p pd=3.32u ps=3.32u
Mb9 nref2 nref2 Vdd Vdd CMOSP l=.25u w=2u ad=1.32p as=1.32p pd=3.32u ps=3.32u
Mb10 nref2 nref2 nb3 0 CMOSN l=.25u w=10u ad=6.6p as=6.6p pd=21.32u ps=21.32u
Mb11 nb3 nref4 0 0 CMOSN l=.25u w=10u ad=6.6p as=6.6p pd=21.32u ps=21.32u

** COMMON MODE FEEDBACK (WITH RESISTORS)**
Mcm1 n11 nref1 Vdd Vdd CMOSP l=.25u w=10u ad=6.6p as=6.6p pd=21.32u ps=21.32u
Mcm2 n12 nref2 Vdd Vdd CMOSP l=.25u w=10u ad=6.6p as=6.6p pd=21.32u ps=21.32u
Mcm3 0 out1 n11 Vdd CMOSP l=.25u w=10u ad=6.6p as=6.6p pd=21.32u ps=21.32u
Mcm4 0 out2 n12 Vdd CMOSP l=.25u w=10u ad=6.6p as=6.6p pd=21.32u ps=21.32u
Rcm1 n11 n13 25k
Rcm2 n12 n13 25k
Mcm5 ncm ncm Vdd Vdd CMOSP l=.25u w=10u ad=6.6p as=6.6p pd=21.32u ps=21.32u
Mcm6 n14 n14 Vdd Vdd CMOSP l=.25u w=10u ad=6.6p as=6.6p pd=21.32u ps=21.32u
Mcm7 ncm n13 n15 0 CMOSN l=.25u w=10u ad=6.6p as=6.6p pd=21.32u ps=21.32u
Mcm8 n14 n16 n15 0 CMOSN l=.25u w=10u ad=6.6p as=6.6p pd=21.32u ps=21.32u
Mcm9 n15 nref4 0 0 CMOSN l=.25u w=20u ad=21.12p as=21.12p pd=41.32u ps=41.32u
Mcm10 n16 nref1 Vdd Vdd CMOSP l=.25u w=10u ad=6.6p as=6.6p pd=21.32u ps=21.32u
Mcm11 0 vgcm n16 Vdd CMOSP l=.25u w=10u ad=6.6p as=6.6p pd=21.32u ps=21.32u

** COMMON MODE FEEDBACK (NO RESISTORS)**
**Mcm1 n11 nref4 0 0 CMOSN l=.25u w=10u ad=6.6p as=6.6p pd=21.32u ps=21.32u
**Mcm2 n12 nref4 0 0 CMOSN l=.25u w=10u ad=6.6p as=6.6p pd=21.32u ps=21.32u
**Mcm3 n13 out1 n11 0 CMOSN l=.25u w=10u ad=6.6p as=6.6p pd=21.32u ps=21.32u
**Mcm4 n13 out2 n12 0 CMOSN l=.25u w=10u ad=6.6p as=6.6p pd=21.32u ps=21.32u
**Mcm5 ncm vgcm n11 0 CMOSN l=.25u w=10u ad=6.6p as=6.6p pd=21.32u ps=21.32u
**Mcm6 ncm vgcm n12 0 CMOSN l=.25u w=10u ad=6.6p as=6.6p pd=21.32u ps=21.32u
**Mcm7 ncm ncm Vdd Vdd CMOSP l=.25u w=20u ad=13.2p as=13.2p pd=41.32u ps=41.32u
**Mcm8 n12 nref2 Vdd Vdd CMOSP l=.25u w=20u ad=13.2p as=13.2p pd=41.32u ps=41.32u

** PASSIVE COMPONENTS **
CL1 out1 0 3p
CL2 out2 0 3p
.ends

** DEFAULT SETUP ******************************
Xop1 vg1 vg2 out1 out2 ncm ncm Vdd 0 opamp
Cin1 vg1 0 1p
Cin2 vg1 0 1p
Clp1 vg1 out1 1p
Clp2 vg2 out2 1p
***********************************************


** CMFB EVALUATION SETUP **********************
*Vcmtest vt 0 DC=1.81305V AC=1V
*Xop1 vg1 vg2 out1 out2 vt cmfb_out Vdd 0 opamp
*Xop2 vg1 vg2 ot1 ot2 cmfb_out nf Vdd 0 opamp
***********************************************


** DIFFERENTIAL GAIN SETUP ********************
*Xop1 vg1 vg2 out1 out2 ncm1 ncm1 Vdd 0 opamp
*Xop2 n23 n24 ot1 ot2 ncm2 ncm2 Vdd 0 opamp

*Cin1 n23 0 1p
*Cin2 n24 0 1p
*Rgig1 n23 0 1g 
*Rgig2 n24 0 1g 
*Clp1 n23 out1 1p
*Clp2 n24 out2 1p

*Cin3 n21 0 1p
*Cin4 n22 0 1p
*Rgig3 n21 0 1g 
*Rgig4 n22 0 1g 
*Clp3 n21 ot1 1p
*Clp4 n22 ot2 1p
**********************************************


** SOURCES **
Vin1 vg1 0 DC=1.25V AC=1,180
Vin2 vg2 0 DC=1.25V AC=1,0
*Vin vg1 vg2 DC=1V
VD Vdd 0 DC=2.5V

** SIMULATION **
.temp 25
.op
**.pz V(out) Vin1
.ac dec 10 1e3 1e9
.dc Vcmtest 0 2.5 .01
.end
