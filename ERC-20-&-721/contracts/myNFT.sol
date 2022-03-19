//SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

import "@openzeppelin/contracts/token/ERC721/extensions/ERC721URIStorage.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/utils/Counters.sol";
import {Base64} from "./Base64.sol";

contract myNFT is ERC721URIStorage {
    using Counters for Counters.Counter;
    Counters.Counter private _tokenIdCounter;
    
    constructor() ERC721 ("myNFT", "MNT") {

    }

    function safeMintNFT() public {
        
    uint256 tokenId = _tokenIdCounter.current();
    uint256 param = tokenId++;
    _safeMint(msg.sender, tokenId);
    string memory serialNo = string(abi.encodePacked(param, ".", "svg"));

    string memory userInput = string(
                abi.encodePacked(
                    "data:application/json;base64,",
                    Base64.encode(
                        bytes(
                            abi.encodePacked(
                                '{"name": "MyNFT", "description": "This is our on-chain NFT", "image":"',
                                "https://ipfs.io/ipfs/QmPPPKrHt7RCSnCrPyVY5Lxun44qFm5qkU47WjQwASBdfJ",
                                serialNo,
                                '"}'
                            )
                        )
                    )
                )
            );
    _setTokenURI(tokenId, userInput);

     _tokenIdCounter.increment();

    }
}