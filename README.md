# Static Code Analysis with SonarQube

Deploying SonarQube and running static code analysis against the
**Damn Vulnerable Python Web App (DVPWA)** to identify bugs,
vulnerabilities, and code smells.

## Question

**Q1.** Deploy SonarQube and scan a vulnerable repository (DVPWA) —
covering dashboard setup, project/token creation, running the
SonarScanner, and reviewing the results.

## Files

| File | Description |
|------|-------------|
| `Q1_sonarqube_scan.sh` | End-to-end script covering all 6 parts of the task |

## Workflow

1. **Deploy SonarQube** – run the SonarQube Community Edition via Docker and access the dashboard on `localhost:9000`.
2. **Prepare the vulnerable repository** – clone DVPWA locally.
3. **Create a SonarQube project + token** – set up a project in the UI and generate an auth token for the scanner.
4. **Set up the SonarScanner** – install the `sonar-scanner` CLI.
5. **Run the scan** – execute `sonar-scanner` against the DVPWA source with the project key, host URL, and token.
6. **Review results** – inspect flagged bugs, vulnerabilities, code smells, and security hotspots on the SonarQube dashboard.

## Usage

```bash
chmod +x Q1_sonarqube_scan.sh
./Q1_sonarqube_scan.sh
```

> Note: Update `SONAR_TOKEN` in the script with a token generated from
> your own SonarQube instance before running Part 5. Never commit a
> real token to a public repo.

## Tools

- SonarQube (Community Edition, via Docker)
- SonarScanner CLI
- Damn Vulnerable Python Web App (DVPWA)

## License

MIT
