// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract IMT {
    uint32 public immutable i_depth;

    error IMT_DepthShouldBeGreaterThanZero(uint32 depth);
    error IMT_DepthShouldBeLessThanOrEqualTo32(uint32 depth);

    constructor(uint32 _depth) {
        // this will give limits to the depth of the IMT
        require(_depth > 0, IMT_DepthShouldBeGreaterThanZero(_depth));

        require(_depth <= 32, IMT_DepthShouldBeLessThanOrEqualTo32(_depth));

        i_depth = _depth;

        // initialize the IMT with 0z and precompute IMT subtrees with 0}
    }

    function _insert(bytes32 commitment) internal {}
}
