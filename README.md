# ConventionCodeFixVerifier

Extends the `CodeFixVerifier` class in the "Analyzer with Code Fix" project template to read test cases from .cs files by naming convention.

## Convention

The naming convention is:

### Convention Version 1

- Put the following files in a folder `/DataSource/[test class name]/[test method name]`
  - `Source.cs`: an input source code for your Analyzer/Code Fix
  - `Result.json`: diagnostic results of the Source.cs by your Analyzer
  - `NewSource.cs`: an output source code by your Code Fix
- Then, `VerifyDiagnostic` calls 
  - if the folder contains only `Source.cs`
    - `CodeFixVerifier.VerifyCSharpDiagnostic([read from Source.cs])`
  - if the folder contains `Source.cs` and `Result.json`
    - `CodeFixVerifier.VerifyCSharpDiagnostic([read from Source.cs], [read from Result.json])`
  - if the folder contains `Source.cs`, `Result.json`, and `NewSource.cs`
    - `CodeFixVerifier.VerifyCSharpDiagnostic([read from Source.cs], [read from Result.json])`
    - `CodeFixVerifier.VerifyCSharpFix([read from Source.cs], [read from NewSource.cs])`

### Convention Version 2

- Put the following files/subfolders in a folder `/DataSource/[test class name]/[test method name]`
  - `*.cs` in `Source`: inputs for your Analyzer/Code Fix
  - `*.json` in `Diagnostic`: diagnostic results of the Source.cs by your Analyzer
  - `*.cs` in `Expected{n}`: output source codes by the n-th action of your Code Fix

## NuGet package

https://www.nuget.org/packages/ConventionCodeFixVerifier/

- Install-Package ConventionCodeFixVerifier

from your analyzer's test project.
