SUBDIRS:=GSTCocoa

all: $(SUBDIRS)

$(SUBDIRS):
	$(MAKE) -C $@

.PHONY: all $(SUBDIRS)

run:
	gst Mandelbrot.st