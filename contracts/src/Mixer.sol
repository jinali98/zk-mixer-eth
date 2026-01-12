// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import {IVerifier} from "./IVerifier.sol";

contract Mixer {
    IVerifier public immutable i_verifier;

    // this is used to map wether a commitment has been added or not
    mapping(bytes32 => bool) public s_commitments;

    uint256 public constant DENOMINATION_AMOUNT = 0.00001 ether;

    //ERRORS
    error Mixer__CommitmentAlreadyExists(bytes32 commitment);
    error Mixer__InvalidDepositAmount(
        uint256 amount,
        uint256 denominationAmount
    );

    constructor(IVerifier _verifier) {
        i_verifier = _verifier;
    }

    /**
    @notice Deposits funds into the mixer
    @param _commitment The poseidon commitment of the nullifier and the secret that generates offchain
    */
    function deposit(bytes32 _commitment) external payable {
        // verify that the commitment is not already in the merkle tree to prevent having the same commitment multiple times (prevent double spending)
        require(
            !s_commitments[_commitment],
            Mixer__CommitmentAlreadyExists(_commitment)
        );
        // allow users to deposit eth and verify that the deposited amount is similar to the fixed amount
        // each contract has a fixed denomination amount
        require(
            msg.value == DENOMINATION_AMOUNT,
            Mixer__InvalidDepositAmount(msg.value, DENOMINATION_AMOUNT)
        );
        // add the commitment to the merkle tree
        s_commitments[_commitment] = true;
    }

    /**
    @notice Withdraws funds from the mixer privately
    @dev This function is used to withdraw funds from the mixer
    @param _proof The proof of the withdrawal which proves that the user knows a valid commitment 
    (this is generated offchain and passed into the contract during the withdrawal)
    @param _recipient The recipient of the withdrawn funds
    */
    function withdraw(uint256 _proof, address _recipient) external {
        // verify that the nullifier is not used already to prevent double spending
        // verify the proof is valid using the verifier contract
        // withdraw the funds from the mixer and send to the recipient
    }
}
