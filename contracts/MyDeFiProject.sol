// SPDX-License-Identifier: MIT
pragma solidity 0.8.0;
import '../node_modules/@openzeppelin/contracts/token/ERC20/IERC20.sol';
 
contract MyDeFiProject {
  IERC20 dai;
 
  constructor(address daiAddress) {
    // injecter l'address du token Dai à utiliser
    dai = IERC20(daiAddress);
  }
 
  // fonction qui permet d'effectuer un transfer de dai vers le recipient
  function give(address recipient, uint amount) external {
    dai.transfer(recipient, amount);
  }

  // fonction qui permet d'effectuer un transfer de dai vers le recipient
  function giveDai(address recipient, uint amount) external {
    uint valInDai = amount*1000000000000000000; //Careful : no save number
    dai.transfer(recipient, valInDai);
  }

}