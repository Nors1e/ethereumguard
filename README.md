### ETHEREUMGUARD v1

# Suricata Docker Container: Network Security Monitoring for Ethereum

<p align="center">
  <img src="https://suricata.io/wp-content/uploads/2023/09/Logo-Suricata-vert-R.png" alt="Your image" width="475" height="400"/>
</p>


Welcome to the Suricata Docker Container documentation. This guide provides detailed, step-by-step instructions on how to set up and run Suricata in a Docker container for network security monitoring.

## Table of Contents

- [Introduction](#introduction)
- [Prerequisites](#prerequisites)
- [Getting Started](#getting-started)
  - [Clone the Repository](#step-1-clone-the-repository)
  - [Install Docker](#step-2-install-docker)
  - [Build the Suricata Docker Image](#step-3-build-the-suricata-docker-image)
  - [Run Suricata Container](#step-4-run-suricata-container)
- [Usage](#usage)
  - [Monitor Network Traffic](#step-5-monitor-network-traffic)
  - [Analyze Suricata Alerts](#step-6-analyze-suricata-alerts)
- [Troubleshooting](#troubleshooting)
- [Contributing](#contributing)
- [License](#license)

## Introduction

This documentation provides step-by-step instructions on how to set up and use Suricata in a Docker container for network security monitoring.

## Prerequisites

Before you begin, make sure you have the following prerequisites in place:

- Docker installed on your system.
- Basic understanding of network security monitoring.
- (Additional prerequisites specific to your setup.)

## Getting Started

### Step 1: Clone the Repository

Clone the Suricata Docker Container repository to your local machine using the following command:

```bash
git clone https://github.com/your-username/suricata-docker-container.git
```
Step 2: Install Docker
If you haven't already, make sure Docker is installed on your system. You can download and install Docker from the official website: Docker.

Step 3: Build the Suricata Docker Image
Build the Suricata Docker image by running the following command in the repository's root directory:

```bash
docker build -t suricata-container:latest .
```
Step 4: Run Suricata Container
Now, you can run Suricata in a Docker container using the following command:

```bash
docker run -d --name suricata-container --cap-add=NET_ADMIN -p 80:80 suricata-container:latest
```
-d: Runs the container in detached mode (in the background).
```bash
--name suricata-container: Assigns a name to the container for easy reference.
--cap-add=NET_ADMIN: Grants network administration privileges to the container.
```
Step 5: Monitor Network Traffic
Suricata is now running inside the Docker container and monitoring network traffic. You can monitor network interactions by analyzing the alerts generated by Suricata. For V1 you will need to set this up for yourself. For Etherium you can do something like this...
```bash
alert ip any any -> any any (msg:"Ethereum DevP2P Traffic Detected"; content:"|224 00 0 0|"; depth:4; sid:1000001;)
```

Step 6: Analyze Suricata Alerts
To analyze Suricata alerts, you can access the container's logs. Use the following command to view the logs:

```bash
docker logs suricata-container
```
This will display logs containing information about Suricata's activity and detected network traffic.

Troubleshooting
If you encounter any issues during setup or usage, refer to the troubleshooting section of the documentation for common problems and solutions.


### Example Output:

Log 1: Valid - Query Account Balance
```bash
09/27/2023-17:47:15.735210  [**] [1:1000001:1] Ethereum RPC Activity Detected [**] [Classification: Standard Query] [Priority: 3] {TCP} 192.168.1.101:51937 -> 203.0.113.25:8545
```
Log 2: Valid - Getting Transaction Count
```bash
09/27/2023-17:49:56.021456  [**] [1:1000001:1] Ethereum RPC Activity Detected [**] [Classification: Standard Query] [Priority: 3] {TCP} 192.168.1.103:51939 -> 203.0.113.25:8545
```
Log 3: Suspicious - Rapid Succession of Transactions
```bash
09/27/2023-17:50:01.235978  [**] [1:1000001:1] Ethereum RPC Activity Detected [**] [Classification: Potential Attack - Rapid Transactions] [Priority: 1] {TCP} 192.168.1.104:51940 -> 203.0.113.25:8545
```
Log 4: Suspicious - Unlocking Account
```bash
09/27/2023-17:51:30.010458  [**] [1:1000001:1] Ethereum RPC Activity Detected [**] [Classification: Potential Attack - Account Unlocking] [Priority: 1] {TCP} 192.168.1.105:51941 -> 203.0.113.25:8545
```
