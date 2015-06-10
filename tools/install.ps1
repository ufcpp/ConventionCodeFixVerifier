param($installPath, $toolsPath, $package, $project)

$datasource = $project.ProjectItems | ?{ $_.Name -eq 'DataSource'}
$class = $datasource.ProjectItems | ?{ $_.Name -eq 'UnitTest'}
$method = $class.ProjectItems | ?{ $_.Name -eq 'TestMethod2'}

$items = $method.ProjectItems | ? {$_.Name -like '*.cs'} 

foreach ($item in $items)
{
    $item.Properties.Item("BuildAction").Value = [int]0
}
