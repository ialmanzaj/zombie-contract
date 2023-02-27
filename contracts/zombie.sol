//SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.17;


contract ZombieFactory {
    event NewZombie(uint zombieId, string name, uint dna);

    uint dnaDigits = 16;
    uint dnaModulus = 10 ** dnaDigits;

    struct Zombie {
        string name;
        uint dna;
    }
    Zombie[] public zombies;
    uint[10] zombiesDna;

    function _createZombie(string memory _name, uint _dna) private {
        zombies.push(Zombie(_name, _dna));
        uint id = zombies.length - 1;
        emit NewZombie(id, _name, _dna);
    }

    function _multiply(uint a, uint b) private pure returns (uint) {
        return a * b;
    }
    function _generateRandomDna(bytes memory _str) private view returns (uint) {
        uint rand = uint(keccak256(_str));
        return rand % dnaModulus;
    }

    function createRandomZombie(bytes memory _name) public {
        uint randDna = _generateRandomDna(_name);
        return _createZombie(string(_name), randDna);
    }

    function _calcutator() private pure returns (uint) {
        return _multiply(1, 2);
    }
}
