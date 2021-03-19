pragma solidity ^0.5.0;

contract SolidityDrive {
    struct File {
        string hash;
        string fileName;
        string fileType;
        uint date;
    }

    mapping(address => File[]) files;

    function add(string memory _hash, string memory _fileName, string memory _fileType, uint _date) public {
        files[msg.sender].push(File({hash: _hash, fileName: _fileName, fileType: _fileType, date: _date}));
    }

  //pb with solidity: we cannot return a struct, we need to call each indiv. file one by one
    function getFile(uint _index) public view returns(string memory, string memory, string memory, uint) {
        File memory file = files[msg.sender][_index];
        return (file.hash, file.fileName, file.fileType, file.date);
    }
    
// because in the front end we will need that for calling each file (for loop)
    function getLength() public view returns(uint) {
        return files[msg.sender].length;
    }
}