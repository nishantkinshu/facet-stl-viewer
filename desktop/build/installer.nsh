; Extra installer steps for Facet (used by electron-builder).
; Adds Facet to the "Open with" list for .stl files in File Explorer,
; without replacing the program that already opens them.

!macro customInstall
  WriteRegStr HKCU "Software\Classes\Facet.Model" "" "STL 3D model"
  WriteRegStr HKCU "Software\Classes\Facet.Model\DefaultIcon" "" "$INSTDIR\${APP_EXECUTABLE_FILENAME},0"
  WriteRegStr HKCU "Software\Classes\Facet.Model\shell\open\command" "" '"$INSTDIR\${APP_EXECUTABLE_FILENAME}" "%1"'
  WriteRegStr HKCU "Software\Classes\.stl\OpenWithProgids" "Facet.Model" ""
  System::Call 'shell32::SHChangeNotify(i 0x08000000, i 0, p 0, p 0)'
!macroend

!macro customUnInstall
  DeleteRegValue HKCU "Software\Classes\.stl\OpenWithProgids" "Facet.Model"
  DeleteRegKey HKCU "Software\Classes\Facet.Model"
  System::Call 'shell32::SHChangeNotify(i 0x08000000, i 0, p 0, p 0)'
!macroend
