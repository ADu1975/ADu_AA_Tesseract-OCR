rem jTessBoxEditor，选择tools->merge tif ,选择 tif图片，生成一个 格式为tif的 图片集
start /wait java -jar D:\jTessBoxEditorFX\jTessBoxEditorFX.jar

rem 生成对应的 .box 文件
tesseract.exe 3_fushi_2.font.exp0.tif 3_fushi_2.font.exp0 batch.nochop makebox

rem  jTessBoxEditor来调整识别文字的位置、结果
start /wait java -jar D:\jTessBoxEditorFX\jTessBoxEditorFX.jar

rem 生成.tr文件
start /wait tesseract 3_fushi_2.font.exp0.tif 3_fushi_2.font.exp0 nobatch box.train   
 
echo. & pause

