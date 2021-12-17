pragma solidity ^0.8.0;

// We first import some OpenZeppelin Contracts.
import "@openzeppelin/contracts/token/ERC721/extensions/ERC721URIStorage.sol";
import "@openzeppelin/contracts/utils/Counters.sol";
import "hardhat/console.sol";

contract MyEpicNFT is ERC721URIStorage {
    // keeps track of tookenIds
    using Counters for Counters.Counter;
    Counters.Counter private _tokenIds;

    constructor() ERC721("SquareNFT", "SQUARE") {
        console.log("This is my NFT contract. Woah!");
    }

    function makeEpicNFT() public {
        // tokenIds begin from 0
        uint256 newItemId = _tokenIds.current();

        // mint nft using sender public id
        _safeMint(msg.sender, newItemId);

        _setTokenURI(newItemId, "NFT minted!");
        _tokenIds.increment();
    }
}
