# Caching and Persistency

|               Method              |        Use        |
|:--------------------------------- |:-----------------:|
|**UserDefaults**                   | Quickly persist small bits of data (top score in a game, player nickname, music on/off etc)     |
|**Codable**                        | Flash freeze custom objects and store in the app directory     |
|**Keychain**                       | Save small bits of data security     |
|**SQLite**                         | Persist large amounts of data and query it     |
|**Core Data**                      | Object-oriented database     |
|**Realm**                          | A faster and easier database solution     |
