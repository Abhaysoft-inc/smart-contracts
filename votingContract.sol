// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity ^0.8;

contract VotingContract {   

// // are ye to blunder ho gaya, iska matlab ki agar koi ek bhi ne vote kara to dusra user kar hi nahi payega
//     bool isVoted = false;

// iske liye address aur bool se ek mapping create kar lete hain

mapping(address => bool) private  hasVoted;


// candidates ki details ki custom datatype
    struct Candidate {
        string name;
        string party;
        uint8 votes;
    }
// candidates ko ek array me store kara liya
    Candidate[] public candidates ;

//candidates ko pehle se hi load kar liya taki baar baar na karna pade, test ke liye
    // constructor() {
    //     candidates.push(Candidate("Adish", "Congress", 0));
    //     candidates.push(Candidate("Sanjay", "BJP", 0));
    // }

// is function ka use karke naye candidates ko add karenge
    function addCandidate(string calldata _name, string calldata _party) public {

        // ye check karega ki agar aapne blank input field to nahi daal di
        require(
            bytes(_name).length > 0 && bytes(_party).length > 0,
            "Fill all the required fields"
        );

        // candidates wale array me push kar dega
        candidates.push(Candidate(_name, _party, 0));
    }

    // ye saare candidates ko list karega
    function viewCandidates() public view returns (Candidate[] memory) {
        
        return candidates;
    }

    // vote count ka bhi kuch karte h ab


    function giveVote(uint _candidateId) public {

        // check kar rahe hai ki koi mapping msg.sender yani ki address ki hai ya nahi
        require(!hasVoted[msg.sender], "You have already voted!");
        // check kar rahe hai ki candidate id exist karti bhi hai ya nahi
        require(_candidateId < candidates.length, "Invalid candidate ID");
        // candidate ko vote de rahe hain
        Candidate storage c = candidates[_candidateId];
        //gas optimisation buddy

        c.votes +=1;
        // candidates[_candidateId].votes +=1;
        // mappings me address ki hasVoted value to true kar rahe hai taki wo dubara vote na kar paaye
        hasVoted[msg.sender] = true;
    


        // are ye to blunder ho gaya, 
        // iska matlab ki agar koi ek bhi ne vote kara to dusra user kar hi nahi payega
        // require(isVoted==false, "You have already marked your vote!");
        // candidates[_candidateId].votes = candidates[_candidateId].votes +1;
        // isVoted = true;
    }


    
}


/*

 Dekho hame karna kya hai? 

 A aisa contract likhna hai, jisme candidates ho, party ho, no. of votes of candidate - 
 isme kuch candidates predefined honge aur baki ko ham,add kar sakte hai okk
 

 done

 ek address sirf ek vote kar sakta h
 vote++

pehle check karenge ki usne wo kar hai ya nahi - bool isVoted
if false - jis candidate ko vote kare uske me vote+1 kardo aur bool isVoted = false kardo



 */