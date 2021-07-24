## Product Recommendation

## Dataset
The data comes from a survey asking users (students in the class) about have ever purchased/used items (Yes or No). The data is in csv format. [Customer Preference Survey.csv]

### Top 10 Most and Least Purchase/Use Items
![image](https://user-images.githubusercontent.com/78214709/126868066-499c34d4-9a5f-48aa-adc4-5a7851e7f292.png)


### Frequent Itemsets and Association Rules

Running a market basket analysis. Nodes represent items and directed edges represent rules (antecedents ➞ consequents). For 1-to-1-itemset, both directions of rules (A➞B, B➞A) have the same lift values, so in the case, we always have bi-directional edges (A⬌B).

Recommend 1 item based on 1 item (filtered by Confidence > 0.8 and Lift > 1.00)

![image](https://user-images.githubusercontent.com/78214709/126868115-c0b6376c-229c-42f1-9113-7121eeffd11d.png)


Recommend 2 items based on 1 item (filtered by Confidence > 0.8 and Lift > 1.20)
![image](https://user-images.githubusercontent.com/78214709/126868174-d5fa79f0-6fb3-447a-ac7d-fa7d172f787b.png)

![image](https://user-images.githubusercontent.com/78214709/126868161-3477c1b6-7738-495d-a17a-a7f7586370dd.png)


### Collaborative Filtering Model

We could recommend items based on item similarity. Calculates similarity values for each pair of items (filtered similarity using threshold > 0.7). 

![image](https://user-images.githubusercontent.com/78214709/126868216-f6091cf2-de34-4645-8196-f1ca415911ab.png)


### Matrix Factorization

We could recommend items based on user-item similarity. 

![image](https://user-images.githubusercontent.com/78214709/126868233-f2bc0d69-072a-48e2-8d2f-83ec5b0da337.png)



