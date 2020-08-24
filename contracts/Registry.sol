pragma solidity 0.6.4;

import "./IRegistry.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract TradingChannelRegistry is IRegistry, Ownable {
    mapping(address => bool) public override inRegistry;
    address[] public override entries;

    function addTradingChannel(address _tradingChannel) external override onlyOwner {
        require(!inRegistry[_tradingChannel], "TradingChannelRegistry.addTradingChannel: POOL_ALREADY_IN_REGISTRY");
        entries.push(_tradingChannel);
        inRegistry[_tradingChannel] = true;
    }

    function removeTradingChannel(uint256 _index) external override onlyOwner {
        address registryAddress = entries[_index];

        inRegistry[registryAddress] = false;

        // Move last to index location
        entries[_index] = entries[entries.length - 1];
        // Pop last one off
        entries.pop();
    }

}