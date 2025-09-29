// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

/// @title BlockStorage - A simple contract to store and retrieve data on-chain
/// @author 
/// @notice This contract allows users to store text data in a decentralized way
/// @dev Basic CRUD operations on-chain
contract BlockStorage {
    // Mapping to store user data by address
    mapping(address => string) private userData;

    // Event to log whenever data is stored
    event DataStored(address indexed user, string data);

    /// @notice Store text data for the sender
    /// @param _data The string data to store
    function storeData(string memory _data) external {
        userData[msg.sender] = _data;
        emit DataStored(msg.sender, _data);
    }

    /// @notice Retrieve data stored by the sender
    /// @return The string data associated with the sender
    function getMyData() external view returns (string memory) {
        return userData[msg.sender];
    }

    /// @notice Retrieve data of any user (public lookup)
    /// @param _user The address of the user whose data you want to fetch
    /// @return The string data stored by that user
    function getUserData(address _user) external view returns (string memory) {
        return userData[_user];
    }
}
