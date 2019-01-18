FC = gfortran

CFLAGS = -g -O0 -fbounds-check -ffree-line-length-none -cpp

all: run

%.o: %.f90
	$(FC) $(CFLAGS) -c $<
#	mv $@ .obj

run:  m_progress_bar.o main.o
	$(FC) $(CFLAGS) $^ -o $@  $(LDFLAG)

clean:
	rm -f *.o *.mod *~ run
