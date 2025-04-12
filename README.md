# 🎮 Familiada POLSL

Familiada is an application developed in **Qt 6.4**, inspired by the popular TV game show. The project was created as part of academic studies, focusing on dynamic translations, user interface, and event handling.

[![DeepSource](https://app.deepsource.com/gh/BialySztorm/Familiada-POLSL.svg/?label=active+issues&show_trend=true&token=Di4Zl7uR-XdwFlxBZLDQ7C6O)](https://app.deepsource.com/gh/BialySztorm/Familiada-POLSL/?ref=repository-badge)
[![Qt Version](https://img.shields.io/badge/Qt-6.4-green)](https://www.qt.io/)
[![License](https://img.shields.io/badge/license-CC0%201.0-blue)](https://creativecommons.org/publicdomain/zero/1.0/)

---

## 📋 Table of Contents
- [🎮 Familiada POLSL](#-familiada-polsl)
  - [📋 Table of Contents](#-table-of-contents)
  - [📖 Project Description](#-project-description)
  - [✨ Features](#-features)
  - [🛠 Technologies](#-technologies)
  - [💻 Requirements](#-requirements)
  - [🚀 Running the Application](#-running-the-application)
    - [Option 1: Download the Release](#option-1-download-the-release)
    - [Option 2: Clone the Repository and Build](#option-2-clone-the-repository-and-build)
  - [📦 Packaging the Application (Deploy)](#-packaging-the-application-deploy)
    - [Windows](#windows)
    - [macOS](#macos)
    - [Linux](#linux)
  - [👨‍💻 Authors](#-authors)
  - [📜 License](#-license)
  - [📞 Contact](#-contact)

---

## 📖 Project Description
**Familiada** is a desktop application that simulates gameplay from the TV game show. The project utilizes dynamic translations, keyboard event handling, and advanced user interface features.

---

## ✨ Features
- Dynamic translations loaded from the `ui.txt` file.
- Keyboard event handling (e.g., selecting answers, controlling the game).
- User interface built with QML components.
- Sound and visual effects support.
- Game settings configuration.

---

## 🛠 Technologies
- **Qt 6.4**: Framework for cross-platform application development.
- **C++**: Application logic.
- **QML**: User interface creation.
- **XMLHttpRequest**: Loading dynamic translations.
- **MediaPlayer**: Sound handling.

---

## 💻 Requirements
- **Qt 6.4** or newer.
- A compiler compatible with C++17 (e.g., GCC, Clang, MSVC).
- Operating system: Windows, macOS, or Linux.

---

## 🚀 Running the Application

### Option 1: Download the Release
1. **Download the latest release**:
   - Go to the [Releases](https://github.com/BialySztorm/Familiada-POLSL/releases) page.
   - Download the appropriate version for your operating system (e.g., `.zip` for Windows, `.dmg` for macOS, or `.AppImage` for Linux).

2. **Run the application**:
   - Extract the downloaded file.
   - On **Windows**: Double-click the `Familiada.exe` file.
   - On **macOS**: Open the `.dmg` file and drag the application to your Applications folder, then run it.
   - On **Linux**: Make the `.AppImage` file executable and run it:
     ```bash
     chmod +x Familiada.AppImage
     ./Familiada.AppImage
     ```

---

### Option 2: Clone the Repository and Build
1. **Clone the repository**:
   ```bash
   git clone https://github.com/BialySztorm/Familiada-POLSL.git
   cd Familiada-POLSL
   ```

2. **Open the project in Qt Creator**:
   - Select the `.pro` or `.qmlproject` file.

3. **Configure the environment**:
   - Ensure the appropriate compiler and Qt version are set.

4. **Run the application**:
   - Click the "Run" button in Qt Creator.

---

## 📦 Packaging the Application (Deploy)
To package the Qt application with the required libraries, follow these steps:

### Windows
1. **Build the application in Release mode**:
   - In Qt Creator, select the `Release` configuration and build the project.

2. **Use the `windeployqt` tool**:
   - Open a terminal and navigate to the directory containing the `.exe` file (e.g., `release/`).
   - Run the command:
     ```bash
     windeployqt Familiada.exe
     ```
   - The tool will automatically copy all required Qt libraries to the application directory.

3. **Package the application**:
   - Copy the entire directory (with the `.exe` file and libraries) and compress it as a `.zip` or `.exe` installer.

### macOS
1. **Build the application in Release mode**:
   - In Qt Creator, select the `Release` configuration and build the project.

2. **Use the `macdeployqt` tool**:
   - In the terminal, navigate to the directory containing the `.app` file.
   - Run the command:
     ```bash
     macdeployqt Familiada.app
     ```
   - The tool will automatically copy all required Qt libraries into the `.app` package.

3. **Package the application**:
   - Compress the `.app` file as a `.dmg` or `.zip`.

### Linux
1. **Build the application in Release mode**:
   - In Qt Creator, select the `Release` configuration and build the project.

2. **Use the `linuxdeployqt` tool**:
   - Download the `linuxdeployqt` tool:
     ```bash
     wget https://github.com/probonopd/linuxdeployqt/releases/download/continuous/linuxdeployqt-continuous-x86_64.AppImage
     chmod +x linuxdeployqt-continuous-x86_64.AppImage
     ```
   - Run the command:
     ```bash
     ./linuxdeployqt-continuous-x86_64.AppImage Familiada -appimage
     ```
   - The tool will create an `.AppImage` file that can be run on any Linux system.

---

## 👨‍💻 Authors
- **Andrzej Manderla**
- **Julia Kotarska**
- **Kamil Mazur**

---

## 📜 License
This project is licensed under the **Creative Commons 1.0 Universal (CC0 1.0)**. For more details, see the [LICENSE](LICENSE) file.

---

## 📞 Contact
If you have any questions or suggestions, feel free to contact us via [GitHub Issues](https://github.com/BialySztorm/Familiada-POLSL/issues).