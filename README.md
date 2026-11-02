\# Decentralized Voting and Election System



\*\*Module:\*\* Distributed Digital Transactions  

\*\*Course:\*\* BSc (Hons) in Computing in IT (3rd Year)  

\*\*Institution:\*\* CCT College Dublin  

\*\*Lecturer:\*\* Dr. Muhammad Iqbal  



\---



\## 📌 Project Overview

This repository contains a blockchain-based decentralized voting application (DApp) developed using Solidity, Remix IDE, Ganache, and Shell Scripting. 



Traditional electronic and paper-based voting systems rely on centralized authorities, making them vulnerable to single points of failure, manipulation, and lack of immediate transparency. This project addresses these challenges by introducing an immutable, transparent, and secure Smart Contract on the Ethereum network that acts as a trustless middle layer between voters (senders) and election officials (receivers).



\---



\## 🛠️ Tech Stack \& Prerequisites

\* \*\*Smart Contract Language:\*\* Solidity (`^0.8.0`)

\* \*\*Development \& Compiler IDE:\*\* Remix IDE

\* \*\*Local Blockchain Environment:\*\* Ganache

\* \*\*Automation Script:\*\* Shell Script (`.sh`)

\* \*\*Version Control:\*\* Git \& GitHub



\---



\## 🏗️ Smart Contract Architecture (`Voting.sol`)

The `Voting.sol` smart contract enforces election rules programmatically:

1\. \*\*Election Official (Administrator):\*\* The address that deploys the contract becomes the election official, gaining permissions to add candidates and start/end the election.

2\. \*\*Voters:\*\* Verified addresses that cast a vote for a candidate.

3\. \*\*Double Voting Prevention:\*\* Uses a `mapping(address => bool)` to ensure each sender address can only vote once.

4\. \*\*Middle Layer Enforcement:\*\* Guarantees that votes cannot be modified, deleted, or recorded outside active election hours.



\---



\## 🚀 How to Run and Test



\### 1. Local Blockchain Setup (Ganache)

1\. Open \*\*Ganache\*\* and select \*\*Quickstart\*\* to launch a local Ethereum node on `http://127.0.0.1:7545`.

2\. Copy one of the private keys provided by Ganache to import into MetaMask (if testing via Web3) or connect Remix directly.



\### 2. Remix IDE Execution

1\. Open \[Remix IDE](https://remix.ethereum.org).

2\. Upload or copy `Voting.sol` into the Remix File Explorer.

3\. In the \*\*Solidity Compiler\*\* tab, compile `Voting.sol` using compiler version `0.8.20` or similar.

4\. In the \*\*Deploy \& Run Transactions\*\* tab:

&#x20;  \* Set Environment to \*\*Dev - Ganache Provider\*\* (pointing to `http://127.0.0.1:7545`).

&#x20;  \* Select the `Voting` contract and click \*\*Deploy\*\*.



\### 3. Testing the Functions

1\. \*\*Add Candidates:\*\* Call `addCandidate("Candidate Name")` from the official's address before starting the election.

2\. \*\*Start Election:\*\* Call `startElection()`.

3\. \*\*Cast Vote:\*\* Switch accounts in Remix/Ganache, input a candidate ID (e.g., `1`), and click `vote`.

4\. \*\*Verify Constraints:\*\* Attempt to vote a second time with the same account to verify that the contract reverts with `"Sender has already cast a vote."`.

5\. \*\*Check Results:\*\* Call `getResults(1)` to inspect total votes for candidate 1.



\### 4. Running the Automation Script

Execute the deployment simulation shell script from your terminal:

```bash

chmod +x deploy.sh

./deploy.sh

