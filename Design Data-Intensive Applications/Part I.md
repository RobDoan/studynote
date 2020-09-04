High percentiles of response times, also known as tail **latencies**, are important because they directly affect users’ experience of the service.
For example, Amazon describes response time requirements for internal services in terms of the 99.9th percentile, even though it only affects 1 in 1,000 requests. This is because the customers with the slowest requests are often those who have the most data on their accounts because they have made many purchases—that is, they’re the most valuable customers

Amazon has also observed that a 100 ms increase in response time reduces sales by 1% [20], and others report that a 1-second slowdown reduces a customer satisfaction metric by 16%

**service level objectives** (SLOs) and **service level agreements** (SLAs).
An SLA may state that the service is considered to be up if it has a median response time of less than 200ms and a 99th percentile under 1s.

Scale:
  - Scale Up(veritcal scale) - moveing to a more powerful machine
  - Scale out(horizontal Scale) Distributing the load across multiple smaller machines.
  - In reality, good architectures usually involve a pragmatic mixture of approaches.

Elastic System: they can automatically add computing resources when they detect a load increase.


Operations teams are vital to keeping a software system running smoothly. A good operations team typically is responsible for the following, and more

  - Monitoring the health of the system and quickly restoring service if it goes into a bad state
  - Tracking down the cause of problems, such as system failures or degraded performance
  - Keeping software and platforms up to date, including security patches
  - Keeping tabs on how different systems affect each other, so that a problematic change can be avoided before it causes damage
  - Anticipating future problems and solving them before they occur (e.g., capacity planning)
  - Establishing good practices and tools for deployment, configuration management, and more
  - Performing complex maintenance tasks, such as moving an application from one platform to another
  - Maintaining the security of the system as configuration changes are made
  - Defining processes that make operations predictable and help keep the production environment stable
  - Preserving the organization’s knowledge about the system, even as individual people come and go


There are various possible symptoms of complexity: explosion of the state space, tight coupling of modules, tangled dependencies, inconsistent naming and terminology, hacks aimed at solving performance problems, special-casing to work around issues elsewhere, and many more.

One of the best tools we have for removing accidental complexity is abstraction. A good abstraction can hide a great deal of implementation detail behind a clean, simple-to-understand façade. A good abstraction can also be used for a wide range of different applications. Not only is this reuse more efficient than reimplementing a similar thing multiple times, but it also leads to higher-quality software, as quality improvements in the abstracted component benefit all applications that use it.

**3 Design Principles for software systems:**

- Operability:
- Simplicity: Abstract tools
- Evolvability: Making change easy. (Agile Framework, TDD test)


### Chapter2 - Date Models and Query Languages

In a complex application there may be more intermediary levels, such as APIs built upon APIs, but the basic idea is still the same: each layer hides the complexity of the layers below it by providing a clean data model.

Document database
  - MongoDB, RethinkDB, CouchDB, and Espresso
  - Worked well for one-to-many relationships, but it made many-to-many relationships difficult, and it didn’t support joins

Network Model
  - The CODASYL model was a generalization of the hierarchical model.
  - In the tree structure of the hierarchical model, every record has exactly one parent; **in the network model**, a record could have multiple parents
  - The links between records in the network model were not foreign keys, but more like pointers in a programming language (while still being stored on disk)
  - A query in CODASYL was performed by moving a cursor through the database by iterating over lists of records and following access paths.
  - the problem was that they made the code for querying and updating the database complicated and inflexible.

The Relation Model


A more accurate term is schema-on-read (the structure of the data is implicit, and only interpreted when the data is read), in contrast with schema-on-write (the traditional approach of relational databases, where the schema is explicit and the database ensures all written data conforms to it)

Schema-on-read is similar to dynamic (runtime) type checking in programming languages, whereas schema-on-write is similar to static (compile-time) type checking.


**MapReduce**
  - is neither a declarative query language nor a fully imperative query API, but somewhere in between: the logic of the query is expressed with snippets of code, which are called repeatedly by the processing framework.
  - They must be pure functions, which means they only use the data that is passed to them as input, they cannot perform additional database queries, and they must not have any side effects
  - A usability problem with MapReduce is that you have to write two carefully coordinated JavaScript functions, which is often harder than writing a single query. Moreover, a declarative query language offers more opportunities for a query optimizer to improve the performance of a query.

