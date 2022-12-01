import { useState } from 'react'
import './App.css'
import Web3Modal from 'web3Modal';
import { ethers, Contract } from 'ethers';

const { abi } = require ('./artifacts/contracts/koyaNft.json');

function App() {

  const initWeb3 = async () => {
    return new Promise(async (resolve, reject) => {

      const web3Modal = new Web3Modal ({

        cacheProvider: true
      });

      const connection = await web3Modal.connect();

      const provider = new ethers.providers.Web3Provider(connection);

      const { chainId } = await provider.getNetwork();

      const signer = provider.getSigner();

      const contract = new Contract('deployedContractAddress',
       abi,
       signer);

       resolve({contract});

    })
  }

  return (
    <div className="App">

    </div>
  )
}

export default App
