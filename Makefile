## This is lecturePix
## Bring together shared webpix and my_images to a central place.
## my_images remains problematic for sharing, I think.

current: target
-include target.mk
Ignore = target.mk

vim_session:
	bash -ic "vmt"

-include makestuff/perl.def

######################################################################

## Bring in stuff from 3SS, this should be organized later

## 3SS.html: 3SS.step

## Pictures for usLectures/philosophy, copied from statsTalks
## statsTalks.html: statsTalks.step

######################################################################

## This is a service directory now? 
## These stamps could clash, but that would just mean extra auto-pulling
## Could also prevent makes when travelling….
## The answer is probably to move stamps to the parent directory
## I was probably scared of bolker when I designed them

Ignore += *.stamp

######################################################################

### Makestuff

Sources += Makefile

Ignore += makestuff
msrepo = https://github.com/dushoff

## ln -s ../makestuff . ## Do this first if you want a linked makestuff
Makefile: makestuff/00.stamp
makestuff/%.stamp: | makestuff
	- $(RM) makestuff/*.stamp
	cd makestuff && $(MAKE) pull
	touch $@
makestuff:
	git clone --depth 1 $(msrepo)/makestuff

-include makestuff/os.mk

## -include makestuff/pipeR.mk
-include makestuff/webpix.mk
-include makestuff/mirror.mk

-include makestuff/git.mk
-include makestuff/visual.mk
