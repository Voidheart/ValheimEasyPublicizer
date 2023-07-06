# ValheimEasyPublicizer

This repository contains a PowerShell script called `vasm.ps1` that serves as a simple tool to automate the processing of Valheim Assemblies. It eliminates the need to manually drag and drop individual `*.dll` files onto the `AssemblyPublicizer.exe` executable.

## Prerequisites

Before using `vasm.ps1`, make sure you have the following:

- [AssemblyPublicizer](https://github.com/cabbagecrow/assemblypublicizer): Ensure that you have the `AssemblyPublicizer.exe` executable file.

## Installation

To set up the ValheimEasyPublicizer, follow these steps:

1. Copy the `vasm.ps1` script into the same directory where the `AssemblyPublicizer.exe` file is located.

   ```
   |-- AssemblyPublicizer.exe
   |-- vasm.ps1
   ```

## Usage

To use the ValheimEasyPublicizer, follow these steps:

1. Run PowerShell with administrative privileges.

2. Navigate to the directory where the `vasm.ps1` script and `AssemblyPublicizer.exe` are located.

3. Execute the script by running the following command:

   ```powershell
   .\vasm.ps1
   ```

   The script will automatically process the Valheim assemblies and generate the required files.

## Note

- If the script cannot find the Valheim installation path, it will display the "Couldn't find path for Valheim" message. Make sure you have Valheim installed through Steam, and the Steam installation path is correctly set in the Windows registry.

- Before running the script, ensure that the `Managed` folder containing the Valheim assemblies is located in the Steam installation path. If the `publicized_assemblies` directory already exists within the `Managed` folder, the script will clean it up before creating new assemblies.

Feel free to contribute to this repository by submitting issues or pull requests if you encounter any problems or have any suggestions for improvement.

![Example Image](./.screenshot/image1.png)
