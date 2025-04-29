// SPDX-License-Identifier: MIT
pragma solidity ^0.8;


contract CrowdFunding{

    mapping (string => uint) balance; // saves balances using names

    struct Campaign{
        string campaignName;
        uint goalAmount;
        uint currentBalance;
    }

    Campaign[] public campaigns;

    function createCampaign(string memory _campaignName, uint _goalAmount  ) public {
        Campaign memory newCampaign = Campaign({
            campaignName:_campaignName,
            goalAmount:_goalAmount,
            currentBalance:0
        });

        campaigns.push(newCampaign);

    }

    function donate(string memory _name) payable public {
        
    }
    


    

   

}