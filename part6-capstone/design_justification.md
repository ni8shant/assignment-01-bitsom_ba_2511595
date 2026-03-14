## Storage Systems

The hospital network requires a multi-tier approach:
- **Operational/OLTP**: Patient records and real-time vitals (critical data) → Managed SQL Database (e.g., Azure SQL/AWS RDS) for ACID consistency
- **Analytics/OLAP**: Monthly reports on bed occupancy and costs → Data Warehouse (Snowflake/Redshift) for aggregations
- **ML Model Training**: Readmission risk prediction → Data Lake (Parquet files) holding historical treatment data
- **Semantic Search/NLP**: Doctor queries in plain English → Vector Database (Pinecone/Weaviate) for embedding-based retrieval

## OLTP vs OLAP Boundary

The OLTP system handles transactional operations: patient admissions, real-time vital signs from ICU devices, medical transactions. These require immediate consistency and fast write throughput. Data flows to OLAP systems (warehouse) via ETL pipelines (nightly/hourly), where it's aggregated into slowly-changing dimensions for analytics. The vector DB operates on a separate copy of patient history documents, updated during ETL for semantic indexing.

## Trade-offs

A significant trade-off: Maintaining 4 separate storage systems increases operational complexity and data consistency challenges (if a patient record updates in the OLTP DB, the warehouse and vector DB copies lag behind by ETL latency). Mitigation: Implement event streaming (Kafka) to propagate critical updates in near-real time to all systems, reducing staleness while keeping analytical systems performant.
