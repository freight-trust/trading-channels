pragma solidity 0.6.4;

interface IRegistry {
    function inRegistry(address _channel) external view returns(bool);
    function entries(uint256 _index) external view returns(address);
    function addTradingChannel(address _tradingChannel) external;
    function removeTradingChannel(uint256 _index) external;
}