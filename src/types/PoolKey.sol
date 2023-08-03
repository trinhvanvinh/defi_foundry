// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.19;

import {Currency} from "./Currency.sol";

struct PoolKey {
    Currency currency0;
    Currency currency1;
    uint24 fee;
    int24 tickSpacing;
}
