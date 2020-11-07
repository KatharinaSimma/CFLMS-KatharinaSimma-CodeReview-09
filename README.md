# CFLMS-KatharinaSimma-CodeReview-09

Dear Trainers,

ASSUMPTIONS
I made the following assumptions for the DB.
- Each delivery person has one route per day.
- I am not in charge of the schedule and operated under the assumption that routes match Zip codes in a way, but I just entered random data.

Reflection on the exercise:

3NF - I feel I did not fully achieve 3NF as e.g. I have customer and employees who both have first_name and last_name. There should propably be a table for person data. Also, I simplified addresses, e.g. ZIP Codes should be in their own table listing cities and districts. 
In addition, postage as well as route.capacity is a value that is calculated from weight and size of the package(s). However, it does not affect my nominal forms because I put this down to "business logic" (It could change, there could be discounts etc)

For me this exercise was hard because creating a Database should not be fun. It is serious business ;-) and queries should be given by the customer (i.e. Code Factory) In the real world I would never set up a complex database without communication repeatedly about the sort of queries that are expected. My Feedback for you is that it would be helpful to have "user stories" that resemble real life requirements e.g. "We should be able to make a schedule for the post workers", "We want to know the number of packages a single customer ordered". These user stories should be at the beginning and the basis on which we create the DB.

Question: 
Will we be able to take other date (json?) from the real world like calculating the distance between cities ...?
Is there a way to autofill cells (e.g. postage should be calculated from size and weight)? Do we want to autofill such things upon createing the data or everytime the database is called upon? How do weigh performance vs size?

Cheers,
Katharina
