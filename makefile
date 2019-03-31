main: Main.hs Parse.hs Transform.hs Line.hs Solids.hs
	ghc -dynamic -O -O2 Main.hs

clean:
	rm *.hi *.o Main *.ppm *.png .tempimg.ppm

imgclean:
	rm *.ppm *.png .tempimg.ppm

run:
	./Main script
