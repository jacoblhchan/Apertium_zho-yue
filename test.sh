declare -a sentences=("他是姐姐"
			"在公共汽车"
			"下午在教室"
			"小孩儿自行车")


for sent in "${sentences[@]}"
do
	echo -e ${sent}$"\t\t"$(echo ${sent} | lt-proc zho-yue.automorf.bin |   gawk 'BEGIN{RS="$"; FS="/";}{nf=split($1,COMPONENTS,"^"); for(i = 1; i<nf; i++) printf COMPONENTS[i]; if($2 != "") printf("^%s$",$2);}' |   apertium-transfer apertium-zho-yue.zho-yue.t1x zho-yue.t1x.bin zho-yue.autobil.bin  |   lt-proc -g zho-yue.autogen.bin)
done
