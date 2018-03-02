CC		= gcc
CFLAGS	= -Wall -g
IDIR	= -Idummy

VPATH	= src:dummy:objects

ODIR	= objects
BDIR	= bin
TDIR	= reports

DEPS	= dummy.h
OBJP	= main.o dummy.o
OBJR	= $(patsubst %,$(ODIR)/%,$(OBJP))

APP		= app

TESTS 	= valgrind

.PHONY: build
.PHONY: clean
.PHONY: test
.PHONY: valgrind

build: $(APP)

$(APP): $(OBJP)
	mkdir -p $(BDIR)
	$(CC) -o $(BDIR)/$@ $(OBJR) $(CFLAGS)

%.o: %.c $(DEPS)
	mkdir -p $(ODIR)
	$(CC) $(IDIR) -c -o $(ODIR)/$@ $< $(CFLAGS)

clean:
	rm -rf $(ODIR)/*.o
	rm -f $(APP)

test: $(TESTS)

valgrind:
	mkdir -p $(TDIR)/^@
	bash resources/scripts/^@-tests.sh ^@ $(BDIR)/$(APP) 65