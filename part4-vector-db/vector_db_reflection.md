## Vector DB Use Case

A traditional keyword based database search would not be sufficient for searching large legal contracts using natural language questions. keyboard sesrch relies on exact word matching. This means that if a lawyer searches for "termination clauses", the system will only return  sections that contain the exact words "termination or clauses". however legal documents often use varied languages such as "agreement cancellation, contract ending conditions or right to terminate". A keyword based system might miss these semantically related sections.

A vector database solves this problem by enabling semantic search. IN thsi approach, both the contract text and the user's query are converted into numerical vector representations called embeddings using machine learning. models. These embeddings capture the meaning of the text rather than just the specific words used. When a lawyer asks a question in plain English, the system converts the the query into a vector and compares it with the vectors of contract sections stored in the database.

The vector database then retrieves thr sections that are most semantivally similar to the query using similarity measures uch as cosine similarity. This allows the system to find relevent clauses even even if they are phrased differently from the query.

Therefore, a vector database plays a crucial role in embedding intelligent document search across large contracts. It improves accuracy, supports natural language queries and helps lawyers quickly locate relevant legal information within hundreds of pages of documents.
