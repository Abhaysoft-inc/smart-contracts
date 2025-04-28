// SPDX-License-Identifier: MIT
pragma solidity ^0.8;

// contract SimpleBankingContract{

//     uint valueToSend = 1000000000000000000;

//    // iska use karke ham smart contract me eth deposit kara sakte h users se
//    //0x5B38Da6a701c568545dCfcB03FcB875f56beddC4

//     function deposit() external payable {

//     }

//     // chalo ab users ko paise send karte hai

//     // call function use karenge paise send karne ke liye

//     function withdraw(address payable receiver) public {

//         // ye jo hai wo receiver.call {isme ham value daalenge, ("iska matlab hai ki ye kuch calldata retun nahi karega")}

//         (bool success, )= receiver.call{value:valueToSend}("");
//         // iska matlab agar sucess == true hota hai to thik warna agar fail hua to "Payment Failed likh do"
//         require(success, "Payment Failed");

//     }

    
// }



// Chalo dekho ab mai kya karta hoo

contract SimpleBank{

    uint valueToWithdraw = 2000000000000000000;

    mapping(address => uint) balances;

    function deposit() public payable {
        balances[msg.sender] += msg.value;
    }

    function viewUserBalance(address userAddress) public view returns(uint){
        return balances[userAddress];
    }

    function withdraw() public {
        require(balances[msg.sender] >0, "Not enough balance to withdraw");
        balances[msg.sender] = balances[msg.sender] - valueToWithdraw;

        (bool success, ) = msg.sender.call{value:valueToWithdraw}("");
        require(success, "Payment Failed");
    }
}

 