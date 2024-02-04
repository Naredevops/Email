name: Send Email

on:
  push:
    branches:
      - main

jobs:
  send_email:
    runs-on: ubuntu-latest

    steps:
      - name: Set up Python
        uses: actions/setup-python@v2
        with:
          python-version: '3.x'

      - name: Run PowerShell script
        run: pwsh -Command "& { $scriptPath = 'script.ps1'; ./$scriptPath }"
