rem 执行改批处理前先要目录下创建font_properties文件 

echo Run Tesseract for Training.. 
tesseract.exe n1.font.exp0.tif n1.font.exp0 nobatch box.train
tesseract.exe n2.font.exp0.tif n2.font.exp0 nobatch box.train 
tesseract.exe n3.font.exp0.tif n3.font.exp0 nobatch box.train 
tesseract.exe n4.font.exp0.tif n4.font.exp0 nobatch box.train 
tesseract.exe n4.font.exp0.tif n5.font.exp0 nobatch box.train 

 
echo Compute the Character Set.. 

unicharset_extractor.exe n1.font.exp0.box n2.font.exp0.box n3.font.exp0.box n4.font.exp0.box n5.font.exp0.box

mftraining -F font_properties -U unicharset -O num.unicharset n1.font.exp0.tr n2.font.exp0.tr n3.font.exp0.tr n4.font.exp0.tr n5.font.exp0.tr


echo Clustering.. 
cntraining.exe n1.font.exp0.tr n2.font.exp0.tr n3.font.exp0.tr n4.font.exp0.tr n5.font.exp0.tr

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