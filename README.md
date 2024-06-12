# <p align="center">MC Server Error Logging</p>

<p align="center"><img alt="Banner" src="assets/images/README imgs/MC Server Error Log Header.jpg" width="100%">

<a href="https://github.com/Ghost-Hackers/mc-server.log"><img alt="GitHub Repo stars" src="https://img.shields.io/github/stars/Ghost-Hackers/mc-server.log?label=Repo%20Stars" /></a> <a href="https://github.com/Ghost-Hackers"><img alt="GitHub Org's stars" src="https://img.shields.io/github/stars/Ghost-Hackers?style=social&label=Org%20Stars" /></a> <img alt="GitHub collaborators" src="https://img.shields.io/github/contributors/Ghost-Hackers/mc-server.log?style=social" /> <img alt="GitHub watchers" src="https://img.shields.io/github/watchers/Ghost-Hackers/mc-server.log?style=social" /> <img alt="GitHub all releases" src="https://img.shields.io/github/downloads/Ghost-Hackers/mc-server.log/total?style=social" />

<p align="center">
  <a href="https://skillicons.dev">
    <img alt="Skill Icons" src="https://skillicons.dev/icons?i=github,git,powershell,html,md" />
  </a>
</p>

<!--    !! REMEMBER TO UDPATE BADGES !!    -->

<p align="center">
    <img alt="README Badge" src="https://img.shields.io/badge/README updated on-6/11/2024-gold?style=plastic" />
    <img alt="Last Updated Badge" src="https://img.shields.io/badge/last updated by-GH👻ST-white?style=plastic" />
    </br>
    <object data="https://img.shields.io/github/v/release/Ghost-Hackers/mc-server.log?include_prereleases&sort=date&display_name=tag&style=plastic&label=latest%20release&color=bright%20green" type="image/svg+xml">
        <img alt="GitHub Release" src="https://img.shields.io/github/v/release/Ghost-Hackers/mc-server.log?include_prereleases&sort=date&display_name=tag&style=plastic&label=latest%20release&color=bright%20green" />
    </object>
    <object data="https://img.shields.io/github/release-date/Ghost-Hackers/mc-server.log?display_date=published_at&style=plastic&color=blue&link=right%3Ahttps%3A%2F%2Fgithub.com%2FGhost-Hackers%2Fmc-server.log%2Freleases" type="image/svg+xml">
        <img alt="GitHub Release Date - Published_At" src="https://img.shields.io/github/release-date/Ghost-Hackers/mc-server.log?display_date=published_at&style=plastic&color=blue&link=right%3Ahttps%3A%2F%2Fgithub.com%2FGhost-Hackers%2Fmc-server.log%2Freleases" />
    </object>
    </br>
</p>

---

