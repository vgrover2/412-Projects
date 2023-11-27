from mlxtend.frequent_patterns import apriori
from mlxtend.frequent_patterns import association_rules

import numpy as np
import pandas as pd

#HW 1

# Define the data points in a 2D array
data = np.array([[1.0, 2.0], [2.0, 3.0], [4.0, 5.0], [6.0, 7.0]])

# Define the query point
query_point = np.array([1.4, 1.6])

# Calculate Euclidean distances
euclidean_distances = np.linalg.norm(data - query_point, axis=1)

# Calculate Manhattan distances
manhattan_distances = np.sum(np.abs(data - query_point), axis=1)

# Calculate Supremum distances
supremum_distances = np.max(np.abs(data - query_point), axis=1)

# Calculate Cosine similarities
cosine_similarities = np.dot(data, query_point) / (np.linalg.norm(data, axis=1) * np.linalg.norm(query_point))

# Rank the data points based on each similarity measure
euclidean_rank = np.argsort(euclidean_distances)
manhattan_rank = np.argsort(manhattan_distances)
supremum_rank = np.argsort(supremum_distances)
cosine_rank = np.argsort(cosine_similarities)[::-1]  # Cosine similarity is ranked in descending order

# Print the rankings
print("Ranking using Euclidean Distance:", euclidean_rank)
print("Ranking using Manhattan Distance:", manhattan_rank)
print("Ranking using Supremum Distance:", supremum_rank)
print("Ranking using Cosine Similarity:", cosine_rank)


# HW 2

data = { 'TID': ['T100', 'T200', 'T300', 'T400', 'T500'], 
        'Items_bought' : [
            {'B', 'C', 'E', 'F', 'N', 'Y'},
            {'C', 'D', 'E', 'F', 'Y'},
            {'B', 'C', 'D', 'E', 'H'},
            {'A', 'B', 'Y', 'U'},
            {'A', 'C', 'E', 'F', 'I'}
        ]
    }

df = pd.DataFrame(data)

oht = pd.get_dummies(df['Items_bought'].apply(pd.Series), dtype = int)

frequent_itemsets = apriori(oht, min_support = 0.6, use_colnames = True)

print("Frequent Itemsets:")
print(frequent_itemsets)

rules = association_rules(frequent_itemsets, metric = "confidence", min_threshold = 0.75)

print("\nAssociation Rules")
print(rules)
