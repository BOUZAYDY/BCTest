VERSION 5.00
Begin VB.Form Form1 
   Caption         =   "Form1"
   ClientHeight    =   3030
   ClientLeft      =   120
   ClientTop       =   450
   ClientWidth     =   4560
   LinkTopic       =   "Form1"
   ScaleHeight     =   3030
   ScaleWidth      =   4560
   StartUpPosition =   3  '�t�ιw�]��
   Begin VB.CommandButton Command1 
      Caption         =   "Command1"
      Height          =   555
      Left            =   1260
      TabIndex        =   0
      Top             =   960
      Width           =   1695
   End
End
Attribute VB_Name = "Form1"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
' ###################################################################################
' Barcode Encoder/Decoder VB6 �d�ҵ{��
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
' * �����W�z�B�J�A�N������(Project1.exe) �P KwBarcode.dll ��m��P�@�ؿ��U�Y�i���`����C
'
' * �}�o�̳]�w:
'       ���->�M��->�]�w�ޥζ���->�s��->KwBarcode.tlb (�d�ߤ�k: �˵�->�s������->�j�M BarcodeCore)
'       �N KwBarcode.dll ��m�� D:\GlobalDll
'       �s�� Windows �����ܼơA�N D:\GlobalDll �s�W�� PATH �ܼƤ� (�����涥�q�i�H Access �� KwBarcode.dll)
'       ���U KwBarcode.dll �ܨt�Τ�
'
' ###################################################################################

Option Explicit

Private Sub Command1_Click()

    Dim BCCore As New BarcodeCore
    Dim Bits(), Values() As Variant
    Dim oValues() As Long
    Dim Barcodes() As String
    Dim iTestName, iTestName2, oTestName, oTestName2 As String
    Dim f1, f2 As Single
    Dim i As Integer
    
    iTestName = "A-01" ' 4�X�^�Ʀr�t���I�Ÿ� bit = 28
    iTestName2 = "TEST" ' 4�X�^�Ʀr bit = 24
    f1 = -1.23 ' �B�I�� bit = 32
    
    ' ###################################################################################
    ' #                              ��J�ȳ]�w�� (�}�l)                                #
    
    ' ��J�� bit �j�p�C��
    ' Bit List (0-7, 0-7, 0-15, 0-255, 0-255, 4�X�^�Ʀr�t���I�Ÿ�, �B�I��, 4�X�^�Ʀr)
    Bits = Array( _
        3, _
        3, _
        4, _
        8, _
        8, _
        28, _
        32, _
        24 _
        )
    
    ' ��J�ȦC�� (�ȻݲŦX bit ����ƽd��A�_�h Encode ��Ǧ^�ȷ|����)
    ' ��r���� BarcodeCore.textToInt (24-bit), BarcodeCore.text128ToInt (28-bit)
    ' �B�I������ BarcodeCore.floatToInt
    Values = Array( _
        7, _
        4, _
        10, _
        200, _
        150, _
        BCCore.text128ToInt(iTestName), _
        BCCore.floatToInt(f1), _
        BCCore.textToInt(iTestName2) _
        )

    ' #                              ��J�ȳ]�w�� (����)                                #
    ' ###################################################################################
    
    ' �I�sBarcode�s�X�禡�A�^�ǽs�X�᪺Barcode (String Array, 10�X/string)
    ' �Y��J�Ȯ榡���~�A�^�ǭȱN����
    Barcodes = initBarcodeEncode(Bits, Values)
    
