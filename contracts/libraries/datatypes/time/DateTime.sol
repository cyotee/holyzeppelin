// SPDX-License-Identifier: AGPL-3.0-or-later
pragma solidity 0.7.4;

import "hardhat/console.sol";

import "./../../../utils/math/SafeMath.sol";

library DateTime {

    using SafeMath for uint16;
    using SafeMath for uint8;

    struct DateTime {
        uint16 year;
        uint8 month;
        uint8 day;
        uint8 hour;
        uint8 minute;
        uint8 second;
        uint8 weekday;
    }
}