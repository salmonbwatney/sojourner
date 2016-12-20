clean:
	-find -type d -name bin -exec rm -rf {} \;
	-find -type d -name obj -exec rm -rf {} \;


compile: clean
	nuget restore SojournerGUI/SojournerGUI.sln
	xbuild /p:TargetFrameworkVersion="v4.5" /p:Configuration=Debug SojournerGUI/SojournerGUI.sln

test:
	nuget install NUnit.Runners -Version 3.0.1 -OutputDirectory tools
	mono ./tools/NUnit.Console.3.0.1/tools/nunit3-console.exe -workers 1 `(find SojournerUnitTests -name *Tests.dll | grep -v obj/Debug)`

coverageconfig:
	./ContinuousIntegration/Build/generateCoverageConfig.sh > ./coverageConfig.json

instrument: coverageconfig
	mono ./SojournerGUI/SojournerGUI/obj/x86/Debug/SojournerGUI.exe instrument ./coverageConfig.json

coverage: compile instrument test
	-mono ./SojournerGUI/SojournerGUI/obj/x86/Debug/SojournerGUI.exe check
