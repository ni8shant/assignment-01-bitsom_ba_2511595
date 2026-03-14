## ETL Decisions

### Decision 1 — Inconsistent Date Formats
Problem: Raw data contained dates in multiple formats (DD/MM/YYYY, YYYY-MM-DD, text like 'Jan 15').
Resolution: Standardized all dates to ISO 8601 (YYYY-MM-DD) format and validated during loading.

### Decision 2 — NULL Values in Category Field
Problem: Some products had NULL or empty category values.
Resolution: Assigned a default 'Uncategorized' category and tracked these in a data quality report.

### Decision 3 — Category Casing Inconsistency
Problem: Categories were stored with mixed casing ("ELECTRONICS", "Electronics", "electronics").
Resolution: Applied UPPER() function during transformation to ensure consistency in dimension table.
