all : zho-yue.automorf.bin \
      zho-yue.autogen.bin \
      zho-yue.autobil.bin \
      zho-yue.t1x.bin \
      yue-zho.automorf.bin \
      yue-zho.autogen.bin \
      yue-zho.autobil.bin

zho-yue.automorf.bin : apertium-zho.zho.dix
	lt-comp lr apertium-zho.zho.dix zho-yue.automorf.bin

zho-yue.autogen.bin : apertium-yue.yue.dix
	lt-comp rl apertium-yue.yue.dix zho-yue.autogen.bin

yue-zho.automorf.bin : apertium-yue.yue.dix
	lt-comp lr apertium-yue.yue.dix yue-zho.automorf.bin

yue-zho.autogen.bin : apertium-zho.zho.dix
	lt-comp rl apertium-zho.zho.dix yue-zho.autogen.bin

zho-yue.autobil.bin : apertium-zho-yue.zho-yue.dix
	lt-comp lr apertium-zho-yue.zho-yue.dix zho-yue.autobil.bin

yue-zho.autobil.bin : apertium-zho-yue.zho-yue.dix
	lt-comp rl apertium-zho-yue.zho-yue.dix yue-zho.autobil.bin

zho-yue.t1x.bin : apertium-zho-yue.zho-yue.t1x
	apertium-preprocess-transfer apertium-zho-yue.zho-yue.t1x zho-yue.t1x.bin

.PHONY : clean
clean :
	-rm *.bin

.PHONY : check
check :
	bash tests.sh
