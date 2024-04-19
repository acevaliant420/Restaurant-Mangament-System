Set Shell = CreateObject("WScript.Shell")
DesktopPath = Shell.SpecialFolders("Desktop")
Set link = Shell.CreateShortcut(DesktopPath & "\MASM32 Editor.lnk")
link.description = "MASM32 Editor"
link.TargetPath = "E:\masm32\qeditor.exe"
link.WindowStyle = 2
link.WorkingDirectory = "E:\masm32"
link.Save
