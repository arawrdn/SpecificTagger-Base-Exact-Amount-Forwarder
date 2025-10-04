// SPDX-License-Identifier: MIT
pragma solidity 0.8.30;

contract SpecificTagger {
    address payable public owner;
    
    // Exact amount required for tagging: 0.000001 ETH (1,000,000,000,000 Wei)
    uint public constant TARGET_AMOUNT = 1000000000000; 
    
    // Array to publicly store addresses that successfully sent the target amount
    address[] public taggedUsers;
    
    // --- EVENTS ---
    // Logs the address of the user who successfully completed the transfer and tagging
    event UserTagged(address indexed user, uint amount);

    // --- CONSTRUCTOR ---
    // Sets the deployer (Owner) as the recipient of all forwarded funds
    constructor() {
        owner = payable(msg.sender);
    }

    // --- RECEIVE FUNCTION (DEPOSIT, TAG & FORWARD OTOMATIS) ---
    // This function runs automatically when ETH is transferred directly to this contract.
    receive() external payable {
        // 1. Requirement check: MUST be exactly 0.000001 ETH.
        // If the amount is incorrect, the transaction reverts (fails).
        require(msg.value == TARGET_AMOUNT, "Transfer must be exactly 0.000001 ETH to be processed.");
        
        // 2. Tag the user (record their address into the public array)
        taggedUsers.push(msg.sender);
        
        // 3. Forward the fund instantly and completely to the owner
        (bool success, ) = owner.call{value: msg.value}("");
        require(success, "Forwarding failed.");
        
        emit UserTagged(msg.sender, msg.value);
    }
    
    // --- VIEW FUNCTIONS (For Owner monitoring) ---
    
    // Returns the total number of users who successfully sent the target amount
    function getTaggedUserCount() public view returns (uint) {
        return taggedUsers.length;
    }

    // Returns the address of a tagged user at a specific index (starting from 0)
    function getTaggedUser(uint index) public view returns (address) {
        require(index < taggedUsers.length, "Index out of bounds.");
        return taggedUsers[index];
    }
}
