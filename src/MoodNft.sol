//SPDX-License-Identifier: MIT

pragma solidity ^0.8.18;

import {ERC721} from "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import {Base64} from "@openzeppelin/contracts/utils/Base64.sol";

contract MoodNft is ERC721 {

    //errors

    error MoodNft__CantFlipIfNotOwner();


    enum MOOD {
      HAPPY,
      SAD
    }


    uint256 private s_tokenCounter;
    mapping (uint256 => MOOD) private s_tokenIdtoMood;
    string private s_sadSvgImageUri;
    string private s_happySvgImageUri;


    constructor(string memory sadSvgImageUri,string memory happySvgImageUri) ERC721("Mood Nft","Mood"){
        s_tokenCounter = 0;
        s_sadSvgImageUri = sadSvgImageUri;
        s_happySvgImageUri = happySvgImageUri;
    }

    function mintNft() public {
        _safeMint(msg.sender,s_tokenCounter);
        s_tokenIdtoMood[s_tokenCounter] = MOOD.HAPPY;
        s_tokenCounter++;
    }

    function FlipMood(uint256 tokenId) public {
        address owner = _ownerOf(tokenId);
        if(!_isAuthorized(owner,msg.sender,tokenId)){
          revert MoodNft__CantFlipIfNotOwner();
        }
        if(s_tokenIdtoMood[tokenId] == MOOD.HAPPY){
          s_tokenIdtoMood[tokenId] = MOOD.SAD;
        }
        else{
          s_tokenIdtoMood[tokenId] = MOOD.HAPPY;
        }
    }


    function _baseURI() internal pure override returns(string memory){
        return "data:application.json:base64,";
    }

    function tokenURI(uint256 tokenId) public view override returns(string memory){
          string memory imageUri;

          if(s_tokenIdtoMood[tokenId] == MOOD.HAPPY ){
            imageUri = s_happySvgImageUri;
          }

          else{
            imageUri = s_sadSvgImageUri;
          }

      return string(abi.encodePacked(_baseURI(),Base64.encode(bytes(abi.encodePacked(
            '{"name":"', name(), '",',
            '"description":"An NFT that reflects the owners mood.",',
            '"attributes":[{"trait_type":"moodiness","value":100}],',
            '"image":"', imageUri, '"}'
              )))));
          }


}