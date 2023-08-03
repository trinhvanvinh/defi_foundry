// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.19;

type BalanceDelta is int256;
using BalanceDeltaLibrary for BalanceDelta;

function toBalanceDelta(
    int128 _amount0,
    int _amount1
) pure returns (BalanceDelta balanceDelta) {
    assembly {
        balanceDelta := or(
            shl(128, _amount0),
            and(
                0x00000000000000000000000000000000ffffffffffffffffffffffffffffffff,
                _amount1
            )
        )
    }
}

function add(BalanceDelta a, BalanceDelta b) pure returns (BalanceDelta) {
    return toBalanceDelta(a.amount0() + b.amount0(), a.amount1() + b.amount1());
}

function sub(BalanceDelta a, BalanceDelta b) pure returns (BalanceDelta) {
    return toBalanceDelta(a.amount0() - b.amount0(), a.amount1() - b.amount1());
}

library BalanceDeltaLibrary {
    function amount0(
        BalanceDelta balanceDelta
    ) internal pure returns (int128 _amount0) {
        assembly {
            _amount0 := shr(128, balanceDelta)
        }
    }

    function amount1(
        BalanceDelta balanceDelta
    ) internal pure returns (int128 _amount1) {
        assembly {
            _amount1 := balanceDelta
        }
    }
}
