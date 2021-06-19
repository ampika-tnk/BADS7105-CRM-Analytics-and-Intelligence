## Product Recommendation

## Dataset
The data comes from a survey asking users (students in the class) about have ever purchased/used items (Yes or No). The data is in csv format. [Customer Preference Survey.csv]

### Top 20 Most and Least Purchase/Use
![image](https://user-images.githubusercontent.com/78214709/122434527-611f2180-cfc1-11eb-9338-949d3c0ef12f.png)


### Frequent Itemsets and Association Rules

Running a market basket analysis. Nodes represent items and directed edges represent rules (antecedents ➞ consequents). For 1-to-1-itemset, both directions of rules (A➞B, B➞A) have the same lift values, so in the case, we always have bi-directional edges (A⬌B).
1-itemset association rules (filtered by Confidence > 0.5 and Lift > 1.05)

![image](https://user-images.githubusercontent.com/78214709/122435152-f4585700-cfc1-11eb-8330-b74b5ecfdb57.png)


2-itemset association rules (filtered by Confidence > 0.9 and Lift > 1.35)
![image](https://user-images.githubusercontent.com/78214709/122634417-5ae78d00-d108-11eb-97ca-b22ed95e5844.png)


### Collaborative Filtering Model

We could recommend items based on item similarity. Calculates cosine similarity values for each pair of items. 

![image](https://user-images.githubusercontent.com/78214709/122435470-3aadb600-cfc2-11eb-8a96-ecbbd28c18bc.png)


### Matrix Factorization

We could recommend items based on user-item similarity. 

![image](https://user-images.githubusercontent.com/78214709/122435838-8b251380-cfc2-11eb-8c22-f8a65816b30b.png)



