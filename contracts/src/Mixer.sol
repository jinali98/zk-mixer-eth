// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import {IVerifier} from "./IVerifier.sol";

contract Mixer {
    IVerifier public immutable i_verifier;

    constructor(IVerifier _verifier) {
        i_verifier = _verifier;
    }

    /**
    @notice Deposits funds into the mixer
    @dev This function is used to deposit funds into the mixer
    @param _commitment The poseidon hash of the nullifier and the secret that generates offchain
    */
    function deposit(bytes32 _commitment) external {
        // verify that the commitment is not already in the merkle tree to prevent having the same commitment multiple times
        // allow users to deposit eth and verify that the deposited amount is similar to the fixed amount
        // add the commitment to the merkle tree
    }

    /**
    @notice Withdraws funds from the mixer privately
    @dev This function is used to withdraw funds from the mixer
    @param _proof The proof of the withdrawal which proves that the user knows a valid commitment
    @param _recipient The recipient of the withdrawn funds
    */
    function withdraw(uint256 _proof, address _recipient) external {
        // verify that the nullifier is not used already to prevent double spending
        // verify the proof is valid using the verifier contract
        // withdraw the funds from the mixer and send to the recipient
    }
}
