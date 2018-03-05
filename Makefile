CC		= gcc
CFLAGS	= -Wall -g
IDIR	= -Idummy

VPATH	= src:dummy:objects

ODIR	= objects
BDIR	= bin
TDIR	= reports
SDIR	= resources/scripts

DEPS	= dummy.h
OBJP	= main.o dummy.o
OBJR	= $(patsubst %,$(ODIR)/%,$(OBJP))

APP		= app

TESTS 	= valgrind

.PHONY: build
build: $(APP)

$(APP): $(OBJP)
	mkdir -p $(BDIR)
	$(CC) -o $(BDIR)/$@ $(OBJR) $(CFLAGS)

%.o: %.c $(DEPS)
	mkdir -p $(ODIR)
	$(CC) $(IDIR) -c -o $(ODIR)/$@ $< $(CFLAGS)

.PHONY: test
test: $(TESTS)

valgrind:
	mkdir -p $(TDIR)/$@
	./$(SDIR)/$@-tests.sh $(TDIR)/$@ $(BDIR)/$(APP) 65

.PHONY: clean
clean:
	rm -rf $(ODIR)
	rm -rf $(BDIR)