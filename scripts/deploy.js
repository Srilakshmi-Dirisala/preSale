

// scripts/deployToken.js
const { ethers } = require("hardhat");

async function main() {
  const MyToken = await ethers.getContractFactory("YourToken");
  console.log("Deploying YourToken...");
  const myToken = await MyToken.deploy();
  await myToken.deployed();
  console.log("MyToken deployed to:", myToken.address);
}

main()
  .then(() => process.exit(0))
  .catch((error) => {
    console.error(error);
    process.exit(1);
  });

