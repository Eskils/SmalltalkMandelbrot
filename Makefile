SUBDIRS:=GSTCocoa

all: $(SUBDIRS)

$(SUBDIRS):
	$(MAKE) -C $@

.PHONY: all $(SUBDIRS)

clean: $(SUBDIRS)
	$(MAKE) -C $? clean

run:
	gst Mandelbrot.st