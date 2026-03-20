## Anomaly Analysis
### Insert Anomaly
**can not insert a new customber without creating an associated order record**

-*example:*
- Row 2: ORD1027 | C002 | Priya Sharma | priya@gmail.com | Delhi | P004 | Notebook | Stationery
- Row 5: ORD1002 | G002 | Priya Sharma | priya@gmail.com | Delhi | P005 | Headphones | Electronics 
- Row 21: ORD1054 | G002 | Priya Sharma | priya@gmail.com | Delhi | P001 | Laptop | Electronics
- *The customber Priya Sharma can only exist as part of an order record. To add a new customber without orders is impossible with the current flat structure.*

### Update Anomaly
**changing customber information requires updating multiple rows, leading to potential inconsistencies.**

-*example:*
- Rows 2, 5, 21: Customer "Priya Sharma" (C002, priya@gmail.com, Delhi) appears in three different orders
- If Priya's email needs to change to newpriya@gmail.com, all three rows must be updated
- *Risk: If one update is missed (Row 5 for instance), the database becomes inconsistent with conflicting email addresses for the same customer*

### Delete Anomaly
**deleting an order record results in loss of customber information if that customber has no other orders.**

-*example*
- Row 3: ORD1114 | C001 | Rohan Mehta | rohan@gmail.com | Mumbai | P007 | Pen Set | Stationery
- *If this order is deleted and Rohan Mehta has few orders, valuable customer information is lost*
- *Even if the customer exists in other orders, the specific order details are permanently removed.*




## Normalization Justification
-- The argument that keeping everything in a single table is simpler but it's leads to data anomalies and maintenance nightmares. While a single flat file approch might seem easier for a small datasets, this order_flat.csv file demostrates why normalization is a necessity, not over-engineering.

-- 1. The Problem of Redundancy
-- In orders table, we have both sales_rep_id and sales_rep_name. For every single order Ravi Kumar makes, we manually type "Ravi Kumar". If Ravi wants to change his name to "Ravi K. Sharma", we would have to update all the cell where Ravi Kumar is written.

-- 2. The Risk of Data Loss
-- in a flat structure, if we delete an order, we might accidententally delete information that exits nowhere else. eg. if Deepak Joshi (SR01) only has one order and that order is cancelled and deleted, his entire detailes in data base vanishes. This is Delete Anomaly. By normailizing this into a separate table, Deepak data remains in system even if he has not made a sales.

-- 3. Storage and Precision
-- Storing customer_city or product_name repeatedly for every order wastes storage space and increase the chance of typing error. In a normalized database, a city is stored once. In a flat table, Delhi might be stored 10000 times, wasting bytes and slowing down performance.

-- Conclusion
-- Normalisation is a indusry standard. It prevent data corruption, improves performance and ensure scalability. The effort to normalize pays dividends in reduced maintenace costs.