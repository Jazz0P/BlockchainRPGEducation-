// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract RPGAchievements {
    // Struct to store player information
    struct Player {
        uint256 id;
        string name;
        uint256 achievements; // Bitmask to represent achievements
    }

    // State variables
    mapping(address => Player) public players;
    mapping(uint256 => address) public playerById;
    uint256 public nextPlayerId;

    // Events
    event PlayerRegistered(address indexed playerAddress, string playerName);
    event AchievementEarned(address indexed playerAddress, uint256 achievementId);

    // Modifier to check if the player is registered
    modifier onlyRegisteredPlayer() {
        require(bytes(players[msg.sender].name).length > 0, "Player not registered.");
        _;
    }

    // Register a new player
    function registerPlayer(string memory _name) public {
        require(bytes(players[msg.sender].name).length == 0, "Player already registered.");
        
        players[msg.sender] = Player(nextPlayerId, _name, 0);
        playerById[nextPlayerId] = msg.sender;
        nextPlayerId++;

        emit PlayerRegistered(msg.sender, _name);
    }

    // Assign an achievement to a player
    function earnAchievement(uint256 _achievementId) public onlyRegisteredPlayer {
        require(_achievementId < 256, "Invalid achievement ID."); // Ensure the achievement ID fits in a bitmask

        Player storage player = players[msg.sender];
        player.achievements |= (1 << _achievementId); // Set the corresponding bit for the achievement

        emit AchievementEarned(msg.sender, _achievementId);
    }

    // Retrieve player's achievements
    function getPlayerAchievements(address _playerAddress) public view returns (uint256) {
        return players[_playerAddress].achievements;
    }

    // Retrieve player information by address
    function getPlayerByAddress(address _playerAddress) public view returns (uint256, string memory, uint256) {
        Player memory player = players[_playerAddress];
        return (player.id, player.name, player.achievements);
    }

    // Retrieve player information by ID
    function getPlayerById(uint256 _playerId) public view returns (address, string memory, uint256) {
        address playerAddress = playerById[_playerId];
        Player memory player = players[playerAddress];
        return (playerAddress, player.name, player.achievements);
    }
}
