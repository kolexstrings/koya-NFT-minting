 
 const KoyaNft = artifacts.require("KoyaNft");

 module.exports = function(deployer) {
   // Deploy the SolidityContract contract as our only task
   deployer.deploy(KoyaNft);
 };
 