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

## Final Report

**Answers:**
1. There were 23 incidents in Quarter 1.
2. The max downtime was 30 minutes, the minimum dowtime was 6 minutes and the average downtime was 13 minutes.
3. Far and away, most downtime incidents happen on Mondays with 14 incidents reported, followed by Tuesday with 4 incidents 
and Wednesday with only 2 incidents.
4. Most incidents happen on the 3rd and the 17th of the month with 4 and 3 incidents respectively. However, there isn't 
one particular day of the month that indicates a particular problem on a given day of the month.
5. Far and away most downtime incidents happen in the morning with 20 out of 23 incidents in quarter 1 happening in the 
morning, compared to 2 at night and 1 in the evening.
6. Over half of downtime incidents happen between 8 and 9am with 12 incidents reported, followed by 3 incidents between 11 
and 12pm and 2 incidents between 3 and 4pm, and 2 incidents reported between 9 and 10am.
7. The majority of incidents were reported in January with far less incidents reported in February and March.  16 incidents
were reported in January, with only 7 incidents reported in February and March combined.
8. Paul Bradley in the Manhattan office reported the most incidents with 11 reported.
9. The Manhattan office reported 16 incidents compared to only 7 incidents in the Bakerloo office.
10. Despite having more incidents than the Bakerloo office by 16 to 7, the average downtime was better in the Manhattan 
office, with an average downtime of 12 minutes compared to 15 minutes in the Bakerloo office.

**CONCLUSION:**
- The day of the week Monday seems to be a cause of downtime incidents
- The morning is the time of the day far more likely to have downtime incidents.
- The hours between 8 and 9am are when most incidents occur with just over half of the incidents happening at those hours.
- Most incidents occured in January. The number of incidents has significantly dropped in February and March.
- Most incidents occured in the Manhattan office.  Although a number of incidents were also reported in the Bakerloo office.
- Average downtime was fairly similar in both offices.

- Overall, the main recommendation is to further assess if there are spikes in traffic on Monday mornings and specifically between 8 and 9am. Following that, it is recommended to speak to our cloud providers and discuss ways to allow server performance to scale and handle spikes in traffic at the key times mentioned above.



