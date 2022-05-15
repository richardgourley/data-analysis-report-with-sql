# Data Analysis Report with SQL

## INTRO
This is a report using SQL join queries to retrieve information from a data warehouse with a star schema. 

The report is based on a company who want to use their data warehouse, which stores incidents of server downtime in a fact table, to discern if the number of incidents has improved since the company started in January, in the first quarter of the year, and to understand where to focus their efforts in order to improve downtime issues.

The company owners have tasked the data analyst with answering a list of questions to determine if there are downtime issues with a specific time of the day, day of the week, day of the month, office or a specific employee.

## Data Warehouse Design
The tables of the data warehouse required to investigate downtime incidents are shown in this diagram:

![Data Warehouse Test Tables](https://github.com/richardgourley/data-analysis-report-with-sql/raw/main/data_warehouse_test_tables.png)

## CONTENT
- The queries to answer the questions below are in the 'analysis_queries.sql' file.
- The 'create_tables.sql' file will create the data warehouse tables.
- All other 'insert...' files will insert data into the dw tables.

## Questions for Analysis
- The company owners would like the Data Analyst to report back and answer the questions below, particularly focusing on how the servers have performed in quarter 1 since January and any recommendations as to what to focus on to solve downtime problems.

**OVERVIEW - QUARTER 1**

1. What were the total number of incidents?

2. What was the max, min and avg downtime in minutes?

**SPECIFIC ANALYSIS - QUARTER 1**

3. Which day of the week had the most incidents?

4. Which day of the month had the most incidents?

5. Which time of day had the most incidents?

6. Which hour of the day had the most incidents?

7. Which month had the most incidents?

8. Which employee reported the most incidents, and which office are they based in?

9. Which office reported the most incidents?

10. Which office had the highest average downtime and what were the overall number of incidents per office?

**See the SQL queries that answered the questions above:**
https://github.com/richardgourley/data-analysis-report-with-sql/blob/main/analysis_queries.sql

**See the final report based on the answers here:**
https://github.com/richardgourley/data-analysis-report-with-sql/blob/main/final_report.MD





