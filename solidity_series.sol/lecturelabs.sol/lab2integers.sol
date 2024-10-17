// SPDX-License-Identifier: MIT
// compiler version must be greater than or equal to 0.8.17 and less than 0.9.0
pragma solidity ^0.8.0;

contract IntRanges {

    // Minimum and maximum of int8
    int8 public minInt8 = type(int8).min;
    int8 public maxInt8 = type(int8).max;

    // Minimum and maximum of int16
    int16 public minInt16 = type(int16).min;
    int16 public maxInt16 = type(int16).max;

    // Minimum and maximum of int32
    int32 public minInt32 = type(int32).min;
    int32 public maxInt32 = type(int32).max;

    // Minimum and maximum of int256 (or int)
    int256 public minInt256 = type(int256).min;
    int256 public maxInt256 = type(int256).max;

    // Minimum and maximum of uint8
    uint8 public minUint8 = type(uint8).min;
    uint8 public maxUint8 = type(uint8).max;

    // Minimum and maximum of uint16
    uint16 public minUint16 = type(uint16).min;
    uint16 public maxUint16 = type(uint16).max;

    // Minimum and maximum of uint32
    uint32 public minUint32 = type(uint32).min;
    uint32 public maxUint32 = type(uint32).max;

    // Minimum and maximum of uint256 (or uint)
    uint256 public minUint256 = type(uint256).min;
    uint256 public maxUint256 = type(uint256).max;
}
