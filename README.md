# 🛒 Zepto E-commerce SQL Data Analyst Portfolio Project

A complete, real‑world SQL portfolio project based on an e‑commerce inventory dataset scraped from Zepto, one of India’s fastest‑growing quick‑commerce startups. This project simulates how **Data Analysts / Business Analysts / SQL Analysts** work with messy production data to generate **business‑ready insights**.

---

## 🚀 Why This Project Matters

This project is designed to closely mirror **real analyst workflows** used in retail and e‑commerce companies:

* Working with **raw, inconsistent inventory data**
* Performing **Exploratory Data Analysis (EDA)** using SQL
* Cleaning and transforming data for analysis
* Writing **business‑driven SQL queries** for decision‑making

It is ideal for:

* 📊 Data Analyst / Business Analyst / SQL Analyst aspirants
* 📚 Anyone learning SQL hands‑on with real data
* 💼 Interview and portfolio preparation for analytics roles

---

## 📌 Project Overview

The main objective is to analyze Zepto’s inventory data using SQL to uncover insights related to:

* Product pricing and discounts
* Inventory availability and stock‑outs
* Category‑level revenue potential
* Value‑for‑money product identification

Each record represents a unique **SKU (Stock Keeping Unit)**. Duplicate product names exist due to variations in package size, weight, discounts, or category — exactly how real e‑commerce catalogs behave.

---

## 📁 Dataset Overview

* **Source**: Kaggle (scraped from Zepto’s product listings)
* **Nature**: Real‑world, messy e‑commerce inventory data

### 🧾 Columns

| Column Name              | Description                                        |
| ------------------------ | -------------------------------------------------- |
| `sku_id`                 | Unique identifier for each product (Primary Key)   |
| `name`                   | Product name as shown in the app                   |
| `category`               | Product category (Fruits, Snacks, Beverages, etc.) |
| `mrp`                    | Maximum Retail Price (converted from paise to ₹)   |
| `discountPercent`        | Discount percentage on MRP                         |
| `discountedSellingPrice` | Final selling price after discount (₹)             |
| `availableQuantity`      | Units available in inventory                       |
| `weightInGms`            | Product weight in grams                            |
| `outOfStock`             | Stock availability flag (TRUE/FALSE)               |
| `quantity`               | Units per package (mixed with loose items)         |

---

## 🛠️ Tech Stack

* **SQL (PostgreSQL)**
* **pgAdmin** for database management
* **CSV Data Handling & Encoding Fixes**

---

## 🔧 Project Workflow

### 1️⃣ Database & Table Creation

Created a structured PostgreSQL table with appropriate data types to match a real inventory system.

### 2️⃣ Data Import

* Imported CSV using pgAdmin
* Resolved UTF‑8 encoding issues by converting the dataset to **CSV UTF‑8 format**
* Alternative `\copy` command provided for CLI users

### 3️⃣ Exploratory Data Analysis (EDA)

* Counted total records
* Reviewed sample rows
* Checked null values across columns
* Identified unique product categories
* Compared in‑stock vs out‑of‑stock items
* Detected products with multiple SKUs

### 4️⃣ Data Cleaning

* Removed rows with invalid pricing (MRP = 0 or Selling Price = 0)
* Converted pricing from **paise to rupees** for consistency

### 5️⃣ Business‑Focused SQL Analysis

* Top 10 best‑value products by discount
* High‑MRP products currently out of stock
* Estimated potential revenue by category
* Expensive products with minimal discounts
* Top 5 categories with highest average discounts
* Price‑per‑gram analysis to find value‑for‑money items
* Product weight segmentation (Low / Medium / Bulk)
* Total inventory weight per category

---

## 📊 Key Business Insights

* Identified **high‑discount SKUs** driving customer value
* Highlighted **stock‑out risks** for premium products
* Revealed categories with **maximum revenue potential**
* Enabled **pricing and inventory optimization** decisions

##

---

## 📂 How to Run This Project

```bash
git clone https://github.com/amlanmohanty/zepto-SQL-data-analysis-project.git
cd zepto-SQL-data-analysis-project
```

1. Create a PostgreSQL database
2. Open `zepto_SQL_data_analysis.sql`
3. Run table creation and SQL queries
4. Import the dataset (ensure UTF‑8 encoding)
5. Follow the YouTube video for step‑by‑step execution

---

## 📜 License

This project is licensed under the **MIT License**.
Feel free to fork, star ⭐, and use it in your analytics portfolio.

---

## 🙌 Author

**Sahil Birari**
SQL & Data Analytics Enthusiast

---

⭐ *If you find this project useful, consider giving it a star!*

