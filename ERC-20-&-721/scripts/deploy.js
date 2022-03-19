const main = async () => {
  const [owner] = await hre.ethers.getSigners();
  // Deploy myToken Smart Contract
  //   const MyToken = await hre.ethers.getContractFactory("myToken");
  //   const myToken = await MyToken.deploy();

  //   await myToken.deployed();

  //   console.log("myToken contract deployed to:", myToken.address);

  //   let txn = await myToken.buyToken(owner.address, 10, {
  //     value: hre.ethers.utils.parseEther("0.01"),
  //   });

  //   await txn.wait();
  //   console.log("myToken Bought");

  // Deploy myNFT Smart Contract
  const MyNFT = await hre.ethers.getContractFactory("myNFT");
  const myNFT = await MyNFT.deploy();
  await myNFT.deployed();
  console.log("myNFT contract deployed to:", myNFT.address);

  let txn = await myNFT.safeMintNFT();

  await txn.wait();
  console.log("First NFT Minted");

  txn = await myNFT.safeMintNFT();

  await txn.wait();
  console.log("Second NFT Minted");
};

const runMain = async () => {
  try {
    await main();
    process.exit(0);
  } catch (error) {
    console.log(error);
    process.exit(1);
  }
};

runMain();
