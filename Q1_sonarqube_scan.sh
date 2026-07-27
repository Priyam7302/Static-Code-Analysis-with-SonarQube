#!/usr/bin/env bash
#
# Q1 - Deploying SonarQube and Scanning a Vulnerable Repository
# Static code analysis with SonarQube on the Damn Vulnerable Python
# Web App (DVPWA).
#
# Run each section in order. Replace placeholders (<...>) with your
# own values before running.

set -e

# -----------------------------------------------------------------------
# Part 1: Deploy SonarQube dashboard & access the dashboard
# -----------------------------------------------------------------------
echo "[*] Starting SonarQube via Docker..."
docker run -d --name sonarqube \
  -p 9000:9000 \
  sonarqube:lts-community

echo "[*] SonarQube will be available at http://localhost:9000"
echo "    Default login: admin / admin (change on first login)"

# -----------------------------------------------------------------------
# Part 2: Prepare the vulnerable repository (DVPWA)
# -----------------------------------------------------------------------
echo "[*] Cloning the Damn Vulnerable Python Web App..."
git clone https://github.com/anxolerd/dvpwa.git
cd dvpwa

# -----------------------------------------------------------------------
# Part 3: Create a SonarQube project with a token
# -----------------------------------------------------------------------
# In the SonarQube UI:
#   1. Projects -> Create Project -> Manually
#   2. Set Project key / display name (e.g., "dvpwa")
#   3. Generate a token under: My Account -> Security -> Generate Token
#      Save it as SONAR_TOKEN below (do not commit real tokens).
SONAR_TOKEN="<your-generated-token>"

# -----------------------------------------------------------------------
# Part 4: Set up and run the SonarScanner
# -----------------------------------------------------------------------
echo "[*] Installing sonar-scanner CLI..."
# Download the appropriate build for your OS from:
# https://docs.sonarsource.com/sonarqube/latest/analyzing-source-code/scanners/sonarscanner/
# Then add the extracted bin/ directory to your PATH.

# -----------------------------------------------------------------------
# Part 5: Run the scan
# -----------------------------------------------------------------------
echo "[*] Running SonarScanner against DVPWA..."
sonar-scanner \
  -Dsonar.projectKey=dvpwa \
  -Dsonar.sources=. \
  -Dsonar.host.url=http://localhost:9000 \
  -Dsonar.login="$SONAR_TOKEN"

# -----------------------------------------------------------------------
# Part 6: Review scan results
# -----------------------------------------------------------------------
echo "[*] Scan complete. Open http://localhost:9000/dashboard?id=dvpwa"
echo "    to review bugs, vulnerabilities, code smells, and security hotspots."
