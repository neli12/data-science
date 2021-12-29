## My first Datathon
Hello everyone!  
In this example, I will present my experience participating in the Datathon WomanHack promoted by the QuantumBlack, a company from McKinsey.  
I confess that at first, I felt nervous because I didn't have so much experience in Python programming and this was my first datathon. Nevertheless, at that time I wanted to participate to gain experience on how a hackaton, or in this case, a datathon works.  
The first step was to register for the event and then, the organizing commitee provided access to an app, where we were able to connect with other woman and to form the groups. I match with two incredible girls: Lucía and Angy, from Argentina and Colombia, respectively. The name of our group was Lovelace Squad.   
In the first day, we were introduced each other and the organizers presented the challenge, which consisted of creating a model to predict the probability that a client will visit a store in the next 7 days, assuming that no communication is sent. The description of the challenge can be found here: https://www.kaggle.com/c/marketcohackaton/overview/description.  

Basically, the dataset has nine columns (see figure below), with 10664209 observations representing the date of the purchase, purchase and client ID, category and item code, the quantity sold, price and cost.  

<img src="https://github.com/neli12/screenshots-figures/blob/main/head_data.PNG" width="700" />  

From this dataset, new features needed to be created to be able to build and run the model.  
We group the dataset by client and create the following metrics:

- qty_sold_mean: Total quantity purchased in the period of time of the dataset
- total_price_mean: Average amount of money spent per visit to the store
- total_visits: Number of visits made to the store in the period of time of the dataset
- weekday_mode: Mode of the weekday where the client made a purchase
- weekend_mode: Mode of the weekend where the client made a purchase (dummy values)
- item_mode: Item purchased the most by each client in the period of time of the dataset
- category_mode: Category purchased the most by each client in the period of time of the dataset
- items_mean/visit: Average items purchased per visit
- mean_purchase_freq: Average frequency of visit to the store  

For building the model, we used the Pycaret package, which is a very useful tool where you can find a lot of resources for a better implementation of ML models. After training the dataset, we found that the Quadratic Discriminant Analysis was the best algorithm. We used it to build the model and test it in the validation dataset. 
We ended up in the 8th place, with a F1 score of 0.63. As they selected the first ten groups, we presented our results in the final presentations. Unfortunately, we didn't have so much time to prepare and I was pretty nervous. The presentation had to last 5 minutes and we presented in less than four.

<img src="https://github.com/neli12/screenshots-figures/blob/main/datathon_results.PNG" width="700" />

My part was to present the marketing strategy. Based on our results, we propose two strategies:
- Focus on customers who were already going constantly and who bought a lot and,
- Also consider customers who went less often but who spent a lot each time they went.  

Althoug we didn't win the prize, it was really a good experience! 