**Graph-Like Data Models**
  - It's good for many-to-many relationships
  - Document Data models good for one-to-many (tree structure)
  - Relation Model can handle simple case of many-to-many relationships.
  - A graph consists of two kinds of objects: _vertices (also known as nodes or entities)_ and _edges (also known as relationships or arcs)_
  - Graphs are not limited to such homogeneous data: an equally powerful use of graphs is to provide a consistent way of storing completely different types of objects in a single datastore.
  - property graph model:  Neo4j, Titan, and InfiniteGraph
  - triple-store model: Datomic, AllegroGraph
  - Graph Query Language: Cypher, SPARQL, and Datalog.

**Property Graphs**
  - Each Vertex consists of: Unique Identifier, outgoing edges, incoming edges, collection of properties
  - Each Edge consists of: ID, tail vertex (vertex at which the edge starts), head vertex(vertex at which the edge ends ), label(description relationship), collection of properties
  - Graph data can be represent in relational database, however you may need to do a lot of joins to get result. Example: To find out person live in which country. A person can live at an address, which may end up join  Street -> District -> region -> state, ....
  - his idea of variable-length traversal paths in a query can be expressed using something called recursive common table expressions (the WITH RECURSIVE syntax)

**Triple-Stores and SPARQL**
  - The triple-store model is mostly equivalent to the property graph model, using different words to describe the same ideas
  - all information is stored in the form of very simple three-part statements: (subject, predicate, object). Example: (Jim, likes, bananas)
  - Subject is eqequivalent to vertex
  - The object is one of two things: A value in a primitive datatype, such as a string or a number or another subject (vertex)
  - SPARQL is a query language for triple-stores using the RDF data model [43]. (It is an acronym for SPARQL Protocol and RDF Query Language, pronounced “sparkle.”)

**Data Dog**
  - Datalog’s data model is similar to the triple-store model, generalized a bit. Instead of writing a triple as (subject, predicate, object), we write it as predicate(subject, object).
  - The Datalog approach requires a different kind of thinking to the other query languages discussed in this chapter, but it’s a very powerful approach, because rules can be combined and reused in different queries. It’s less convenient for simple one-off queries, but it can cope better if your data is complex.


**Document databases** target use cases where data comes in self-contained documents and relationships between one document and another are rare.
**(VS)**
**Graph databases** go in the opposite direction, targeting use cases where anything is potentially related to everything.

One thing that document and graph databases have in common is that they typically don’t enforce a schema for the data they store, which can make it easier to adapt applications to changing requirements. However, your application most likely still assumes that data has a certain structure; it’s just a question of whether the schema is explicit (enforced on write) or implicit (assumed on read).

**Although we have covered a lot of ground, there are still many data models left unmentioned. To give just a few brief examples:**

  - Researchers working with genome data often need to perform sequence-similarity searches, which means taking one very long string (representing a DNA molecule) and matching it against a large database of strings that are similar, but not identical. None of the databases described here can handle this kind of usage, which is why researchers have written specialized genome database software like GenBank [48].
  - Particle physicists have been doing Big Data–style large-scale data analysis for decades, and projects like the Large Hadron Collider (LHC) now work with hundreds of petabytes! At such a scale custom solutions are required to stop the hardware cost from spiraling out of control [49].
  - Full-text search is arguably a kind of data model that is frequently used alongside databases. Information retrieval is a large specialist subject that we won’t cover in great detail in this book, but we’ll touch on search indexes in Chapter 3 and Part III.


**B-Tree**

- Log-structured indexes (SSTable): reak the database down into variable-size segments, typically several megabytes or more in size, and always write a segment sequentially
- B-Tree: break the database down into fixed-size blocks or pages, traditionally 4 KB in size (sometimes bigger), and read or write one page at a time.
- LSM-trees are typically faster for writes, whereas B-trees are thought to be faster for reads
- Reads are typically slower on LSM-trees because they have to check several different data structures and SSTables at different stages of compaction.


**In Memory databases**
- VoltDB, MemSQL, and Oracle TimesTen are in-memory databases with a relational model.
- RAMCloud is an open source, in-memory key-value store with durability
- Redis and Couchbase provide weak durability by writing to disk asynchronously.


