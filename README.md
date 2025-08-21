# 🐶 Basic NFT (Dogie)

A simple **ERC721 NFT smart contract** built in Solidity using [OpenZeppelin](https://docs.openzeppelin.com/contracts/4.x/).  
This contract lets anyone mint unique NFTs with custom metadata URIs.  

---

## 📌 Features
- Built on **ERC721 standard**  
- Mint NFTs with custom metadata URIs (e.g. IPFS, Arweave)  
- Sequential token IDs using a counter  
- Custom `tokenURI` mapping to store metadata  

---

## 🛠️ Tech Stack
- Solidity `^0.8.18`  
- [Hardhat](https://hardhat.org/) (deployment & testing)  
- [OpenZeppelin Contracts](https://github.com/OpenZeppelin/openzeppelin-contracts)  
- JavaScript/TypeScript for scripts & tests  

---
## Foundry

**Foundry is a blazing fast, portable and modular toolkit for Ethereum application development written in Rust.**

Foundry consists of:

-   **Forge**: Ethereum testing framework (like Truffle, Hardhat and DappTools).
-   **Cast**: Swiss army knife for interacting with EVM smart contracts, sending transactions and getting chain data.
-   **Anvil**: Local Ethereum node, akin to Ganache, Hardhat Network.
-   **Chisel**: Fast, utilitarian, and verbose solidity REPL.

## Documentation

https://book.getfoundry.sh/

## Usage

### Build

```shell
$ forge build
```

### Test

```shell
$ forge test
```

### Format

```shell
$ forge fmt
```

### Gas Snapshots

```shell
$ forge snapshot
```

### Anvil

```shell
$ anvil
```

### Deploy

```shell
$ forge script script/Counter.s.sol:CounterScript --rpc-url <your_rpc_url> --private-key <your_private_key>
```

### Cast

```shell
$ cast <subcommand>
```

### Help

```shell
$ forge --help
$ anvil --help
$ cast --help
```
