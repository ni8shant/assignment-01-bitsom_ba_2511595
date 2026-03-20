## Database Recommendation

//"A healthcare startup is building a patient management system. One engineer recommends MySQL; another recommends MongoDB. Given your understanding of ACID vs BASE and the CAP theorem, which would you recommend and why? Would your answer change if they also needed to add a fraud detection module?"

A patient management system in healthcare requires a high level of reliability, consistency and data integrity. Medical records contains sensitive and critical informtion such as patent history, prescription , diagnoses, health issue and billing data. Because of this, I would recommend using RDBMS (MySQL) as the primary database for such a system.

MySQL follows the ACID(Atomicity, Consistency, Isolation, Durability) properties. This ensure that every transaction is processed reliably. For eg. when updating the patient's medical record or processsing biling transaction, the system must ensure that the operation either completes fully or does not happen at all. This prevent partial updates and protects the integrity of the database. In healthcare systems, data inconsistency could lead to serious consequences such as incorrect treatments or billing errors.

While MongoDB typically follows the BASE(Basically Available, Soft state,eventual consistency ) model. this provides better scalibilty and flexibility, it may allow temopory inconsistencies in distriuted systems. for a patient management system where data accuracy is critical, strong cinsistency is more impotant than flexibilty.

CAP theorem also supports this choice. In healthcare applications, cinsistency and reliability are prioritized over partition tolerance or high availibilty during network failure. A relation database like MySQL ensures strict consistency across transactions.

However if the healthcare startup later adds a fraud detection module, the architecture might benefit from including MongoDB or another NOSQL database alongside MySQL. Fraud detection systems often process large volumes of semi-structured data such as logs, behavioral patterns or transaction histories. MongoDB's flexible schema and horizontal scalability make it suitable for handling such analytical workloads.

Therefore the best approach would be to use MySQL as the core transactional database for patients records and combine it with MongoDB for scalable analytics and fraud detection, creating a hybrid database architecture.