[![Greetings](https://github.com/Ghost-Hackers/mc-server.log/actions/workflows/greetings.yml/badge.svg)](https://github.com/Ghost-Hackers/mc-server.log/actions/workflows/greetings.yml)
[![Generate Changelog](https://github.com/Ghost-Hackers/mc-server.log/actions/workflows/generate-changelog.yml/badge.svg)](https://github.com/Ghost-Hackers/mc-server.log/actions/workflows/generate-changelog.yml)

> ## Purpose

This repository contains a Python script to capture and log errors from a self-hosted Minecraft server on Windows 11. The logs are formatted and saved into an HTML file, which can be viewed in a web browser for better organization and readability.

> ## Features

- Captures error, warning, and exception messages from the Minecraft server console output.
- Formats the logs into a structured HTML file.
- Displays timestamps for each log entry.
- Easy-to-read and organized layout for error logs.
- Automatically names log files with the current date and time to prevent overwriting.

> ## Prerequisites

Before using this script, ensure you have the following:

- **Python 3.x**: Required for running the script and managing dependencies.
- **pip**: Python package installer, necessary for installing Python packages.
- **colorama**: A Python package used for colored terminal text, required by the script.
- **winget**: Windows Package Manager, used for installing Python.

> ## Installation

### Step-by-Step Setup

1. **Clone the Repository**

    ```bash
    git clone https://github.com/your-repo/minecraft-bedrock-server-error-logging.git
    cd minecraft-bedrock-server-error-logging
    ```

2. **Run the Setup Script**

    Double-click or run the `start_server.bat` batch file. This script will:

    - Check if Python and pip are installed, and install them if not.
    - Install the `colorama` package if it is missing.
    - Create the necessary directory structure (`docs\logs\errors`).
    - Start the Minecraft Bedrock server and capture logs.
    - Move the generated log file to the specified directory.

    ```bash
    start_server.bat
    ```

### Manual Installation (If Needed)

1. **Install Python and pip using winget**

    - Open PowerShell as an administrator and run:

      ```bash
      winget install --id Python.Python
      ```

2. **Install colorama**

    ```bash
    pip install colorama
    ```

> ## Usage

1. **Run the Setup Script**

    Execute the `start_server.bat` script in the directory containing `log_errors.py` and `bedrock_server.exe`.

    ```bash
    start_server.bat
    ```

2. **Accessing the Logs**

    - After the server starts, the script generates an `error_log_<timestamp>.html` file and saves it to `docs/logs/errors`.
    - Open `docs/logs/errors/error_log_<timestamp>.html` in your web browser to view the logs.

> ## Directory Structure

Your project directory should look like this:

```text
mc-server.log/
|-- docs/
| |-- logs/
| |-- errors/
| |-- error_log_<timestamp>.html
|-- log_errors.py
|-- start_server.bat
|-- bedrock_server.exe
```

> ## Example Log File Structure

The `error_log_<timestamp>.html` file will have a structure similar to this:

```html
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Minecraft Bedrock Server Error Log</title>
    <style>
        body { font-family: Arial, sans-serif; background-color: #f9f9f9; color: #333; }
        .log-container { width: 80%; margin: 0 auto; padding: 20px; background-color: #fff; border: 1px solid #ccc; border-radius: 10px; }
        .log-entry { margin-bottom: 10px; padding: 10px; border-bottom: 1px solid #ddd; }
        .timestamp { font-weight: bold; }
        .error-message { color: red; }
    </style>
</head>
<body>
    <div class="log-container">
        <!-- Log entries will be inserted here -->
    </div>
</body>
</html>
```

> ## Future Improvements

Automated Archiving: Implement a feature to archive old log files to prevent the current log file from becoming too large.
Real-time Logging: Enhance the script to update the HTML file in real-time or periodically.
Additional Log Levels: Include more log levels (e.g., INFO, DEBUG) with different styles to better categorize the log entries.
Search Functionality: Add a search bar in the HTML file to quickly find specific log entries.

> ## Repository Information

<img alt="GitHub repo size" src="https://img.shields.io/github/repo-size/Ghost-Hackers/mc-server.log?style=plastic"> <img alt="GitHub code size in bytes" src="https://img.shields.io/github/languages/code-size/Ghost-Hackers/mc-server.log?style=plastic"> <img alt="GitHub repo file count" src="https://img.shields.io/github/directory-file-count/Ghost-Hackers/mc-server.log?style=plastic&color=green"> <img alt="GitHub language count" src="https://img.shields.io/github/languages/count/Ghost-Hackers/mc-server.log?style=plastic&color=yellow"> <img alt="GitHub release (latest by date)" src="https://img.shields.io/github/downloads/Ghost-Hackers/mc-server.log/latest/total?style=plastic&color=white">

<details>
  <summary>Commits</summary>
  <!-- Include commit-related badges or information. -->
  <img alt="GitHub last commit" src="https://img.shields.io/github/last-commit/Ghost-Hackers/mc-server.log?style=plastic" />
  <img alt="GitHub commit activity" src="https://img.shields.io/github/commit-activity/m/Ghost-Hackers/mc-server.log?style=plastic">

</details>

<details>
  <summary>Pull Requests</summary>
  <!-- Include pull request-related badges or information. -->
  <img alt="GitHub pull requests" src="https://img.shields.io/github/issues-pr/Ghost-Hackers/mc-server.log?style=plastic&color=orange">
  <img alt="GitHub closed pull requests" src="https://img.shields.io/github/issues-pr-closed/Ghost-Hackers/mc-server.log?style=plastic">
</details>

<details>
  <summary>Downloads by Version</summary>
  <!-- Include download-related badges or information by version. -->
  <strong>V1.0 Downloads</strong> <sup>[*Ongoing*]</sup> </br>
    <img alt="GitHub release (by tag)" src="https://img.shields.io/github/downloads/Ghost-Hackers/mc-server.log/v1.0.0/total?style=social">
  </br>
  <strong>V0.1 Downloads</strong> <sup>[*Discontinued*]</sup> </br>
    <img alt="GitHub release (by tag)" src="https://img.shields.io/github/downloads/Ghost-Hackers/mc-server.log/v0.1.0/total?style=social">
</details>

### Recent Issue(s)

<img alt="GitHub closed issues" src="https://img.shields.io/github/issues-closed/Ghost-Hackers/mc-server.log?style=plastic&color=vividgreen"> <img alt="GitHub open issues" src="https://img.shields.io/github/issues/Ghost-Hackers/mc-server.log?style=plastic&color=red" /> <img alt="GitHub issue custom search" src="https://img.shields.io/github/issues-search?query=repo%3AGhost-Hackers%2Fmc-server.log%20is%3Aissue%20label%3Abug&style=plastic&label=bugs&color=orange"> <img alt="GitHub issue custom search" src="https://img.shields.io/github/issues-search?query=repo%3AGhost-Hackers%2Fmc-server.log%20is%3Aissue%20label%3Aenhancement&style=plastic&label=feature%20requests&color=yellow">

Currently there are no recent issues. If you have an issue, please open one and let us know so we can fix it.

<!-- 
  - [ ] [#1: issue_label](https://github.com/Ghost-Hackers/mc-server.log/issues/1)
  - [:white_check_mark:] [#2: issue_label](https://github.com/Ghost-Hackers/mc-server.log/issues/2)
-->

> ## Changelog

For a detailed changelog, please refer to the [CHANGELOG.md](CHANGELOG.md) file. It contains information about every release, including notable changes, bug fixes, and new features. The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/). This project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html). The latest release is [v0.1.0](https://github.com/Ghost-Hackers/mc-server.log/releases/tag/v0.1.0). <!-- The latest pre-release is [v1.0.0](https://github.com/Ghost-Hackers/mc-server.log/releases/tag/v1.0.0). -->

> ## Contributing

Contributions are what make the open-source community such an amazing place to be, learn, inspire, and create. Any contributions you make are **greatly appreciated**. Please refer to the [CONTRIBUTING.md](CONTRIBUTING.md) file for more information on how to contribute. The process for submitting pull requests is described in [GitHub Help](https://help.github.com/en/github/collaborating-with-issues-and-pull-requests/creating-a-pull-request). Please refer to the [CODE_OF_CONDUCT.md](CODE_OF_CONDUCT.md) file for our code of conduct. We welcome all contributions, including but not limited to the following: reporting issues, contributing code, submitting pull requests, identifying bugs, proposing new features, and creating suggestions. When contributing to this repository, please follow the [Ethereal Style Codex](/docs/guides/ethereal-style-codex.md) and the [Ethereal Documentation Codex](/docs/guides/ethereal-documentation-codex.md).

> ## License

This project is licensed under the GNU Affero General Public License v3.0 - see the [LICENSE](LICENSE) file for details. The license is also available [online](https://www.gnu.org/licenses/agpl-3.0.en.html). The license is based on the [GNU General Public License v3.0](https://choosealicense.com/licenses/gpl-3.0/). It is a copyleft license that requires anyone who distributes our code or a derivative work to make the source available under the same terms, and also provides an express grant of patent rights from contributors to users. It is compatible with the GNU GPL, but not with the GNU LGPL. The license is designed specifically to ensure that, if you make changes to this code and distribute the resulting executable, you must release your changes under the same license. It ensures that the user of a program that includes this code can download the source freely and modify it freely. It also ensures that the user can know what license the code is released under, and can use that code in other projects.

> ## Contact

- Please use the [Issues](https://github.com/Ghost-Hackers/mc-server.log/issues) tab to report any issues, bugs, or enhancements (feature requests)
- You may email us at [Ghost Hackers](mailto:ghost-hackers@outlook.com) for any other inquiries

> This `README.md` provides clear instructions on how to set up and use the script, along with an example and a description of the generated HTML log file. It also suggests possible future improvements and provides standard sections for license and contributing. Adjust the repository URL and contact details as needed for your specific use case.