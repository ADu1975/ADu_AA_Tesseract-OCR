rem jTessBoxEditor��ѡ��tools->merge tif ,ѡ�� tifͼƬ������һ�� ��ʽΪtif�� ͼƬ��
start /wait java -jar D:\jTessBoxEditorFX\jTessBoxEditorFX.jar

rem ���ɶ�Ӧ�� .box �ļ�
tesseract.exe n1.font.exp0.tif n1.font.exp0 batch.nochop makebox

rem  jTessBoxEditor������ʶ�����ֵ�λ�á����
start /wait java -jar D:\jTessBoxEditorFX\jTessBoxEditorFX.jar

rem ����.tr�ļ�
start /wait tesseract n1.font.exp0.tif n1.font.exp0 nobatch box.train   
 
echo. & pause

