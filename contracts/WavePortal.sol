//SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.0;

import "hardhat/console.sol";

contract WavePortal {
    uint256 totalWaves;
    mapping(address => uint256) public waveMap;
    Wave[] waves;

    constructor() {
        console.log("REEEEEEEEEEEEEEEEE");
    }

    event NewWave(address indexed from, uint256 timestamp, string message);

    struct Wave{
        address waver;
        string message;
        uint256 timestamp;
    }

    function wave(string memory _message) public {
        totalWaves++;
        waveMap[msg.sender]++;
        waves.push(Wave(msg.sender, _message, block.timestamp));
        console.log("%s has waved %d times!", msg.sender, waveMap[msg.sender]);
        emit NewWave(msg.sender, block.timestamp, _message);
    }

     function getAllWaves() public view returns (Wave[] memory) {
        return waves;
    }

    function getTotalWaves() public view returns (uint256){
       
        return totalWaves;
    }
}
