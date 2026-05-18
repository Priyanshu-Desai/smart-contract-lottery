// SPDX-LICENSE-IDENTIFIER: MIT
pragma solidity ^0.8.18;

import {VRFConsumerBaseV2Plus} from "@chainlink/contracts/src/v0.8/vrf/dev/VRFConsumerBaseV2Plus.sol";
import "@chainlink/contracts/src/v0.8/interfaces/VRFCoordinatorV2Interface.sol";

error Raffle__NotEnoughEthSent();

contract Raffle is VRFConsumerBaseV2Plus {
    uint256 private immutable i_ticketPrice;
    address payable[] private s_players;
    VRFCoordinatorV2Interface private immutable i_vrfCoordinator;
    bytes32 private immutable i_gasLane;

    event RaffleEnter(address indexed player);

    constructor(address _vrfCoordinator, uint256 _ticketPrice, bytes32 _gasLane) VRFConsumerBaseV2Plus(_vrfCoordinator) {
        i_vrfCoordinator = VRFCoordinatorV2Interface(_vrfCoordinator);
        i_ticketPrice = _ticketPrice;
        i_gasLane = _gasLane;
    }

    function enter() public payable{
        if (msg.value < i_ticketPrice) {
            revert Raffle__NotEnoughEthSent();
        }
        s_players.push(payable(msg.sender));
        emit RaffleEnter(msg.sender);
    }

    function requestWinner() external {
        i_vrfCoordinator.requestRandomWords(
            // Parameters for the VRF request
            i_gasLane,
            subscriptionId,
            requestConfirmations,
            callbackGasLimit,
            numWords
        );
    }

    function fullfillRandomWords(uint256 _requestId, uint256[] memory _randomWords) internal override {
        // Logic to determine the winner using the random words
    }

    function getTicketPrice() public view returns (uint256) {
        return i_ticketPrice;
    }

    function getPlayer(uint256 index) public view returns (address payable) {
        return s_players[index];
    }
}