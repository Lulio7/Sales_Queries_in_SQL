# 🛍️ Retail Sales SQL Analysis  
Analyzing Retail Sales Data Using SQL

## 📌 Overview

This project explores, transforms, and analyzes retail sales data from a table named `sales_data`.  
Using SQL, the data is cleaned, enhanced with new columns, and analyzed to gain insights into customer behavior, product performance, revenue distribution, and commercial trends.

---

## 🎯 Project Purpose

- Understand sales behavior across time, city, and customer type.
- Prepare a dataset for dashboarding in tools like Power BI or Tableau.
- Identify trends and patterns across product lines, payment methods, and weekdays.
- Support strategic decision-making with data-backed insights.

---

## 🛠️ Data Cleaning & Transformation

- ✅ Converted the `Time` column to `TIME` format.
- ✅ Added `time_of_date` to classify transactions into Morning, Afternoon, or Evening.
- ✅ Created `day_name` and `month_name` columns from the `Date` field for temporal analysis.

---

## 📊 Analysis Performed

### 🗺️ Geography & Branches
- Identified unique cities.
- Mapped branches to cities.

### 📦 Products
- Counted distinct product lines.
- Identified most sold product line.
- Calculated total revenue per product line.
- Determined product line with highest average VAT.
- Averaged customer ratings by product line.
- Analyzed most common product line by gender.

### 💸 Sales & Revenue
- Total revenue by month.
- Month with the highest COGS (Cost of Goods Sold).
- City with the highest revenue.
- Branches selling more products than average.
- Sales by time of day per weekday.
- Customer types generating the most revenue.

### 🧾 Taxes & Payments
- Most common payment methods.
- Cities with the highest average VAT.
- Customer types paying the most in VAT.

### 👥 Customer Profile
- Most common customer types.
- Gender distribution of customers.
- List of unique payment methods.

---

## 📈 Commercial Applications

- **Marketing & Segmentation**: Target high-sales time slots and product lines.
- **Inventory & Supply Chain**: Align stock based on top-selling products and locations.
- **Operational Strategy**: Optimize performance by analyzing branches and staff allocation.
- **Customer Experience**: Tailor offerings by gender and customer type.
- **Financial Planning**: Use revenue and VAT trends for forecasting and budgeting.

---

## 🧠 Tools Used

- SQL for all data transformation and analysis steps.
- Compatible with MySQL, MariaDB, or other RDBMS.

---

## 🗂️ Data Structure (Key Columns)

| Column          | Description                        |
|-----------------|------------------------------------|
| `Date`          | Date of transaction                |
| `Time`          | Time of transaction                |
| `City`          | City where sale occurred           |
| `Branch`        | Branch identifier                  |
| `Product line`  | Category of product                |
| `Total`         | Total sale value                   |
| `Tax 5%`        | Value-added tax                    |
| `Payment`       | Payment method used                |
| `Customer type` | Member or normal customer          |
| `Gender`        | Gender of customer                 |
| `Quantity`      | Number of items purchased          |
| `Rating`        | Customer rating of the experience  |
| `time_of_date`  | Part of day (Morning/Afternoon/Evening) |
| `day_name`      | Day of the week                    |
| `month_name`    | Month of the year                  |

---

## 📎 Notes

- The queries are written in standard SQL and should work in most SQL-based environments.
- This dataset can be easily exported to Power BI or Tableau for visual exploration.

---

## 📬 Contact

For questions or suggestions, feel free to open an issue or reach out via [LinkedIn](https://www.linkedin.com).
