//SPDX-License-Identifier:MIT

pragma solidity ^0.8.17;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";

contract KoyaNft is ERC721 {

    address public owner;
    uint256 tokenId = 1; 

    struct Koya {
        uint tokenId;
        string tokenName;
        address owner; 
    }

    Koya[] public allTokens;

    mapping(address => Koya[]) public tokenAddress;
    mapping(string => bool) public tokenExists;

    constructor() ERC721("KoyaNft", "KYN") {

        owner = msg.sender;

    }

    function getAllTokens() public view returns (Koya[] memory) {
        return allTokens;
    }

    function getMyTokens() public view returns (Koya[] memory) {
        return tokenAddress[msg.sender];
    }

    function mintToken(string calldata _tokenName) public payable {
        require(!tokenExists[_tokenName], " Sorry token already exists");

        _safeMint(msg.sender, tokenId);

        allTokens.push(Koya(tokenId, _tokenName, msg.sender));

        tokenAddress[msg.sender].push(Koya(tokenId,
        _tokenName,
        msg.sender));

        tokenExists[_tokenName] = true;

        tokenId++;
    }
}