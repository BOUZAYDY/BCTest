' ###################################################################################
' QRCode Encoder/Decoder VB6 �d�ҵ{��
'
' * �ݦw�� .NET Framework 2.0 (�q�`����s�L�� XP �ݭn�AXP�H�W���t�ΰ򥻤W���w����)
' * �ݵ��U KwBarcode.dll �ܨt�Τ�
'   [��k1: �ϥ� Reg File ���U]
'       32-bit OS: ���� KwBarcode_Reg_32bit.reg
'       64-bit OS: ���� KwBarcode_Reg_64bit.reg
'
'   [��k2: ��ʵ��U��k]
'       ��R�O���ܦr��(cmd.exe) ��J�U�����R�O (�Y�ϥ� Win7/Vista�A�ݨϥΨt�κ޲z�������}�ҩR�O���ܦr��)
'           RegAsm KwBarcode.dll
'
'   [��ʸѰ� KwBarcode.dll ���U��k]
'       ��R�O���ܦr��(cmd.exe) ��J�U�����R�O (�Y�ϥ� Win7/Vista�A�ݨϥΨt�κ޲z�������}�ҩR�O���ܦr��)
'           RegAsm KwBarcode.dll /u
'
' * �����W�z�B�J�A�N������(Project1.exe) �P KwBarcode.dll, zxing.dll ��m��P�@�ؿ��U�Y�i���`����C
'
' * �}�o�̳]�w:
'       ���->�M��->�]�w�ޥζ���->�s��->KwBarcode.tlb (�d�ߤ�k: �˵�->�s������->�j�M KwQRCodeReader, KwQRCodeWriter)
'       �N KwBarcode.dll, zxing.dll ��m�� D:\GlobalDll
'       �s�� Windows �����ܼơA�N D:\GlobalDll �s�W�� PATH �ܼƤ� (�����涥�q�i�H Access �� KwBarcode.dll, zxing.dll)
'       ���U KwBarcode.dll �ܨt�Τ�
'
' * Comdlg.ocx not registered issue:
'       �N Comdlg32.ocx copy �� C:\Windows\System32\ ��Ƨ�
'       ���� regsvr32 %SystemRoot%\System32\comdlg32.ocx (�n�����Τ]�i�H)
'
' ###################################################################################