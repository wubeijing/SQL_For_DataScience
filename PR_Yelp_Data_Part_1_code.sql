/*
1. Profile the data by finding the total number of records for each of the tables below
*/

SELECT COUNT(*)
FROM attribute; -- change to table name

/*
2. Find the total distinct records by either the foreign key or primary key for each table. If two foreign keys are listed in the table, please specify which foreign key.
*/

SELECT COUNT(DISTINCT id)
FROM business;

SELECT COUNT(DISTINCT business_id)
FROM hours;

SELECT COUNT(DISTINCT business_id)
FROM category;

SELECT COUNT(DISTINCT business_id)
FROM attribute;

SELECT COUNT(DISTINCT id)
FROM review;
SELECT COUNT(DISTINCT business_id)
FROM review;
SELECT COUNT(DISTINCT user_id)
FROM review;

SELECT COUNT(DISTINCT business_id)
FROM checkin;

SELECT COUNT(DISTINCT id)
FROM photo;
SELECT COUNT(DISTINCT business_id)
FROM photo;

SELECT COUNT(DISTINCT user_id)
FROM tip;
SELECT COUNT(DISTINCT business_id)
FROM tip;

SELECT COUNT(DISTINCT id)
FROM user;

SELECT COUNT(DISTINCT user_id)
FROM friend;

SELECT COUNT(DISTINCT user_id)
FROM elite_years;

/*
3. Are there any columns with null values in the Users table? Indicate "yes," or "no."
*/

SELECT COUNT(*)
  FROM user
  WHERE id IS NULL
  OR name IS NULL
  OR review_count IS NULL
  OR yelping_since IS NULL
  OR useful IS NULL
  OR funny IS NULL
  OR cool IS NULL
  OR fans IS NULL
  OR average_stars IS NULL
  OR compliment_hot IS NULL
  OR compliment_more IS NULL
  OR compliment_profile IS NULL
  OR compliment_cute IS NULL
  OR compliment_list IS NULL
  OR compliment_note IS NULL
  OR compliment_plain IS NULL
  OR compliment_cool IS NULL
  OR compliment_funny IS NULL
  OR compliment_writer IS NULL
  OR compliment_photos IS NULL;

/*
4. For each table and column listed below, display the smallest (minimum), largest (maximum), and average (mean) value for the following fields:
*/
SELECT MIN(stars), MAX(stars), AVG(stars)
  FROM review;

/*
5. List the cities with the most reviews in descending order:
*/

SELECT city
  , SUM(review_count) AS review_count
  FROM business
  GROUP BY city
  ORDER BY review_count DESC;

/*
6. Find the distribution of star ratings to the business in the following cities:
*/

SELECT stars
  , SUM(review_count) AS count
  FROM business
  WHERE city = "Avon"
  GROUP BY stars;

/*
7. Find the top 3 users based on their total number of reviews:
*/

SELECT name
  , review_count
  FROM user
  ORDER BY review_count DESC
  LIMIT 3;

/*
8. Does posing more reviews correlate with more fans?
*/

SELECT name
  , review_count
  , fans
  FROM user
  ORDER BY review_count DESC;

/*
9. Are there more reviews with the word "love" or with the word "hate" in them?
*/

SELECT COUNT(*) AS like
  FROM review
  WHERE text LIKE "%love%";

SELECT COUNT(*) AS hate
  FROM review
  WHERE text LIKE "%hate%";

/*
10. Find the top 10 users with the most fans:
*/

SELECT name
  , fans
  FROM user
  ORDER BY fans DESC
  LIMIT 10;
