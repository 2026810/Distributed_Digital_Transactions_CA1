// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
// Author: Gabriel C. Longo

/**
 * @title Decentralized Voting System
 * @dev Smart contract acting as an intermediary for secure, transparent voting.
 */
contract Voting {
    
    struct Candidate {
        uint256 id;
        string name;
        uint256 voteCount;
    }

    address public electionOfficial; // Receiver / Administrator
    uint256 public candidatesCount;
    bool public electionStarted;
    bool public electionEnded;

    mapping(uint256 => Candidate) public candidates;
    mapping(address => bool) public voters; // Sender verification

    event CandidateAdded(uint256 indexed candidateId, string name);
    event Voted(address indexed voter, uint256 indexed candidateId);
    event ElectionStatusChanged(bool started, bool ended);

    modifier onlyOfficial() {
        require(msg.sender == electionOfficial, "Only election official can perform this action.");
        _;
    }

    modifier duringElection() {
        require(electionStarted && !electionEnded, "Election is not active.");
        _;
    }

    constructor() {
        electionOfficial = msg.sender;
        electionStarted = false;
        electionEnded = false;
    }

    function addCandidate(string memory _name) public onlyOfficial {
        require(!electionStarted, "Cannot add candidates once election has started.");
        candidatesCount++;
        candidates[candidatesCount] = Candidate(candidatesCount, _name, 0);
        emit CandidateAdded(candidatesCount, _name);
    }

    function startElection() public onlyOfficial {
        require(!electionStarted, "Election already started.");
        electionStarted = true;
        emit ElectionStatusChanged(true, false);
    }

    function endElection() public onlyOfficial {
        require(electionStarted && !electionEnded, "Election not active or already ended.");
        electionEnded = true;
        emit ElectionStatusChanged(true, true);
    }

    function vote(uint256 _candidateId) public duringElection {
        require(!voters[msg.sender], "Sender has already cast a vote.");
        require(_candidateId > 0 && _candidateId <= candidatesCount, "Invalid candidate ID.");

        voters[msg.sender] = true;
        candidates[_candidateId].voteCount++;

        emit Voted(msg.sender, _candidateId);
    }

    function getResults(uint256 _candidateId) public view returns (string memory name, uint256 voteCount) {
        require(_candidateId > 0 && _candidateId <= candidatesCount, "Invalid candidate ID.");
        Candidate memory c = candidates[_candidateId];
        return (c.name, c.voteCount);
    }
}
