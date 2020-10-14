#!/bin/sh
rm -rf csrc/ simv.vdb/ simv.daidir/ simv;
vcs -sverilog -lca -debug_access+all -y $VCS_HOME/packages/sva +libext+.v \
		+incdir+$VCS_HOME/packages/sva -P /home/disk/Verdi3_L-2016.06-1/share/PLI/VCS/LINUX64/novas.tab \
								/home/disk/Verdi3_L-2016.06-1/share/PLI/VCS/LINUX64/pli.a -full64 +libext+.v+.h+.vh+.vlib -kdb +vcs+vcdpluson -l comp.log -timescale=1ns/1ps -F files.f top_tb.sv $*
