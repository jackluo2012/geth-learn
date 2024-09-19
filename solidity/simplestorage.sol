// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity  >0.8.6;

contract SimpleStorage {
    uint256 favoriteNumber;

    function store(uint256 _favoriteNumber) public {
        favoriteNumber = _favoriteNumber;
    }

    function retrieve() public view returns (uint256) {
        return favoriteNumber;
    }
    uint myData;
    function set(uint _myData) public {
        myData = _myData;
    }
    function get() public view returns (uint) {
        return myData;
    }
}

// 1. Deploy the contract
// 2. Call the retrieve function
// 3. Call the store function and send a transaction with the value 42
// 4. Call the retrieve function again and see the result