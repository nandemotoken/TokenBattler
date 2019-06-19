
// Copyright (c) 2019 NandemoToken
// Distributed under the MIT software license, see the accompanying
// file COPYING or http://www.opensource.org/licenses/mit-license.php.


pragma solidity ^0.5.2;

import "github.com/OpenZeppelin/openzeppelin-solidity/contracts/token/ERC20/ERC20.sol";
import "github.com/OpenZeppelin/openzeppelin-solidity/contracts/token/ERC20/ERC20Detailed.sol";
import "github.com/OpenZeppelin/openzeppelin-solidity/contracts/token/ERC20/ERC20Burnable.sol";

contract Zorome is ERC20, ERC20Detailed , ERC20Burnable{

bool dummy_for_debug;

        constructor()   ERC20Detailed("Zorome", "ZORO", 0) public {
            dummy_for_debug = true;
    }


        function blockNumber() public view returns(uint){
            return block.number;
        }

        function getOnesPlace() public view returns(uint){
            return block.number - (block.number / 10 * 10) ;
        }

        function getTensPlace() public view returns(uint){
            return (block.number / 10) - (block.number / 100 * 10) ;
        }

        function getHundredsPlace() public view returns(uint){
            return (block.number / 100) - (block.number / 1000 * 10) ;
        }

        function getThousandPlace() public view returns(uint){
            return (block.number / 1000) - (block.number / 10000 * 10) ;
        }

        function getTenThousandPlace() public view returns(uint){
            return (block.number / 10000) - (block.number / 100000 * 10) ;
        }

        function getHundredThousandPlace() public view returns(uint){
            return (block.number / 100000) - (block.number / 1000000 * 10) ;
        }

        function getMillionPlace() public view returns(uint){
            return (block.number / 1000000) - (block.number / 10000000 * 10) ;
        }

        function getTenMillionPlace() public view returns(uint){
            return (block.number / 10000000) - (block.number / 100000000 * 10) ;
        }

        function isZorome() public view returns(uint){
            if( getOnesPlace() == getTensPlace() ){
                if ( getTensPlace() == getHundredsPlace() ){
                    if ( getHundredsPlace() == getThousandPlace() ){
                        if (getThousandPlace() == getTenThousandPlace()){
                            if (getTenThousandPlace() == getHundredThousandPlace()){
                                if(getHundredThousandPlace() == getMillionPlace()){
                                    if(getMillionPlace() == getTenMillionPlace()){
                                        return 7;
                                    }
                                    return 6;
                                }
                                return 5;
                            }
                            return 4;
                        }
                        return 3;
                    }
                    return 2;
                }
                return 1;
            }
        }

         function zoromeChallenge() public {
             if( balanceOf(msg.sender) > 0 && isZorome() == 0 ){
             _burn(msg.sender, 1);
             }
             if( isZorome() > 0){
                 _mint(msg.sender , 10 ** ( isZorome() -1 ) );
             }
         }
 
        function myScore() public view returns(uint){
            return balanceOf(msg.sender);
        }
        
        function debug() public {
            dummy_for_debug = false;
        }

}