'    Dim BitsL(7) As Long
'    Dim ValuesL(7) As Long
'    For i = 0 To UBound(Bits)
'        BitsL(i) = CLng(Bits(i))
'        ValuesL(i) = CLng(Values(i))
'    Next
'    Barcodes = initBarcodeEncode2(BitsL, ValuesL)
        
    
    Dim mBarcodes As String
    
    On Error GoTo Err1
    mBarcodes = ""
    For i = 0 To UBound(Barcodes)
        mBarcodes = mBarcodes + Barcodes(i)
    Next
    

    ' �I�s Barcode �ѽX�禡�A�^�ǸѽX�᪺�ƭ� (Long Array)
    ' oValues = initBarcodeDecode(Barcodes, Bits)
    oValues = initBarcodeDecode2(mBarcodes, Bits)
    
    ' �ѽX���G��X
    Dim blockNumber As Integer
    blockNumber = UBound(Barcodes) + 1
    
    ' �����^��r BarcodeCore.intToText, BarcodeCore.intToText128
    oTestName = BCCore.intToText128(oValues(5))
    oTestName2 = BCCore.intToText(oValues(7))
    ' �����^�B�I�� BarcodeCore.intToFloat
    f2 = BCCore.intToFloat(oValues(6))
    
    
    ' ���յ��G�T��
    MsgBox ( _
        "Barcodes(" + CStr(blockNumber) + " Blocks): " + mBarcodes + _
        vbCrLf + _
        "IN: " + _
        CStr(Values(0)) + " / " + _
        CStr(Values(1)) + " / " + _
        CStr(Values(2)) + " / " + _
        CStr(Values(3)) + " / " + _
        CStr(Values(4)) + " / " + _
        iTestName + " / " + _
        iTestName2 + " / " + _
        CStr(f1) + _
        vbCrLf + _
        "OUT: " + _
        CStr(oValues(0)) + " / " + _
        CStr(oValues(1)) + " / " + _
        CStr(oValues(2)) + " / " + _
        CStr(oValues(3)) + " / " + _
        CStr(oValues(4)) + " / " + _
        oTestName + " / " + _
        oTestName2 + " / " + _
        CStr(f2))
    Exit Sub
    
Err1:
    MsgBox ("�榡���~!")

End Sub

'#########################################################################################################
'#  APIs                                                                                                 #
'#  Private Function initBarcodeEncode(BitLists() As Variant, ValueLists() As Variant) As String()       #
'#  Private Function initBarcodeEncode2(BitLists() As Long, ValueLists() As Long) As String()            #
'#  Private Function initBarcodeDecode(Barcodes() As String, BitLists() As Variant) As Long()            #
'#  Private Function initBarcodeDecode2(BarcodeStrings As String, BitLists() As Variant) As Long()       #
'#                                                                                                       #
'#########################################################################################################

Private Function initBarcodeEncode(BitLists() As Variant, ValueLists() As Variant) As String()
    If UBound(BitLists) <> UBound(ValueLists) Then
        MsgBox ("��ƪ��פ��@�P")
        Exit Function
    End If
    
    Dim i As Integer
    Dim Obj As New BarcodeCore
    
    For i = 0 To UBound(BitLists)
        Obj.addBit (BitLists(i))
        Obj.addValue (ValueLists(i))
    Next
    
    Obj.initBarcodeEncoder
    
    On Error GoTo LErr
    
    initBarcodeEncode = Obj.Barcodes
    
LErr:

End Function

Private Function initBarcodeEncode2(BitLists() As Long, ValueLists() As Long) As String()
    If UBound(BitLists) <> UBound(ValueLists) Then
        MsgBox ("��ƪ��פ��@�P")
        Exit Function
    End If
    
    Dim i As Integer
    Dim Obj As New BarcodeCore
    
    For i = 0 To UBound(BitLists)
        Obj.addBit (BitLists(i))
        Obj.addValue (ValueLists(i))
    Next
    
    Obj.initBarcodeEncoder
    
    On Error GoTo LErr
    
    initBarcodeEncode2 = Obj.Barcodes
    
LErr:

End Function


Private Function initBarcodeDecode(Barcodes() As String, BitLists() As Variant) As Long()

    Dim Obj As New BarcodeCore
    Dim i As Integer
    For i = 0 To UBound(Barcodes)
        Obj.addBarcode (Barcodes(i))
    Next
    For i = 0 To UBound(BitLists)
        Obj.addBit (BitLists(i))
    Next
    Obj.initBarcodeDecoder
    initBarcodeDecode = Obj.outValues
    
End Function

Private Function initBarcodeDecode2(BarcodeStrings As String, BitLists() As Variant) As Long()
    Dim Barcodes() As String
    Dim Obj As New BarcodeCore
    Obj.setBarcodes (BarcodeStrings)
    initBarcodeDecode2 = initBarcodeDecode(Obj.Barcodes, BitLists)
End Function
