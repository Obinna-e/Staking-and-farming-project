pragma solidity ^0.6.0;

import "./ERC20.sol";
import "./mDai.sol";

contract TokenFarm{
    string public name = "Normi Token Farm";
    NormiToken public nrmToken;
    DaiToken public daiToken;
    address public owner;

    mapping(address=>uint) public stakingBalance;
    mapping(address=>bool) public hasStaked;
    mapping(address=>bool) public isStaking;
    address[] public staker;

    constructor (DaiToken _mDai, NormiToken _Normi) public{
        nrmToken = _Normi;
        daiToken = _mDai;
        owner = msg.sender; //address of contract owner
    }

    // @param
    function stakeToken(uint _amount) public {
        //check, amount should be greater than zero. There should be some tokens to be staked.
        require(_amount>0,"amount needs to be more than 0");

        
        // this refers to the instance of the contract where the call is made (you can have multiple instances of the same contract).
        // address(this) refers to the address of the instance of the contract where the call is being made.
        // msg. sender refers to the address where the contract is being called from.
        // @param _amount, the amount of tokens you want to stake.
        daiToken.transferFrom(msg.sender, address(this), _amount);

        //The balance of the owner of the contract, after staking the coins.
        stakingBalance[msg.sender] = stakingBalance[msg.sender] + _amount;

        if(!hasStaked[msg.sender]){
            staker.push(msg.sender);
        }
        isStaking[msg.sender] = true;
        hasStaked[msg.sender] = true;
    }

     //require checks if the condition is true, thows the exceptionotherwise 'trader is not owner'.
    //if the require condition is true, then all the tokens that are staked, are unstaked .
    function unstakeToken() public {
        require(isStaking[msg.sender] == true, "You have nothing to unstake.");
        uint balance = stakingBalance[msg.sender];
        stakingBalance[msg.sender] = 0;
        daiToken.transfer(msg.sender, balance);
        isStaking[msg.sender] = false;
    }
    //@param _owner is the address of the owner which is msg.sender
   // returns the staking balance
   function stakeAmount(address _owner) public view returns(uint) {
       return stakingBalance[_owner];
   }

    function issueToken() public {
        require(msg.sender == owner, "trader is not owner");
        for(uint i = 0; i < staker.length; i++) {
            address recipient = staker[i];
            if(isStaking[recipient] == true) {
                uint balance = stakingBalance[recipient];
                nrmToken.transfer(recipient, balance);
            }
        }
    }


}
