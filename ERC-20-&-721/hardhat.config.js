require("@nomiclabs/hardhat-waffle");
require("dotenv").config();
require("@nomiclabs/hardhat-etherscan");

const { API_URL, PRIVATE_KEY, ETHER_KEY } = process.env;

module.exports = {
  solidity: "0.8.4",
  networks: {
    ropsten: {
      url: API_URL,
      accounts: [`0x${PRIVATE_KEY}`],
    },
  },
  etherscan: {
    apiKey: ETHER_KEY,
  },
};
