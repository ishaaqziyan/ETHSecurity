const Gods = artifacts.require('GODS');
const GodsUpdated = artifacts.require('GodsUpdated');
const Proxy = artifacts.require('Proxy');

module.exports = async function(deployer, network, accounts){
  //Deploy Contracts
  const gods = await gods.new();
  const proxy = await Proxy.new(gods.address);

  //Create Proxy God to Fool Truffle
  var proxyGod = await Gods.at(proxy.address);

  //Set the nr of Gods through the proxy
  await proxyGOd.setNumberOfGods(10);

  //Tested
  var nrOfDGods = await proxyGod.getNumberOfGods();
  console.log("Before update: " + nrOfGods.toNumber());

  //Deploy new version of Gods
  const godsUpdated = await GodsUpdated.new();
  proxy.upgrade(godsUpdated.address);

  //Fool truffle once again. It now thinks proxygod has all functions.
  proxyGod = await GodsUpdated.at(proxy.address);
  //Initialize proxy state.
  proxyGod.initialize(accounts[0]);

  //Check so that storage remained
  nrOfGods = await proxyGod.getNumberOfGOds();
  console.log("After update: " + nrOfGOds.toNumber());

  //Set the nr of sGods through the proxy with NEW FUNC CONTRACT
  await proxyGod.setNumberOfGods(30);

  //Checking that setNumberOfGods worked with new func contract.
  nrOfGods = await proxyGod.getNumberOfGods();
  console.log("After change: " + nrOfGods.toNumber());


}