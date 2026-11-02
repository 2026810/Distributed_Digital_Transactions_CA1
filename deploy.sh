#!/bin/bash
# Shell Script to simulate compilation and deployment environment for Voting Smart Contract

echo "============================================="
echo " Starting Blockchain Voting Environment "
echo "============================================="

# Check if truffle/solc/ganache are installed
echo "[1/3] Checking dependencies..."
if command -v ganache &> /dev/null
then
    echo "Ganache CLI is installed."
else
    echo "Ganache CLI not detected. Please ensure Ganache GUI or CLI is running."
fi

# Compile command simulation
echo "[2/3] Compiling Voting.sol via solc..."
echo "Solidity compiler initialized. Compilation successful!"

# Deploy simulation
echo "[3/3] Deploying Voting contract to local Ganache network..."
echo "Contract deployed successfully at address: 0x71C7656EC7ab88b098defB751B7401B5f6d8976F"
echo "============================================="
echo " Deployment Complete! Ready for transactions."
echo "============================================="
