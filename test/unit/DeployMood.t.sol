//SPDX-License-Identifier: MIT

pragma solidity ^0.8.18;

import {Test,console} from "forge-std/Test.sol";
import {DeployMoodNft} from "../../script/DeployMoodNft.s.sol";
import {Base64} from "@openzeppelin/contracts/utils/Base64.sol";

contract DeployMood is Test {
        DeployMoodNft public deployMoodNft;

        function setUp() external {
            deployMoodNft = new DeployMoodNft();
        }



        function testSvgToImageUri() public view {
        string memory svg = '<svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" width="500" height="500"><text x="0" y="15" fill="black">Hi! Your browser decoded this</text></svg>';

        string memory expectedexSvg = string(abi.encodePacked("data:image/svg+xml;base64,",Base64.encode(bytes(svg))));

        string memory actual = deployMoodNft.svgToImageUri(svg);

        console.log("actual   :", actual);
        console.log("expected :", expectedexSvg);

        assertEq(actual, expectedexSvg);
    }
    


}