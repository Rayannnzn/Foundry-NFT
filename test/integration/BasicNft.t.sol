//SPDX-License-Identifier: MIT 

pragma solidity ^0.8.18;


import {BasicNft} from "../../src/NftBasic.sol";
import {DeployBasicNft} from "../../script/DeployBasicNft.s.sol";
import {Test} from "forge-std/Test.sol";

contract TestBasicNft is Test {
        DeployBasicNft public deploy;
        BasicNft public basicnft;

    address USER = makeAddr("user");
    string public PUG = "ipfs://bafybeig37ioir76s7mg5oobetncojcm3c3hxasyd4rvid4jqhy4gkaheg4/?filename=0-PUG.json";

    function setUp() public {
        deploy = new DeployBasicNft();
        basicnft = deploy.run();
    }


    // Here We are Comparing the Hashes (Not Strings)
    function testNameCheck() public view {
        string memory expectedname = "Dogie";
        string memory actualname = basicnft.name();
        assert(keccak256(abi.encodePacked(expectedname)) == keccak256(abi.encodePacked(actualname)));
    }

    function testCanMintAndhaveBalance() public {
        vm.prank(USER);
        basicnft.mintNFT(PUG);

        assert(basicnft.balanceOf(USER) == 1);
        assert(keccak256(abi.encodePacked(PUG)) == keccak256(abi.encodePacked(basicnft.tokenURI(0))));
    }






}

