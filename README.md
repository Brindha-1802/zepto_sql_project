# zepto_sql_project
# PROJECT OVERVIEW:
how the actual data analyst in the e-commerce or retail industries work behind the sql 
1.set up messy data
2. EDA(exploratory data analysis)
3. data cleaning
4. write business driven sql queries to drive the meaningful insight

# DATASET OVERVIEW:
the dataset is sourced from kaggle and its from the zepto product listing.each row represent a unique stock id for the product.there is 9 column listing of(sku_id,name.category,mrp,discount percent,discounted sellingprice,availalbe quantity,weight in gms,out of stock,quantity

# PROJECT WORKFLOW:
## 1.Database and table creation
write the query to create the table
```sql
CREATE TABLE zepto(
sku_id SERIAL PRIMARY KEY,
category VARCHAR (100),
name VARCHAR(100) NOT NULL,
mrp NUMERIC(8,2),
discountpercent NUMERIC(5,2),
availablequantity INT,
discountedsellingprice NUMERIC (8,2),
weightIngms INT,
outofstock BOOLEAN,
quantity INT
);
```
## 2. Data import:
load CSV using import feature in mysql

## 3. Data exploration
> count the total no.of records in the dataset.
> view the sample dataset to understand the structure.
> check if there is any null values in the dataset.
> identify the unique product categories in the dataset.

## 4. Data cleaning:
> identity and remove the rows where the values are zero

## 5. Business insight:
> found the top 10 value product based on discount percentage
> identify high mrp product
> estimated potentisl revenueu for each product category
> ranked top 5 category offering highest average discount
> grouped product based on weight into low,medium,high


