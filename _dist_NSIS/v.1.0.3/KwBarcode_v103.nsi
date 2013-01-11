; �Ӹ}���ϥ� HM VNISEdit �}���s�边�Q�ɲ���

; �w�˵{�Ǫ�l�w�q�`�q
!define PRODUCT_NAME "Kaiwood Barcode"
!define PRODUCT_VERSION "1.0.3"
!define PRODUCT_PUBLISHER "Kaiwood"
!define PRODUCT_WEB_SITE "http://www.kaiwood.com"
!define PRODUCT_UNINST_KEY "Software\Microsoft\Windows\CurrentVersion\Uninstall\${PRODUCT_NAME}"
!define PRODUCT_UNINST_ROOT_KEY "HKLM"

!define KEY_UNINST_HEAD_ROOT_X86 "HKCR"
!define KEY_UNINST_ROOT_X86 "HKCR"
!define KEY_UNINST_QR_WRITER_HEAD_X86 "KwQRCodeWriter"
!define KEY_UNINST_QR_WRITER_X86 "CLSID\{69F37639-F632-433F-AA01-1BC326FD1D6F}"
!define KEY_UNINST_QR_READER_HEAD_X86 "KwQRCodeReader"
!define KEY_UNINST_QR_READER_X86 "CLSID\{3E73EE86-F46D-411D-BE6F-87060B7E6E6A}"
!define KEY_UNINST_BARCODE_HEAD_X86 "BarcodeCore"
!define KEY_UNINST_BARCODE_X86 "CLSID\{7C6D4FCD-073B-4585-943F-BCF0BB6404FD}"

!define KEY_UNINST_HEAD_ROOT_X64 "HKLM"
!define KEY_UNINST_ROOT_X64 "HKCR"
!define KEY_UNINST_QR_WRITER_HEAD_X64 "SOFTWARE\Classes\KwQRCodeWriter"
!define KEY_UNINST_QR_WRITER_X64 "Wow6432Node\${KEY_UNINST_QR_WRITER_X86}"
!define KEY_UNINST_QR_READER_HEAD_X64 "SOFTWARE\Classes\KwQRCodeReader"
!define KEY_UNINST_QR_READER_X64 "Wow6432Node\${KEY_UNINST_QR_READER_X86}"
!define KEY_UNINST_BARCODE_HEAD_X64 "SOFTWARE\Classes\BarcodeCore"
!define KEY_UNINST_BARCODE_X64 "Wow6432Node\${KEY_UNINST_BARCODE_X86}"

SetCompressor lzma

; ------ MUI �{�N�ɭ��w�q (1.67 �����H�W�ݮe) ------
!include "MUI.nsh"
!include "x64.nsh"

; MUI �w�w�q�`�q
!define MUI_ABORTWARNING
!define MUI_ICON "${NSISDIR}\Contrib\Graphics\Icons\modern-install.ico"
!define MUI_UNICON "${NSISDIR}\Contrib\Graphics\Icons\modern-uninstall.ico"

; �w�ﭶ��
!insertmacro MUI_PAGE_WELCOME
; �w�˹L�{����
!insertmacro MUI_PAGE_INSTFILES
; �w�˧�������
!insertmacro MUI_PAGE_FINISH

; �w�˨����L�{����
!insertmacro MUI_UNPAGE_INSTFILES

; �w�ˬɭ��]�t���y���]�m
!insertmacro MUI_LANGUAGE "English"

; �w�˹w������
!insertmacro MUI_RESERVEFILE_INSTALLOPTIONS
; ------ MUI �{�N�ɭ��w�q���� ------

Name "${PRODUCT_NAME}"
OutFile "KwBarcode_v103.exe"
InstallDir "$PROGRAMFILES\Kaiwood\Barcode\v.1.0.3"
ShowInstDetails show
ShowUnInstDetails show

Section "Main" SEC01
  SetOutPath "$INSTDIR"
  SetOverwrite ifnewer
  File "zxing.dll"
  File "KwBarcode.dll"
SectionEnd

;Section -AdditionalIcons
;  CreateDirectory "$SMPROGRAMS\Kaiwood\Barcode\v.1.0.3"
;  CreateShortCut "$SMPROGRAMS\Kaiwood\Barcode\v.1.0.3\Uninstall.lnk" "$INSTDIR\uninst.exe"
;SectionEnd

Section -Post
        WriteUninstaller "$INSTDIR\uninst.exe"
        WriteRegStr ${PRODUCT_UNINST_ROOT_KEY} "${PRODUCT_UNINST_KEY}" "DisplayName" "$(^Name)"
        WriteRegStr ${PRODUCT_UNINST_ROOT_KEY} "${PRODUCT_UNINST_KEY}" "UninstallString" "$INSTDIR\uninst.exe"
        WriteRegStr ${PRODUCT_UNINST_ROOT_KEY} "${PRODUCT_UNINST_KEY}" "DisplayVersion" "${PRODUCT_VERSION}"
        WriteRegStr ${PRODUCT_UNINST_ROOT_KEY} "${PRODUCT_UNINST_KEY}" "URLInfoAbout" "${PRODUCT_WEB_SITE}"
        WriteRegStr ${PRODUCT_UNINST_ROOT_KEY} "${PRODUCT_UNINST_KEY}" "Publisher" "${PRODUCT_PUBLISHER}"
        ${If} ${RunningX64}
        	WriteRegStr   HKLM "${KEY_UNINST_QR_WRITER_HEAD_X64}" "" "KwBarcode.KwQRCodeWriter"
        	WriteRegStr   HKLM "${KEY_UNINST_QR_WRITER_HEAD_X64}\CLSID" "" "{69F37639-F632-433F-AA01-1BC326FD1D6F}"
        	WriteRegStr   HKCR "${KEY_UNINST_QR_WRITER_X64}" "" "KwBarcode.KwQRCodeWriter"
        	WriteRegStr   HKCR "${KEY_UNINST_QR_WRITER_X64}\InprocServer32" "" "mscoree.dll"
        	WriteRegStr   HKCR "${KEY_UNINST_QR_WRITER_X64}\InprocServer32" "ThreadingModel" "Both"
        	WriteRegStr   HKCR "${KEY_UNINST_QR_WRITER_X64}\InprocServer32" "Class" "KwBarcode.KwQRCodeWriter"
        	WriteRegStr   HKCR "${KEY_UNINST_QR_WRITER_X64}\InprocServer32" "Assembly" "KwBarcode, Version=1.0.3.0, Culture=neutral, PublicKeyToken=1ae9e675a4cd0779"
        	WriteRegStr   HKCR "${KEY_UNINST_QR_WRITER_X64}\InprocServer32" "RuntimeVersion" "v2.0.50727"
        	WriteRegStr   HKCR "${KEY_UNINST_QR_WRITER_X64}\InprocServer32" "CodeBase" "$INSTDIR\kwbarcode.dll"
        	WriteRegStr   HKCR "${KEY_UNINST_QR_WRITER_X64}\InprocServer32\1.0.3.0" "Class" "KwBarcode.KwQRCodeWriter"
        	WriteRegStr   HKCR "${KEY_UNINST_QR_WRITER_X64}\InprocServer32\1.0.3.0" "Assembly" "KwBarcode, Version=1.0.3.0, Culture=neutral, PublicKeyToken=1ae9e675a4cd0779"
        	WriteRegStr   HKCR "${KEY_UNINST_QR_WRITER_X64}\InprocServer32\1.0.3.0" "RuntimeVersion" "v2.0.50727"
        	WriteRegStr   HKCR "${KEY_UNINST_QR_WRITER_X64}\InprocServer32\1.0.3.0" "CodeBase" "$INSTDIR\kwbarcode.dll"
        	WriteRegStr   HKCR "${KEY_UNINST_QR_WRITER_X64}\ProgId" "" "KwQRCodeWriter"
        	WriteRegStr   HKLM "${KEY_UNINST_QR_READER_HEAD_X64}" "" "KwBarcode.KwQRCodeReader"
        	WriteRegStr   HKLM "${KEY_UNINST_QR_READER_HEAD_X64}\CLSID" "" "{3E73EE86-F46D-411D-BE6F-87060B7E6E6A}"
        	WriteRegStr   HKCR "${KEY_UNINST_QR_READER_X64}" "" "KwBarcode.KwQRCodeReader"
        	WriteRegStr   HKCR "${KEY_UNINST_QR_READER_X64}\InprocServer32" "" "mscoree.dll"
        	WriteRegStr   HKCR "${KEY_UNINST_QR_READER_X64}\InprocServer32" "ThreadingModel" "Both"
        	WriteRegStr   HKCR "${KEY_UNINST_QR_READER_X64}\InprocServer32" "Class" "KwBarcode.KwQRCodeReader"
        	WriteRegStr   HKCR "${KEY_UNINST_QR_READER_X64}\InprocServer32" "Assembly" "KwBarcode, Version=1.0.3.0, Culture=neutral, PublicKeyToken=1ae9e675a4cd0779"
        	WriteRegStr   HKCR "${KEY_UNINST_QR_READER_X64}\InprocServer32" "RuntimeVersion" "v2.0.50727"
        	WriteRegStr   HKCR "${KEY_UNINST_QR_READER_X64}\InprocServer32" "CodeBase" "$INSTDIR\kwbarcode.dll"
        	WriteRegStr   HKCR "${KEY_UNINST_QR_READER_X64}\InprocServer32\1.0.3.0" "Class" "KwBarcode.KwQRCodeReader"
        	WriteRegStr   HKCR "${KEY_UNINST_QR_READER_X64}\InprocServer32\1.0.3.0" "Assembly" "KwBarcode, Version=1.0.3.0, Culture=neutral, PublicKeyToken=1ae9e675a4cd0779"
        	WriteRegStr   HKCR "${KEY_UNINST_QR_READER_X64}\InprocServer32\1.0.3.0" "RuntimeVersion" "v2.0.50727"
        	WriteRegStr   HKCR "${KEY_UNINST_QR_READER_X64}\InprocServer32\1.0.3.0" "CodeBase" "$INSTDIR\kwbarcode.dll"
        	WriteRegStr   HKCR "${KEY_UNINST_QR_READER_X64}\ProgId" "" "KwQRCodeReader"
        	WriteRegStr   HKLM "${KEY_UNINST_BARCODE_HEAD_X64}\" "" "KwBarcode.BarcodeCore"
        	WriteRegStr   HKLM "${KEY_UNINST_BARCODE_HEAD_X64}\CLSID" "" "{7C6D4FCD-073B-4585-943F-BCF0BB6404FD}"
        	WriteRegStr   HKCR "${KEY_UNINST_BARCODE_X64}" "" "KwBarcode.BarcodeCore"
        	WriteRegStr   HKCR "${KEY_UNINST_BARCODE_X64}\InprocServer32" "" "mscoree.dll"
        	WriteRegStr   HKCR "${KEY_UNINST_BARCODE_X64}\InprocServer32" "ThreadingModel" "Both"
        	WriteRegStr   HKCR "${KEY_UNINST_BARCODE_X64}\InprocServer32" "Class" "KwBarcode.BarcodeCore"
        	WriteRegStr   HKCR "${KEY_UNINST_BARCODE_X64}\InprocServer32" "Assembly" "KwBarcode, Version=1.0.3.0, Culture=neutral, PublicKeyToken=1ae9e675a4cd0779"
        	WriteRegStr   HKCR "${KEY_UNINST_BARCODE_X64}\InprocServer32" "RuntimeVersion" "v2.0.50727"
        	WriteRegStr   HKCR "${KEY_UNINST_BARCODE_X64}\InprocServer32" "CodeBase" "$INSTDIR\kwbarcode.dll"
        	WriteRegStr   HKCR "${KEY_UNINST_BARCODE_X64}\InprocServer32\1.0.3.0" "Class" "KwBarcode.BarcodeCore"
        	WriteRegStr   HKCR "${KEY_UNINST_BARCODE_X64}\InprocServer32\1.0.3.0" "Assembly" "KwBarcode, Version=1.0.3.0, Culture=neutral, PublicKeyToken=1ae9e675a4cd0779"
        	WriteRegStr   HKCR "${KEY_UNINST_BARCODE_X64}\InprocServer32\1.0.3.0" "RuntimeVersion" "v2.0.50727"
        	WriteRegStr   HKCR "${KEY_UNINST_BARCODE_X64}\InprocServer32\1.0.3.0" "CodeBase" "$INSTDIR\kwbarcode.dll"
        	WriteRegStr   HKCR "${KEY_UNINST_BARCODE_X64}\ProgId" "" "BarcodeCore"

        ${Else}
                WriteRegStr   HKCR "${KEY_UNINST_QR_WRITER_HEAD_X86}" "" "KwBarcode.KwQRCodeWriter"
                WriteRegStr   HKCR "${KEY_UNINST_QR_WRITER_HEAD_X86}\CLSID" "" "{69F37639-F632-433F-AA01-1BC326FD1D6F}"
                WriteRegStr   HKCR "${KEY_UNINST_QR_WRITER_X86}" "" "KwBarcode.KwQRCodeWriter"
                WriteRegStr   HKCR "${KEY_UNINST_QR_WRITER_X86}\InprocServer32" "" "mscoree.dll"
                WriteRegStr   HKCR "${KEY_UNINST_QR_WRITER_X86}\InprocServer32" "ThreadingModel" "Both"
                WriteRegStr   HKCR "${KEY_UNINST_QR_WRITER_X86}\InprocServer32" "Class" "KwBarcode.KwQRCodeWriter"
                WriteRegStr   HKCR "${KEY_UNINST_QR_WRITER_X86}\InprocServer32" "Assembly" "KwBarcode, Version=1.0.3.0, Culture=neutral, PublicKeyToken=1ae9e675a4cd0779"
                WriteRegStr   HKCR "${KEY_UNINST_QR_WRITER_X86}\InprocServer32" "RuntimeVersion" "v2.0.50727"
                WriteRegStr   HKCR "${KEY_UNINST_QR_WRITER_X86}\InprocServer32" "CodeBase" "$INSTDIR\kwbarcode.dll"
                WriteRegStr   HKCR "${KEY_UNINST_QR_WRITER_X86}\InprocServer32\1.0.3.0" "Class" "KwBarcode.KwQRCodeWriter"
                WriteRegStr   HKCR "${KEY_UNINST_QR_WRITER_X86}\InprocServer32\1.0.3.0" "Assembly" "KwBarcode, Version=1.0.3.0, Culture=neutral, PublicKeyToken=1ae9e675a4cd0779"
                WriteRegStr   HKCR "${KEY_UNINST_QR_WRITER_X86}\InprocServer32\1.0.3.0" "RuntimeVersion" "v2.0.50727"
                WriteRegStr   HKCR "${KEY_UNINST_QR_WRITER_X86}\InprocServer32\1.0.3.0" "CodeBase" "$INSTDIR\kwbarcode.dll"
                WriteRegStr   HKCR "${KEY_UNINST_QR_WRITER_X86}\ProgId" "" "KwQRCodeWriter"
                WriteRegStr   HKCR "${KEY_UNINST_QR_READER_HEAD_X86}" "" "KwBarcode.KwQRCodeReader"
                WriteRegStr   HKCR "${KEY_UNINST_QR_READER_HEAD_X86}" "" "{3E73EE86-F46D-411D-BE6F-87060B7E6E6A}"
                WriteRegStr   HKCR "${KEY_UNINST_QR_READER_X86}" "" "KwBarcode.KwQRCodeReader"
                WriteRegStr   HKCR "${KEY_UNINST_QR_READER_X86}\InprocServer32" "" "mscoree.dll"
                WriteRegStr   HKCR "${KEY_UNINST_QR_READER_X86}\InprocServer32" "ThreadingModel" "Both"
                WriteRegStr   HKCR "${KEY_UNINST_QR_READER_X86}\InprocServer32" "Class" "KwBarcode.KwQRCodeReader"
                WriteRegStr   HKCR "${KEY_UNINST_QR_READER_X86}\InprocServer32" "Assembly" "KwBarcode, Version=1.0.3.0, Culture=neutral, PublicKeyToken=1ae9e675a4cd0779"
                WriteRegStr   HKCR "${KEY_UNINST_QR_READER_X86}\InprocServer32" "RuntimeVersion" "v2.0.50727"
                WriteRegStr   HKCR "${KEY_UNINST_QR_READER_X86}\InprocServer32" "CodeBase" "$INSTDIR\kwbarcode.dll"
                WriteRegStr   HKCR "${KEY_UNINST_QR_READER_X86}\InprocServer32\1.0.3.0" "Class" "KwBarcode.KwQRCodeReader"
                WriteRegStr   HKCR "${KEY_UNINST_QR_READER_X86}\InprocServer32\1.0.3.0" "Assembly" "KwBarcode, Version=1.0.3.0, Culture=neutral, PublicKeyToken=1ae9e675a4cd0779"
                WriteRegStr   HKCR "${KEY_UNINST_QR_READER_X86}\InprocServer32\1.0.3.0" "RuntimeVersion" "v2.0.50727"
                WriteRegStr   HKCR "${KEY_UNINST_QR_READER_X86}\InprocServer32\1.0.3.0" "CodeBase" "$INSTDIR\kwbarcode.dll"
                WriteRegStr   HKCR "${KEY_UNINST_QR_READER_X86}\ProgId" "" "KwQRCodeReader"
                WriteRegStr   HKCR "${KEY_UNINST_BARCODE_HEAD_X86}" "" "KwBarcode.BarcodeCore"
                WriteRegStr   HKCR "${KEY_UNINST_BARCODE_HEAD_X86}" "" "{7C6D4FCD-073B-4585-943F-BCF0BB6404FD}"
                WriteRegStr   HKCR "${KEY_UNINST_BARCODE_X86}" "" "KwBarcode.BarcodeCore"
                WriteRegStr   HKCR "${KEY_UNINST_BARCODE_X86}\InprocServer32" "" "mscoree.dll"
                WriteRegStr   HKCR "${KEY_UNINST_BARCODE_X86}\InprocServer32" "ThreadingModel" "Both"
                WriteRegStr   HKCR "${KEY_UNINST_BARCODE_X86}\InprocServer32" "Class" "KwBarcode.BarcodeCore"
                WriteRegStr   HKCR "${KEY_UNINST_BARCODE_X86}\InprocServer32" "Assembly" "KwBarcode, Version=1.0.3.0, Culture=neutral, PublicKeyToken=1ae9e675a4cd0779"
                WriteRegStr   HKCR "${KEY_UNINST_BARCODE_X86}\InprocServer32" "RuntimeVersion" "v2.0.50727"
                WriteRegStr   HKCR "${KEY_UNINST_BARCODE_X86}\InprocServer32" "CodeBase" "$INSTDIR\kwbarcode.dll"
                WriteRegStr   HKCR "${KEY_UNINST_BARCODE_X86}\InprocServer32\1.0.3.0" "Class" "KwBarcode.BarcodeCore"
                WriteRegStr   HKCR "${KEY_UNINST_BARCODE_X86}\InprocServer32\1.0.3.0" "Assembly" "KwBarcode, Version=1.0.3.0, Culture=neutral, PublicKeyToken=1ae9e675a4cd0779"
                WriteRegStr   HKCR "${KEY_UNINST_BARCODE_X86}\InprocServer32\1.0.3.0" "RuntimeVersion" "v2.0.50727"
                WriteRegStr   HKCR "${KEY_UNINST_BARCODE_X86}\InprocServer32\1.0.3.0" "CodeBase" "$INSTDIR\kwbarcode.dll"
                WriteRegStr   HKCR "${KEY_UNINST_BARCODE_X86}\ProgId" "" "BarcodeCore"
        ${EndIf}

SectionEnd

/******************************
 *  �H�U�O�w�˵{�Ǫ���������  *
 ******************************/

Section Uninstall
  Delete "$INSTDIR\uninst.exe"
  Delete "$INSTDIR\KwBarcode.dll"
  Delete "$INSTDIR\zxing.dll"

;  Delete "$SMPROGRAMS\Kaiwood\Barcode\v.1.0.3\Uninstall.lnk"

;  RMDir "$SMPROGRAMS\Kaiwood\Barcode\v.1.0.3"

  RMDir "$INSTDIR"

  DeleteRegKey ${PRODUCT_UNINST_ROOT_KEY} "${PRODUCT_UNINST_KEY}"
        ${If} ${RunningX64}
                DeleteRegKey ${KEY_UNINST_HEAD_ROOT_X64} "${KEY_UNINST_QR_WRITER_HEAD_X64}"
                DeleteRegKey ${KEY_UNINST_ROOT_X64} "${KEY_UNINST_QR_WRITER_X64}"
                DeleteRegKey ${KEY_UNINST_HEAD_ROOT_X64} "${KEY_UNINST_QR_READER_HEAD_X64}"
                DeleteRegKey ${KEY_UNINST_ROOT_X64} "${KEY_UNINST_QR_READER_X64}"
                DeleteRegKey ${KEY_UNINST_HEAD_ROOT_X64} "${KEY_UNINST_BARCODE_HEAD_X64}"
                DeleteRegKey ${KEY_UNINST_ROOT_X64} "${KEY_UNINST_BARCODE_X64}"
        ${Else}
                DeleteRegKey ${KEY_UNINST_HEAD_ROOT_X86} "${KEY_UNINST_QR_WRITER_HEAD_X86}"
                DeleteRegKey ${KEY_UNINST_ROOT_X86} "${KEY_UNINST_QR_WRITER_X86}"
                DeleteRegKey ${KEY_UNINST_HEAD_ROOT_X86} "${KEY_UNINST_QR_READER_HEAD_X86}"
                DeleteRegKey ${KEY_UNINST_ROOT_X86} "${KEY_UNINST_QR_READER_X86}"
                DeleteRegKey ${KEY_UNINST_HEAD_ROOT_X86} "${KEY_UNINST_BARCODE_HEAD_X86}"
                DeleteRegKey ${KEY_UNINST_ROOT_X86} "${KEY_UNINST_BARCODE_X86}"
        ${EndIf}



  SetAutoClose true
SectionEnd

#-- �ھ� NSIS �}���s��W�h�A�Ҧ� Function �Ϭq������m�b Section �Ϭq����s�g�A�H�קK�w�˵{�ǥX�{���i�w�������D�C--#
Function .onInit
        ReadRegStr $R0 HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\${PRODUCT_NAME}" "UninstallString"
        StrCmp $R0 "" done

        MessageBox MB_OKCANCEL|MB_ICONEXCLAMATION \
        "${PRODUCT_NAME} is already installed. $\n$\nClick `OK` to remove the \
        previous version or `Cancel` to cancel this upgrade." \
        IDOK uninst
        Abort

        ;Run the uninstaller
        uninst:
                ClearErrors
                ExecWait '$R0 _?=$INSTDIR' ;Do not copy the uninstaller to a temp file
                
                IfErrors no_remove_uninstaller done
                ;You can either use Delete /REBOOTOK in the uninstaller or add some code
                ;here to remove the uninstaller. Use a registry key to check
                ;whether the user has chosen to uninstall. If you are using an uninstaller
                ;components page, make sure all sections are uninstalled.
                no_remove_uninstaller:

        done:
FunctionEnd

Function un.onInit
  MessageBox MB_ICONQUESTION|MB_YESNO|MB_DEFBUTTON2 "Uninatall $(^Name) ?" IDYES +2
  Abort
FunctionEnd

Function un.onUninstSuccess
  HideWindow
  MessageBox MB_ICONINFORMATION|MB_OK "$(^Name) unistall succeeded!"
FunctionEnd
