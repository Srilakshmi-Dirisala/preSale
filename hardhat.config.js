// hardhat.config.js

require("@nomiclabs/hardhat-waffle");
require("@nomiclabs/hardhat-ethers");
require("@nomiclabs/hardhat-etherscan");

const{bscscanApiKey,PRIVATE_KEY}=require('')
module.exports = {
  defaultNetwork: "hardhat",
  networks: {
    hardhat: {},
    bsc_testnet: {
      url: "https://data-seed-prebsc-1-s1.binance.org:8545/", // BSC Testnet
      chainId: 97,
      accounts: [PRIVATE_KEY],
    },
    bsc_mainnet: {
      url:"https://bsc-dataseed.binance.org/", // BSC Mainnet
      chainId: 56,
      accounts: [PRIVATE_KEY],
    },
  },
  solidity: "0.8.20",
};
