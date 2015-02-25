prefix = $(shell pwd)

CC = mpicc
CFLAGS = -fPIC

mumps_prefix = /usr/local
mumps_incdir = $(mumps_prefix)/include
mumps_libdir = $(mumps_prefix)/lib
mumps_libs   = -L$(mumps_libdir) -lsmumps -ldmumps -lcmumps -lzmumps -lmumps_common -lpord

scalapack_libdir = /usr/local/lib
scalapack_libs   = -L$(scalapack_libdir) -lscalapack

scotch_libdir =
scotch_libs =

metis_libdir =
metis_libs =

parmetis_libdir =
parmetis_libs =

blas_libdir =
blas_libs = -lblas -llapack

src = mumps_simple.c
debug_flag = #-DJMUMPS_DEBUG
lib = $(mumps_libs) $(scotch5_libs) $(scotch_libs) $(metis_libs) $(parmetis_libs) $(blas_libs) $(scalapack_libs) -ldl

ifeq ($(strip $(shell uname)),Darwin)
	soname = dylib
	makeso = $(CC) -dynamiclib -undefined dynamic_lookup -Wl,-install_name -Wl,$(prefix)/lib/libmumps_simple.$(soname)
else
	soname = so
	makeso = $(CC) -shared -Wl,-soname -Wl,libmumps_simple.$(soname)
endif

%.o: %.c
	$(CC) $(CFLAGS) -c $(debug_flag) -I$(mumps_incdir) $<

all: ${src:.c=.o}
	$(makeso) $< -o libmumps_simple.$(soname) $(lib)

install:
	mkdir -p $(prefix)/lib
	mkdir -p $(prefix)/include
	cp libmumps_simple.$(soname) $(prefix)/lib
	cp mumps_simple.h $(prefix)/include

clean:
	rm -f $(prefix)/*.o

veryclean: clean
	rm -f $(prefix)/lib/libmumps_simple.$(soname)
