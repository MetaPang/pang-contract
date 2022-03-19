require("@nomiclabs/hardhat-waffle");
require('@nomiclabs/hardhat-ethers');

// This is a sample Hardhat task. To learn how to create your own go to
// https://hardhat.org/guides/create-task.html
task("accounts", "Prints the list of accounts", async (taskArgs, hre) => {
  const accounts = await ethers.getSigners();

  for (const account of accounts) {
    console.log(account.address);
  }
});

// You need to export an object to set up your config
// Go to https://hardhat.org/config/ to learn more

/**
 * @type import('hardhat/config').HardhatUserConfig
 */
module.exports = {
  defaultNetwork: "testnet",
  networks: {
    localhost: {
    },
    hardhat: {
    },
    testnet: {
      url: "http://15.165.104.103",
      chainId: 97,
      gasPrice: 20000000000
    },
    mainnet: {
      url: "https://bsc-dataseed.binance.org/",
      chainId: 56,
      gasPrice: 20000000000
    }
  },
  solidity: {
    version: "0.5.16",
    settings: {
      optimizer: {
        enabled: true
      }
    }
  },
  paths: {
    sources: "./contracts",
    tests: "./test",
    cache: "./cache",
    artifacts: "./artifacts"
  },
  mocha: {
    timeout: 20000
  }
};
