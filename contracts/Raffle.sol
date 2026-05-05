// SPDX-LICENSE-IDENTIFIER: MIT
pragma solidity ^0.8.18;

error Raffle__NotEnoughEthSent();

contract Raffle {
    uint256 private immutable i_ticketPrice;
    address payable[] private s_players;

    event RaffleEnter(address indexed player);

    constructor(uint256 _ticketPrice) {
        i_ticketPrice = _ticketPrice;
    }

    function enter() public payable{
        if (msg.value < i_ticketPrice) {
            revert Raffle__NotEnoughEthSent();
        }
        s_players.push(payable(msg.sender));
        emit RaffleEnter(msg.sender);
    }

    // function winner(){}

    function getTicketPrice() public view returns (uint256) {
        return i_ticketPrice;
    }

    function getPlayer(uint256 index) public view returns (address payable) {
        return s_players[index];
    }
}