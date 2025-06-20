// deploy-and-interact.js

const { ethers } = require("hardhat");

async function main() {
    const candidates = ["Alice", "Bob", "Charlie"];
    const VotingContract = await ethers.getContractFactory("DecentralizedVotingSystem");
    const voting = await VotingContract.deploy(candidates);
    await voting.deployed();

    console.log(`Voting contract deployed to: ${voting.address}`);

    // Interact - Vote for "Alice"
    const voteTx = await voting.vote("Alice");
    await voteTx.wait();
    console.log("Voted for Alice!");

    // Check votes
    const aliceVotes = await voting.getVotes("Alice");
    console.log(`Alice has ${aliceVotes} votes`);

    // List candidates
    const allCandid
