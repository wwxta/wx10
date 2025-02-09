# Remove all revisions except DE

	dism /delete-image /imagefile:c:\10\install.wim /index:4
	dism /delete-image /imagefile:c:\10\install.wim /index:3
	dism /delete-image /imagefile:c:\10\install.wim /index:1


# Mounting install.wim
mkdir c:\10\Install
dism /mount-image /imagefile:c:\10\install.wim /index:1 /mountdir:c:\10\Install
# Adding a response file
mkdir c:\10\Install\Windows\Panther
move c:\10\unattend.xml c:\10\Install\Windows\Panther
# Removing components
dism /image:c:\10\Install /remove-capability /capabilityname:App.StepsRecorder~~~~0.0.1.0
dism /image:c:\10\Install /remove-capability /capabilityname:App.Support.QuickAssist~~~~0.0.1.0
dism /image:c:\10\Install /remove-capability /capabilityname:Hello.Face.18967~~~~0.0.1.0
dism /image:c:\10\Install /remove-capability /capabilityname:Hello.Face.Migration.18967~~~~0.0.1.0
dism /image:c:\10\Install /remove-capability /capabilityname:MathRecognizer~~~~0.0.1.0
dism /image:c:\10\Install /remove-capability /capabilityname:OneCoreUAP.OneSync~~~~0.0.1.0
$letters=@("D","E","F","G","H","I","J","K","L","M","N","O","P","Q","R","S","T","U","V","W","X","Y","Z")
foreach ($letter in $letters) {
	if ([System.IO.File]::Exists($letter+":\sources\install.wim"))
	{
		$found=$letter+":\sources\sxs\"
	}
}
# Installation .NET Framework 3.5
#dism /image:c:\10\Install /enable-feature /featurename:NetFx3 /all /source:$found /limitaccess
# Activation Direct Play
#dism /image:c:\10\Install /enable-feature /featurename:DirectPlay /all /source:$found /limitaccess
# Removing Pre-Installation Packages
$apps=@(
"Microsoft.549981C3F5F10_1.1911.21713.0_neutral_~_8wekyb3d8bbwe",
"Microsoft.BingWeather_4.25.20211.0_neutral_~_8wekyb3d8bbwe",
"Microsoft.GetHelp_10.1706.13331.0_neutral_~_8wekyb3d8bbwe",
"Microsoft.Getstarted_8.2.22942.0_neutral_~_8wekyb3d8bbwe",
"Microsoft.Microsoft3DViewer_6.1908.2042.0_neutral_~_8wekyb3d8bbwe",
"Microsoft.MicrosoftOfficeHub_18.1903.1152.0_neutral_~_8wekyb3d8bbwe",
"Microsoft.MicrosoftSolitaireCollection_4.4.8204.0_neutral_~_8wekyb3d8bbwe",
"Microsoft.MicrosoftStickyNotes_3.6.73.0_neutral_~_8wekyb3d8bbwe",
"Microsoft.MixedReality.Portal_2000.19081.1301.0_neutral_~_8wekyb3d8bbwe",
"Microsoft.MSPaint_2019.729.2301.0_neutral_~_8wekyb3d8bbwe",
"Microsoft.Office.OneNote_16001.12026.20112.0_neutral_~_8wekyb3d8bbwe",
"Microsoft.People_2019.305.632.0_neutral_~_8wekyb3d8bbwe",
"Microsoft.ScreenSketch_2019.904.1644.0_neutral_~_8wekyb3d8bbwe",
"Microsoft.SkypeApp_14.53.77.0_neutral_~_kzf8qxf38zg5c",
"Microsoft.StorePurchaseApp_11811.1001.1813.0_neutral_~_8wekyb3d8bbwe",
"Microsoft.Wallet_2.4.18324.0_neutral_~_8wekyb3d8bbwe",
"Microsoft.Windows.Photos_2019.19071.12548.0_neutral_~_8wekyb3d8bbwe",
"Microsoft.WindowsAlarms_2019.807.41.0_neutral_~_8wekyb3d8bbwe",
"Microsoft.WindowsCalculator_2020.1906.55.0_neutral_~_8wekyb3d8bbwe",
"Microsoft.WindowsCamera_2018.826.98.0_neutral_~_8wekyb3d8bbwe",
"microsoft.windowscommunicationsapps_16005.11629.20316.0_neutral_~_8wekyb3d8bbwe",
"Microsoft.WindowsFeedbackHub_2019.1111.2029.0_neutral_~_8wekyb3d8bbwe",
"Microsoft.WindowsMaps_2019.716.2316.0_neutral_~_8wekyb3d8bbwe",
"Microsoft.WindowsSoundRecorder_2019.716.2313.0_neutral_~_8wekyb3d8bbwe",
"Microsoft.WindowsStore_11910.1002.513.0_neutral_~_8wekyb3d8bbwe",
"Microsoft.Xbox.TCUI_1.23.28002.0_neutral_~_8wekyb3d8bbwe",
"Microsoft.XboxApp_48.49.31001.0_neutral_~_8wekyb3d8bbwe",
"Microsoft.XboxGameOverlay_1.46.11001.0_neutral_~_8wekyb3d8bbwe",
"Microsoft.XboxGamingOverlay_2.34.28001.0_neutral_~_8wekyb3d8bbwe",
"Microsoft.XboxIdentityProvider_12.50.6001.0_neutral_~_8wekyb3d8bbwe",
"Microsoft.XboxSpeechToTextOverlay_1.17.29001.0_neutral_~_8wekyb3d8bbwe",
"Microsoft.YourPhone_2019.430.2026.0_neutral_~_8wekyb3d8bbwe",
"Microsoft.ZuneMusic_2019.19071.19011.0_neutral_~_8wekyb3d8bbwe",
"Microsoft.ZuneVideo_2019.19071.19011.0_neutral_~_8wekyb3d8bbwe"
)
foreach ($app in $apps) {
	dism /image:c:\10\Install /remove-provisionedappxpackage /packagename:$app
}
