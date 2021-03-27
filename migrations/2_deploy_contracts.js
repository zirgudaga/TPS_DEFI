const Dai = artifacts.require("Dai");
const MyDeFiProject = artifacts.require("MyDeFiProject");
 
module.exports = async function(deployer, _network, accounts) {
  await deployer.deploy(Dai);
  const dai = await Dai.deployed();
  await deployer.deploy(MyDeFiProject, dai.address);
  const myDeFiProject = await MyDeFiProject.deployed();
  await dai.faucetDai(myDeFiProject.address, 100);
  await myDeFiProject.giveDai(accounts[1], 100);

  const balance0 = await dai.balanceOf(myDeFiProject.address);
  const balance1 = await dai.balanceOf(accounts[1]);

  console.log(myDeFiProject.address, " : ", balance0.toString());
  console.log(accounts[1], " : ", balance1.toString());
};