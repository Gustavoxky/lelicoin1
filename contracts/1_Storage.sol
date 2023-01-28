pragma solidity >=0.7.0 <0.9.0;

contract Lelicoin_ico {

    uint public max_lelicoin = 100000000;

    uint public usd_to_lelicoin = 100;

    uint public total_lelicoin_bought = 0;

    mapping(address => uint ) equity_lelicoin;
    mapping(address => uint ) equity_usd;

    modifier can_buy_lelicoin(uint usd_invested) {
        require (usd_invested * usd_to_lelicoin + total_lelicoin_bought <= max_lelicoin);
        _;
    }

    function equity_in_lelicoin(address investor) external returns(uint){
        return equity_lelicoin[investor];
    } 

    function equity_in_usd(address investor) external returns(uint){
            return equity_usd[investor];
    } 

    function buy_lelicoin(address investor, uint usd_invested) external
    can_buy_lelicoin(usd_invested){
        uint lelicoin_bought = usd_invested * usd_to_lelicoin;
        equity_lelicoin[investor] += lelicoin_bought;
        equity_usd[investor] = equity_lelicoin[investor] / 100;
        total_lelicoin_bought += lelicoin_bought;
    }

    function sell_lelicoin(address investor, uint lelicoin_sold) external {
        equity_lelicoin[investor] -= lelicoin_sold;
        equity_usd[investor] = equity_lelicoin[investor] / 100;
        total_lelicoin_bought -= lelicoin_sold;
    }
    




    /**
     * @dev Store value in variable
     * @param num value to store
     */
//     function store(uint num) public {
//         number = num;
//     }

//     /**
//      * @dev Return value 
//      * @return value of 'number'
//      */
//     function retrieve() public view returns (uint){
//         return number;
//     }
}