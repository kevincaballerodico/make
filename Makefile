CC		= gcc
CFLAGS	= -Wall -g
IDIR	= -Idummy

VPATH	= src:dummy:obj
ODIR	= obj
BLD		= build

DEPS	= dummy.h
OBJP	= main.o dummy.o
OBJR	= $(patsubst %,$(ODIR)/%,$(OBJP))

APP		= app

.PHONY: directories
.PHONY: clean

all: directories $(APP)

$(APP): $(OBJP) 
	$(CC) -o $(BLD)/$@ $(OBJR) $(CFLAGS)

%.o: %.c $(DEPS)
	$(CC) $(IDIR) -c -o $(ODIR)/$@ $< $(CFLAGS)

directories:
	mkdir -p $(ODIR)
	mkdir -p $(BLD)

clean:
	rm -rf $(ODIR)/*.o
	rm -f $(APP)