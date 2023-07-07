// SPDX-License-Identifier: MIT
pragma solidity 0.8.10;

import "./OwningNFT.sol";

/**
* @notice Service address should be a secure P2P address, not zero.
*/
error ClRewardsReceiver__NotNFTOwner(address _address);

contract ClRewardsReceiver {
    OwningNFT public s_owningNFT;
    uint96 public s_lastNFTOwnerIndex;

    constructor(OwningNFT _owningNFT, uint96 _lastNFTOwnerIndex) {
        s_owningNFT = _owningNFT;
        s_lastNFTOwnerIndex = _lastNFTOwnerIndex;
    }

    receive() external payable {
        // allow receiving ETH from regular transactions
    }

    function withdraw() external {
        address ownerOfNft = s_owningNFT.ownerOf(0);
        if (msg.sender != ownerOfNft) {
            revert ClRewardsReceiver__NotNFTOwner(msg.sender);
        }

        //ownerOfNft.call
    }
}
