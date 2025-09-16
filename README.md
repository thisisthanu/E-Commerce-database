# E-commerce Store Database 🛍️

This repository contains the complete SQL schema and a set of business queries for a relational e-commerce database. The schema is designed to handle customers, products, categories, and orders efficiently.

## Table of Contents
- [Database Schema](#-database-schema)
  - [Q1: Customers Table](#q1-customers-table)
  - [Q2: Product Categories Table](#q2-product-categories-table)
  - [Q3: Products Table](#q3-products-table)
  - [Q4: Orders Table](#q4-orders-table)
  - [Q5: Order Items Junction Table](#q5-order-items-junction-table)
- [Sample Data Insertion](#-sample-data-insertion)
- [Business Questions & SQL Queries](#-business-questions--sql-queries)
  - [Q6: Top 5 customers by total spending?](#q6-who-are-the-top-5-customers-by-total-spending)
  - [Q7: Which products have never been ordered?](#q7-which-products-have-never-been-ordered)
  - [Q8: What is the average number of orders per customer?](#q8-what-is-the-average-number-of-orders-per-customer)
  - [Q9: Which month had the highest sales revenue?](#q9-which-month-had-the-highest-sales-revenue)
  - [Q10: List all customers who purchased a specific product?](#q10-list-all-customers-who-purchased-a-specific-product-eg-laptop)
  - [Q11: Which product category generates the most revenue?](#q11-which-product-category-generates-the-most-revenue)

---

## 🧱 Database Schema

The database consists of five interconnected tables designed to capture the core functionalities of an e-commerce platform. The relationships are structured to ensure data integrity and efficient querying.


```mermaid
erDiagram
    CUSTOMERS ||--o{ ORDERS : places
    ORDERS ||--|{ ORDER_ITEMS : contains
    PRODUCTS ||--o{ ORDER_ITEMS : included in
    PRODUCT_CATEGORIES ||--o{ PRODUCTS : categorizes

    CUSTOMERS {
        INT CustomerID PK
        VARCHAR FirstName
        VARCHAR LastName
        VARCHAR Email
        VARCHAR Address
        DATE RegistrationDate
    }
    ORDERS {
        INT OrderID PK
        INT CustomerID FK
        DATE OrderDate
        DECIMAL TotalAmount
        VARCHAR Status
    }
    ORDER_ITEMS {
        INT OrderItemID PK
        INT OrderID FK
        INT ProductID FK
        INT Quantity
        DECIMAL UnitPrice
    }
    PRODUCTS {
        INT ProductID PK
        INT CategoryID FK
        VARCHAR ProductName
        DECIMAL Price
        INT StockQuantity
    }
    PRODUCT_CATEGORIES {
        INT CategoryID PK
        VARCHAR CategoryName
        TEXT Description
    }