On a high level, we saw that storage engines fall into two broad categories: those **optimized for transaction processing (OLTP)**, and those **optimized for analytics (OLAP)**. There are big differences between the access patterns in those use cases:
  - OLTP systems are typically user-facing, which means that they may see a huge volume of requests. In order to handle the load, applications usually only touch a small number of records in each query. The application requests records using some kind of key, and the storage engine uses an index to find the data for the requested key. Disk seek time is often the bottleneck here.
  - Data warehouses and similar analytic systems are less well known, because they are primarily used by business analysts, not by end users. They handle a much lower volume of queries than OLTP systems, but each query is typically very demanding, requiring many millions of records to be scanned in a short time. Disk bandwidth (not seek time) is often the bottleneck here, and column-oriented storage is an increasingly popular solution for this kind of workload.

On the OLTP side, we saw storage engines from two main schools of thought:
  - The log-structured school, which only permits appending to files and deleting obsolete files, but never updates a file that has been written. Bitcask, SSTables, LSM-trees, LevelDB, Cassandra, HBase, Lucene, and others belong to this group.
  - The update-in-place school, which treats the disk as a set of fixed-size pages that can be overwritten. B-trees are the biggest example of this philosophy, being used in all major relational databases and also many nonrelational ones.


### Chapter 3

**Language-Specific Formats**

Java has java.io.Serializable [1], Ruby has Marshal [2], Python has pickle, ...

Problems:
  - The encoding is often tied to a particular programming language, and reading the data in another language is very difficult
  - In order to restore data in the same object types, the decoding process needs to be able to instantiate arbitrary classes. This is frequently a source of security problems
  - they often neglect the inconvenient problems of forward and backward compatibility.
  - Efficiency

**JSON, XML, and Binary Variants**



### Chapter 4:

#### Database

- One process Write, One Process Write

#### RPC

- One process send a request over network to otehr process and expect a response as qick as possible

**Problem RPC:**

- Unpredictable  network, remote machine slow, or unvailable
- Has alot other possible outcome: timeout, no result. (don't know what's going on)
- Network latency
- Retry failed request may cause the action to be performed multiple time, unless you build a mechanisum for dedupication(idempotence) into the protocol.
- Quickly become problem with large object
- Client and Service may implement in different languages, so the RPC framework must translate datatypes from one language to another.

**Knowledge about RPC frameworks**

- Thrift and Avro come with RPC support include
- gRPC is an RPC implementation using Protocol Buffer
- Rest.li uses JSON over HTTP
- Finagle uses Thrift
- Rest.li and Fignage use _futures(promises)_ to ecncapsulate asynchronuse actions
- gRPC supports streams
- **service discovery** allowing a client to find out at which IP address and port number it can find a particular service.

**REST vs RPC**

- REST: easier for debug, can use by any client (curl, postman) without need a code generation or software
- RPC: use a binary encode => can archive better performance
- REST: domninat for public API. RPC: is better for services inside organization, (typical within the same datacenter)

**RPC - Data Encoding and Evoulution**

- Usually: service update first, then client update second => most of the time we need backward compatibility for request, and forward compatibility for response.
- when RPC use for accross organization boundaries, it's harder for maintain compatibility because service provider has no control over its clients. Thus, compatibility needs to be maintained for a long time, perhaps indefinitely

#### Message-Passing

- asynchronous message-passing systems, which are somewhere between RPC and databases.
- Same as RPC: a client send request to another process through a low latency
- Same as DB: message not send directly, but goes via a intermediary called a message broker.(also called a message queue or message-oriented middleware)

**Advantages compared to direct RPC**

- It can act as a buffer if the recipient is unavailable or overloaded, and thus improve system reliability.
- automatically redeliver messages to a process that has crashed, and thus prevent messages from being lost.
- It avoids the sender needing to know the IP address and port number of the recipient (which is particularly useful in a cloud deployment where virtual machines often come and go).
- It allows one message to be sent to several recipients.
- It logically decouples the sender from the recipient (the sender just publishes messages and doesn’t care who consumes them).

### Summary

- Rolling upgrades allow new versions of a service to be released without downtime and make deployment less risky. These properties are hugely beneficial for evelvability.
- During rolling upgrades, we must assume that different node are running the differnt versions fo our application's code. This, it's important that all data flowing around the system is encoded in a way that provides backward comaptibility and forward compaatibility.