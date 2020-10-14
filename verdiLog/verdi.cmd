debImport "-i" "-simflow" "-simBin" "./simv" "-simOpt" " "
srcTBInvokeSim
verdiWindowResize -win $_Verdi_1 -2 "25" "1916" "851"
srcDeselectAll -win $_nTrace1
srcSelect -inst "th" -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -inst "th" -win $_nTrace1
srcAction -pos 22 3 1 -win $_nTrace1 -name "th" -ctrlKey off
srcDeselectAll -win $_nTrace1
srcSelect -win $_nTrace1 -signal "memw_if_0.memclk" -line 69 -pos 1
srcDeselectAll -win $_nTrace1
srcSelect -signal "clk" -win $_nTrace1
wvCreateWindow
srcAddSelectedToWave -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "nreset" -win $_nTrace1
srcAddSelectedToWave -win $_nTrace1
srcTBRunSim -opt {100n}
srcTBRunSim
debExit
