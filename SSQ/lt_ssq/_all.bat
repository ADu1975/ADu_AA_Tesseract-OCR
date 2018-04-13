rem 执行改批处理前先要目录下创建font_properties文件 

echo Run Tesseract for Training.. 
tesseract.exe 1_single.font.exp0.tif 1_single.font.exp0 nobatch box.train
tesseract.exe 2_fushi_1.font.exp0.tif 2_fushi_1.font.exp0 nobatch box.train 
tesseract.exe 2_fushi_1.font.exp0.tif 3_fushi_2.font.exp0 nobatch box.train 
tesseract.exe 4_dantuo.font.exp0.tif 4_dantuo.font.exp0 nobatch box.train 

 
echo Compute the Character Set.. 

unicharset_extractor.exe 1_single.font.exp0.box 2_fushi_1.font.exp0.box 3_fushi_1.font.exp0.box 4_dantuo.font.exp0.box

mftraining -F font_properties -U unicharset -O num.unicharset 1_single.font.exp0.tr 2_fushi_1.font.exp0.tr 3_fushi_2.font.exp0.tr 4_dantuo.font.exp0.tr


echo Clustering.. 
cntraining.exe 1_single.font.exp0.tr 2_fushi_1.font.exp0.tr 3_fushi_2.font.exp0.tr 4_dantuo.font.exp0.tr

echo Rename Files.. 
rename normproto num.normproto 
rename inttemp num.inttemp 
rename pffmtable num.pffmtable 
rename shapetable num.shapetable  

echo Create Tessdata.. 
combine_tessdata.exe num. 

del lt_ssq.traineddata 
rename num.traineddata lt_ssq.traineddata



echo delete file...
del normproto num.normproto 
del inttemp num.inttemp 
del pffmtable num.pffmtable 
del shapetable num.shapetable 

echo. & pause