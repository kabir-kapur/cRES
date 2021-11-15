const Web3 = require('web3');
const XMLHttpRequest = require("xmlhttprequest").XMLHttpRequest;
const Oracle = require('./build/contracts/Oracle.json');
// const Migrations = require('/build/contracts/Migrations.json');

const xhr = new XMLHttpRequest();

// web3.eth.defaultAccount = web3.eth.accounts[0];

const init = async() => {
    const web3 = new Web3('https://alfajores-forno.celo-testnet.org'); // alfajores Web3 instance
    const id = await web3.eth.net.getId(); // alfajores id
    const deployedNetwork = Oracle.networks[id];
    const oracleContract = new web3.eth.Contract(Oracle.abi, "0x7A30623eBF8E5C0eb1B02db808d06b5971CdA071");
    const addresses = await web3.eth.getAccounts();
    const receipt = await oracleContract.methods.emitEvent('hey there beastly').send({
        from: addresses[0]
    });

    console.log(receipt.events)
}

init();




// listen for requested request
// send api call out 
// get data back
// transact relevant data back to client contract 


