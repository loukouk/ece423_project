SOURCE = proj

default:
	hspice ${SOURCE}.sp :> ${SOURCE}.lis

clean:
	rm -rf *.sw0 *.st0 *.ic0 *.ac0 *.lis *.sw1 *.tr0 *.pa0
