// SPDX-License-Identifier: GPL-2.0-or-later
pragma solidity ^0.8.19;

import {PoolKey} from "./PoolKey.sol";

type PoolId is bytes32;

library PoolIdLibrary {
    function toId(PoolKey memory poolKey) internal pure returns (PoolId) {
        return PoolId.wrap(keccak256(abi.encode(poolKey)));
    }
}
