# Blockchain-RPG Contract

## Vision

The `Blockchain-RPG` smart contract is designed to manage and track player achievements in role-playing games (RPGs). This contract allows players to register, earn achievements, and view their progress. It utilizes a bitmask to efficiently store and update achievement data, making it scalable for games with a large number of achievements.

## Flowchart

```plaintext
+--------------------------+
|  Player Registers        |
|                          |
|  - Call registerPlayer() |
|                          |
+-----------+-----------+--+
            |
            v
+---------------------------------+
| Store Player Data               |
|                                 |
|  - Assign unique ID             |
|  - Store player name            |
|  - Initialize achievements to 0 |
+-----------+---------------------+
            |
            v
+---------------------------+
|  Player Earns             |
|  Achievement              |
|                           |
|  - Call earnAchievement() |
|                           |
+-----------+---------------+
            |
            v
+-----------------------------+
| Update Achievement          |
| Bitmask                     |
|                             |
|  - Set the bit for          |
|    the specific achievement |
+-----------+-----------------+
            |
            v
+---------------------------+
| Emit AchievementEarned    |
| Event                     |
|                           |
|  - Notify listeners       |
|    of the new achievement |
+---------------------------+
```

## Contract Address

- **Contract Address**: 0xDbcd18054F5fd4d371ABDB7178FD92D2234129C8

## Future Scope

1. **Achievement Removal**: Add functionality to remove achievements and emit corresponding events.
2. **Achievement Queries**: Implement functions to check for specific achievements and to fetch achievements for a player.
3. **Player Management**: Introduce administrative functions for managing players and their achievements.
4. **Enhanced Security**: Improve access control and error handling to ensure robust contract interactions.
5. **UI Integration**: Develop a user interface to interact with the contract and visualize achievements.

## Contact Details

For questions or contributions, please reach out:

- **Name**: Shubhadeep Dutta
- **Email**: sd.shubhadeep@gmail.com
- **GitHub**: https://github.com/Jazz0P

---

Thank you for exploring the `Blockchain-RPG` contract! Your feedback and contributions are welcome.
