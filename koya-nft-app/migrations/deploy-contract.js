 const koyaNft = artifacts.require('koyaNft');

 module.export = function (deployer) {
    deployer.deploy(koyaNft);
 };