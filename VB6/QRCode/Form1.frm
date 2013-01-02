VERSION 5.00
Object = "{F9043C88-F6F2-101A-A3C9-08002B2F49FB}#1.2#0"; "comdlg32.ocx"
Begin VB.Form Form1 
   Caption         =   "Form1"
   ClientHeight    =   3030
   ClientLeft      =   120
   ClientTop       =   450
   ClientWidth     =   9630
   LinkTopic       =   "Form1"
   ScaleHeight     =   3030
   ScaleWidth      =   9630
   StartUpPosition =   3  '�t�ιw�]��
   Begin VB.CommandButton Command2 
      Caption         =   "Generate QRCode"
      Height          =   435
      Left            =   7800
      TabIndex        =   3
      Top             =   2460
      Width           =   1695
   End
   Begin VB.TextBox Text1 
      Height          =   375
      Left            =   360
      TabIndex        =   2
      Text            =   "Kaiwood QRCode Test"
      Top             =   2460
      Width           =   7215
   End
   Begin MSComDlg.CommonDialog CommonDialog2 
      Left            =   9120
      Top             =   0
      _ExtentX        =   847
      _ExtentY        =   847
      _Version        =   393216
   End
   Begin MSComDlg.CommonDialog CommonDialog1 
      Left            =   8520
      Top             =   0
      _ExtentX        =   847
      _ExtentY        =   847
      _Version        =   393216
   End
   Begin VB.CommandButton Command1 
      Caption         =   "Open QRCode Image"
      Height          =   1095
      Left            =   360
      TabIndex        =   0
      Top             =   180
      Width           =   1995
   End
   Begin VB.Label Label1 
      Height          =   555
      Left            =   420
      TabIndex        =   1
      Top             =   1560
      Width           =   8595
   End
End
Attribute VB_Name = "Form1"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
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
'       �N KwBarcode.dll, zxing.dll ��m��ۦP�ؿ��U
'       �Hcodebase�覡 ���U KwBarcode.dll �ܨt�Τ�
'       RegAsm KwBarcode.dll /codebase
'
' * Comdlg.ocx not registered issue:
'       �N Comdlg32.ocx copy �� C:\Windows\System32\ ��Ƨ�
'       ���� regsvr32 %SystemRoot%\System32\comdlg32.ocx (�n�����Τ]�i�H)
'
' ###################################################################################

Option Explicit

Private Sub Command1_Click()
    ' QRCode Reader
    
    ' Open file Dialog
    With CommonDialog1
        .FileName = ""
        .Filter = "BMP JPEG Files (*.bmp, *.jpg) |*.bmp;*.jpeg;*.jpg|All files (*.*) |*.*|"
        .ShowOpen
    End With
    If CommonDialog1.FileName = "" Then Exit Sub
    
    ' QRCode Reader
    Dim obj As New KwQRCodeReader
    obj.FilePath = CommonDialog1.FileName
    
    ' �ѽX function ���G�x�s�� obj.text ��
    ' Byte ����x�s�� obj.RawByte (Byte Array)
    obj.decode
    Label1.Caption = obj.text

End Sub

Private Sub Command2_Click()
    ' QRCode ���;�
    
    Dim text As String
    text = Text1.text
    
    ' Save File Dialog
    With CommonDialog2
        .FileName = ""
        .Filter = "BMP Files (*.bmp) |*.bmp"
        .ShowOpen
    End With
    If CommonDialog2.FileName = "" Then Exit Sub
    
    'QRCode Writer ����
    Dim obj As New KwQRCodeWriter
    Dim path As String
    path = CommonDialog2.FileName
    
    ' ���� QRCode �æs������
    Call obj.encodeAndSave(text, path)

End Sub
