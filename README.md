## ConchBrain club official website api

A web api base on PowerShell

#### Install pre-requisites

- powershell core
- sqlite3

#### Restore Dependence

It will create database and install the dependences.

- dependences
    - [Polaris](https://github.com/PowerShell/Polaris)
    - [PSSQLite](https://github.com/RamblingCookieMonster/PSSQLite)

```pwsh
pwsh restore.ps1
```

#### Debug

VScode launch.json config

```json
{
    "version": "0.2.0",
    "configurations": [
        {
            "name": "PowerShell: Launch Script",
            "type": "PowerShell",
            "request": "launch",
            "script": "${workspaceFolder}/src/main.ps1",
            "cwd": "${workspaceFolder}/src"
        }
    ]
}
```

#### Run Project

```pwsh
cd src
pwsh -noe main.ps1
```