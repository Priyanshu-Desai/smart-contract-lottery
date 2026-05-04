// SPDX-LICENSE-IDENTIFIER: MIT
pragma solidity ^0.8.18;

contract Raffle {
    uint256 private immutable i_ticketPrice;

    constructor(uint256 _ticketPrice) {
        i_ticketPrice = _ticketPrice;
    }

    function enter(){}

    // function winner(){}

    function getTicketPrice() public view returns (uint256) {
        return i_ticketPrice;
    }
}