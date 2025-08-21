//SPDX-License-Identifier: MIT


pragma solidity ^0.8.18;

import {Script} from "forge-std/Script.sol";
import {BasicNft} from "../src/NftBasic.sol";

contract DeployBasicNft is Script {

    function run() external returns(BasicNft) {
        vm.startBroadcast();   
        BasicNft basicnft = new BasicNft();
        vm.stopBroadcast();
        return basicnft;
    }


}