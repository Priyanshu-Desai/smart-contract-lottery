import hardhatToolboxMochaEthersPlugin from "@nomicfoundation/hardhat-toolbox-mocha-ethers";
import "@nomicfoundation/hardhat-toolbox";
import "hardhat-deploy";
import "hardhat-etherscan";
import "prettier";
import "prettier-plugin-solidity";
import "solhint";
import "dotenv/config";


module.exports = {
  solidity: "0.8.18",
  plugins: [hardhatToolboxMochaEthersPlugin],
};