main: Main.hs Parse.hs Transform.hs Line.hs Solids.hs
	ghc -dynamic -O -O2 Main.hs

clean:
	rm *.hi *.o Main *.ppm *.png

imgclean:
	rm *.ppm *.png

run:
	./Main script
