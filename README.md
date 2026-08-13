# DataCo. Supply Chain Optimization Analysis

##  Project Overview

This project analyzes supply chain data to identify patterns in sales, profitability, customer behavior, product performance and delivery operations.

The project combines **Python, PostgreSQL and Power BI** to clean, analyze and visualize the data and provide actionable business insights.

---

##  Business Objectives

- Analyze overall sales and profitability
- Identify top-performing products and categories
- Analyze customer segments and high-value customers
- Evaluate delivery performance and shipping efficiency
- Identify late-delivery patterns
- Analyze product-level performance using ABC analysis
- Build an interactive Power BI dashboard for business reporting

---
## Power BI Dashboard

<table>
  <tr>
    <td><b>Executive Overview</b></td>
    <td><b>Delivery & Operations</b></td>
  </tr>
  <tr>
    <td><img width="1004" height="597" alt="Executive Overview" src="https://github.com/user-attachments/assets/39e00ddd-1c2a-492f-a737-e07209ed6819" />
</td>
    <td><img width="1000" height="605" alt="Delivery   Operations" src="https://github.com/user-attachments/assets/d990caef-37ce-4377-ac9b-b2734b98328e" />
</td>
  </tr>
  <tr>
    <td><b>Product Analysis</b></td>
    <td><b>Customer Analysis</b></td>
  </tr>
  <tr>
    <td><img width="1106" height="608" alt="Product Analysis" src="https://github.com/user-attachments/assets/9d8d0c15-da61-4e83-a64d-1d290df02dcf" />
</td>
    <td><img width="1014" height="610" alt="Customer Analysis" src="https://github.com/user-attachments/assets/cd0a376e-74b8-4ffd-8ec5-43b07ea437ba" />
</td>
  </tr>
</table>

---
##  Tools & Technologies

- **Python** : Data cleaning, EDA and ABC analysis
- **Pandas** : Data manipulation
- **Matplotlib** : Data visualization
- **PostgreSQL** : SQL analysis
- **Power BI** : Interactive dashboards and visualization
- **Excel** : Supporting analysis

---

##  Project Structure

```text
DataCo_Supply_Chain_Optimization/
│
├── Datasets/
│   ├── Raw/
│   ├── Cleaned/
│   └── DataCoSupplyChain_Dictionary.csv
│
├── Python/
│   ├── 01_Data_Cleaning.ipynb
│   ├── 02_EDA.ipynb
│   └── 03_ABC_Analysis.ipynb
│
├── SQL/
│   └── DataCo_Supply_Chain_Analysis.sql
│
├── Power BI/
│   └── DataCo_Supply_Chain_Dashboard.pbix
│
├── Images/
│   ├── Executive_Overview.png
│   ├── Delivery_Operations.png
│   ├── Product_Analysis.png
│   └── Customer_Analysis.png
│
└── Analysis/
    └── ABC_Analysis_Results.xlsx
