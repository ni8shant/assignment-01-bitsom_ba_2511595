## Storage Systems

A hospital network requires multiple storage because each use case has different data requirements. For operational patient records and treatment data, an OLTP relational database such as PostgreSQL is appropriate. This system handles frequent transactons such as updating patient records, prescriptions and treatment history while maintaining strong consistency and reliability.

For management reporting a Data Warehouse such as Snowflake or BigQuery is more suitable. Data from the operational database is periodically transformed and loaded into warehouse through ETL pipelines. This environment supports analytical queries for generating  reports such as bed occupancy rate, department wise costs and treatment statistics.

To support natural language queries by doctors a Vectors Database such as Pinecone or FAISS can be used. Patients history documents can be converted into embeddings using a language model and stored as vectors. When a doctor asks a question in plain English the system retrieves semantically similar patient records and prevents relevant information.

Finally, for real time ICU monitoring data, a streaming and scalable storage system is necessary. Technologies such as Apache Kafka combined with a data lake can capture and store continous streams f vital signs such as heart rate and oxygen levels. This enables real time monitoring and future analysis.

## OLTS vs OLAP Boundary

In this archirecture, the OLTP system is responsible for handling operational hospital data such as patient registration, treatment records and biling transactions. These workloads involves frequent updates asd require high consistency and low latency.

The OLAP anvironment begins after data is extracted from the operational database and processed through ETL pipelines into the data warehouse. In this analytical layer, dat ais optimized for complex queries and large scale reporting rather than frequent updates.

For example while the OLTP system records  individual patient treatments, the OLAP system aggregates this data to analyze trends such as montlhy readmission rates, department performance and hospital resources utilization.

## Trade-offs

One significant trade off in this architecture is the dat alatency between operational systems and the analytical warehouse. because data is transferred usng ETL pipelines, there may be a delay between when a transaction occurs in the OLTP system and when it becomes available for analytics.

This delay could affect real time reporting accuracy. To mitigate this issue, the system can implement near real time dat apipelines using streaming ETL tools suchas Kafka or Apache Spark. These tools reduce latency by continously moving dta into the warehouse.

Another mitigation strategy is implemention incremental data loading, where only newly updated records are processed instead of the entire dataset. This improves system efficiency and ensures analytics remain reasonably up to date while maintaing system performance.
