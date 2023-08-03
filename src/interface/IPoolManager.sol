// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.19;
import {PoolKey} from "../types/PoolKey.sol";
import {BalanceDelta} from "../types/BalanceDelta.sol";

interface IPoolManager {
    struct ModifyPositionParams {
        int24 tickLower;
        int24 tickUpper;
        int256 liquidityDelta;
    }

    struct SwapParams {
        bool zeroForOne;
        int256 amountSpecified;
        uint160 sqrtPriceLimitX96;
    }

    function modifyPosition(
        PoolKey memory key,
        ModifyPositionParams memory params
    ) external returns (BalanceDelta);
}
