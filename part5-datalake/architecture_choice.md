## Architecture Recommendation

For the food delivery startup, a **Data Lakehouse** architecture is the best choice. Here are three specific reasons:

1. **Mixed Data Types**: The company collects GPS location logs (unstructured), text reviews (semi-structured), payment transactions (structured tabular), and menu images (binary). A data warehouse struggles with heterogeneous formats; a pure data lake lacks governance. A lakehouse combines flexible storage with SQL queryability.

2. **Real-Time + Analytics**: Payment transactions need immediate processing (operational OLTP requirements), while restaurant metrics and customer sentiment trends require historical analysis (OLAP reporting). Lakehouses efficiently handle both transactional consistency and analytical queries through metadata layers (like Apache Iceberg or Delta Lake).

3. **Cost-Effective Scalability**: Images and location logs generate massive volumes cheaply stored in object storage (S3/Blob), while structured transaction data benefits from indexed querying. Lakehouses optimize storage costs by keeping raw data as-is while enabling efficient queries through schema-on-read and metadata tables.

A lakehouse setup (e.g., Databricks, Apache Iceberg on S3) provides the flexibility of a data lake with the performance and governance of a warehouse, ideal for this startup's diverse data requirements.
