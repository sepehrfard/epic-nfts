
const main = async () => {
	const nftContractFactory = await hre.ethers.getContractFactory('myEpicNFT');
	const nftContract = await nftContractFactory.deploy();
	await nftContract.deployed();
	console.log("Contract deployed to:", nftContract.address);

	let txn = await nftContract.makeAnNFT();

	await txn.wait();
	console.log("Minted NFT #1");

	txn = await nftContract.makeAnNFT();

	await txn.wait();
	console.log("Minted NFT #2");
};

const runMain = async () => {
	try {
		await main();
		process.exit(0);
	} catch {
		console.log(error);
		process.exit(1);
	}
}

runMain();