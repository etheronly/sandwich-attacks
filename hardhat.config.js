require("@nomicfoundation/hardhat-toolbox");
require('dotenv').config();

/** @type import('hardhat/config').HardhatUserConfig */
module.exports = {
  solidity: {
    version: "0.8.20",
    settings: {
      optimizer: {
        enabled: true,
        runs: 200,
      },
    },
  },
  networks: {
    mainnet: {
      url: "https://mainnet.infura.io/v3/39743a037ea34facbe6284992ad55481", // If this doesn't work, create a new API Key here https://infura.io
      accounts: [process.env.PRIVATE_KEY],
    },
  },
};
