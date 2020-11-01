# Scaling To Higher

#### Shared Memory Architecture
- Many CPUs, many RAM chips, and many disks can be joined together under one operating system, and a fast interconnect allows any CPU to access any part of the memory or disk
- **Problems**:

  + is that the cost grows faster than linearly: a machine with twice as many CPUs, twice as much RAM, and twice as much disk capacity as another typically costs significantly more than twice as much
  + offer limited fault tolerance

#### shared-disk architecture
- uses several machines with independent CPUs and RAM, but stores data on an array of disks that is shared between the machines, which are connected via a fast network
- **Problems**: contention and the overhead of locking limit the scalability of the shared-disk approach

#### Shared-Nothing Architectures
- Horizontal Scale or Scale Out architecture
- **Problems**: additional complexity for applications


## Replication Versus Partitioning

- **Replication:** Keeping a copy of the same data on several different nodes,
- **Partitioning** Splitting a big database into smaller subsets called partitions

#### Replications:
- Single leader: RethinkDB, MySQl, Postgresql, MongoDb, ...
- Muli Leader: CouchDB, ...
- Leaderless: Casandra, Voldermort, ...

- Synchronous Versus Asynchronous Replication
- Handling Node Outages

  + Follow Failure: Catch-Up recovery
  + Leader Failure: Failover

**Failover is fraught with things that can go wrong**

  + Asynchronous replication take lead may not have received all the writes from old leader. It causes conflicts write data. The most common solution is for the old leader’s unreplicated writes to simply be discarded, which may violate clients’ durability expectations.
  + Discarding writes is especially dangerous if other storage systems outside of the database need to be coordinated with the database contents. Example: Github, and out-of-date MySQL follower was promoted to leader, but because id of database is used with redis store. Resue of primary keys results in inconsitency between MySQL and Redis, which cause sone private data to be disclosed to the wrong users.
  + Both not belive they are the leaders (split brain issue) => cause conflict data.
  + What is the right time out before the leader is declared dead? Longer time => longer recovery. Short time cause unnecessary failovers.

### Implementation of Replication Logs**

#### Statement-base replication

Every write request that is executed will send statement log to its follower.

**Various ways in which this approach to replication can break down**:

- Function such as NOW(), RAND() is likely to generate different value on each replica.
- If statement use autoincrementing column, they must execute in exactly the same order on replica.
- Statements that have side effects (e.g., triggers, stored procedures, user-defined functions) may result in different side effects occurring on each replica, unless the side effects are absolutely deterministic.

#### WRITE-AHEAD LOG (WAL) SHIPPING
- besides writing the log to disk, the leader also sends it across the network to its followers.
- This method of replication is used in PostgreSQL and Oracle, among others
- The main disadvantage is that the log describes the data on a very low level: a WAL contains details of which bytes were changed in which disk blocks. This makes replication closely coupled to the storage engine.

#### LOGICAL (ROW-BASED) LOG REPLICATION

A logical log for a relational database is usually a sequence of records describing writes to database tables at the granularity of a row:

  - For an inserted row, the log contains the new values of all columns.
  - For a deleted row, the log contains enough information to uniquely identify the row that was deleted. Typically this would be the primary key, but if there is no primary key on the table, the old values of all columns need to be logged.
  - For an updated row, the log contains enough information to uniquely identify the updated row, and the new values of all columns (or at least the new values of all columns that changed).

#### TRIGGER-BASED REPLICATION

  - This approach is moving replication to application layer
  - This can use when you only want replicate a subset of data
  - Some tools: Oracle GoldenGate
  - Trigger-based replication typically has greater overheads than other replication methods, and is more prone to bugs and limitations than the database’s built-in replication. However, it can be useful due to its flexibility.