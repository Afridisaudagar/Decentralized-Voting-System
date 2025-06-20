// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

contract Project {
    address public owner;
    string public projectData;
    uint256 public updateCount;

    event DataUpdated(string newData);
    event OwnershipTransferred(address indexed previousOwner, address indexed newOwner);

    constructor(string memory initialData) {
        owner = msg.sender;
        projectData = initialData;
        updateCount = 0;
    }

    modifier onlyOwner() {
        require(msg.sender == owner, "Not contract owner");
        _;
    }

    function updateData(string memory newData) external onlyOwner {
        projectData = newData;
        updateCount += 1;
        emit DataUpdated(newData);
    }

    function transferOwnership(address newOwner) external onlyOwner {
        require(newOwner != address(0), "Invalid address");
        emit OwnershipTransferred(owner, newOwner);
        owner = newOwner;
    }

    function getInfo() external view returns (string memory, address, uint256) {
        return (projectData, owner, updateCount);
    }
}
