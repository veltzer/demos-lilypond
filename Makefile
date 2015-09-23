##############
# parameters #
##############
# should we show commands executed ?
DO_MKDBG:=0

########
# vars #
########
SRC:=$(shell find src -name "*.ly")
TGT:=$(addsuffix .pdf, $(basename $(SRC)))
ALL:=$(TGT)

ifeq ($(DO_MKDBG),1)
Q=
# we are not silent in this branch
else # DO_MKDBG
Q=@
#.SILENT:
endif # DO_MKDBG

#########
# rules #
#########
.PHONY: all
all: $(ALL)
	$(info doing [$@])

.PHONY: clean
clean:
	$(info doing [$@])
	@rm -f */*.pdf */*.midi */*.ps

$(TGT): %.pdf: %.ly
	$(info doing [$@])
	$(Q)scripts/wrapper_lilypond.py $(dir $@)$(basename $(notdir $@)).ps $(dir $@)$(basename $(notdir $@)).pdf $(dir $@)$(basename $(notdir $@)) $<

.PHONY: debug
debug:
	$(info SRC is $(SRC))
	$(info TGT is $(TGT))
