// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity 0.8.17;

contract Car {
    string public brand;
    string public model;
    uint public year;
    address public owner;

    constructor(string memory _brand, string memory _model, uint _year) {
        brand = _brand;
        model = _model;
        year = _year;
        owner = msg.sender;
    }

    function changeOwner(address newOwner) public {
        require(msg.sender == owner, "Only the current owner can change the owner");
        owner = newOwner;
    }

    function getCarInfo() public view returns (string memory, string memory, uint, address) {
        return (brand, model, year, owner);
    }
}