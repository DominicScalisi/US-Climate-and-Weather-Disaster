# US-Climate-and-Weather-Disasters
Project Status
Completed

Project Objective
This project analyzes the NOAA U.S. Billion-Dollar Weather and Climate Disasters dataset (1980–2024) to identify trends in the economic impact, and frequency of disasters over time. The goal is to uncover how the scope and scale of these events have evolved and provide data-driven insights into the growing financial and human toll of extreme weather events in the United States.

Data Source
NOAA National Centers for Environmental Information (NCEI)

Dataset: Billion-Dollar Weather and Climate Disasters (1980–2024)

NOAA Billion-Dollar Disasters Database

Data Preparation
The dataset was first cleaned and reformatted in Excel to fix column naming issues and address date inconsistencies.

Loaded into PostgreSQL for further cleaning and analysis.

  -Null rows (fully empty entries) were removed as they did not contain any usable data.
  
<img width="751" height="718" alt="Screenshot 2025-07-31 164518" src="https://github.com/user-attachments/assets/48fafc9d-142d-4125-8355-4b6114ee9bd8" />


  -A new column cpi_cost_full_amount was created to convert CPI-adjusted costs (originally scaled in billions) into full dollar amounts for clarity.
  <img width="1431" height="283" alt="Screenshot 2025-07-31 164643" src="https://github.com/user-attachments/assets/4049a84a-57cd-4462-831c-9439c19a9558" />

Resources:

Excel File (used for preprocessing)

SQL Query (used for data cleaning and analysis)

Interactive Tableau Dashboard

Technologies Used
Excel (initial data formatting)

PostgreSQL (data cleaning and analysis)

SQL (queries and calculations)

Tableau (data visualization)

Summary Insights

Economic Impact:
The total CPI-adjusted cost of billion-dollar disasters is approximately $2.92 quadrillion. The cost per decade has continued to increase. In the 1980s, the total cost was $2.19 trillion. In 2020 to 2024, the cost was $7.46 trillion.

Disaster Frequency:
The number of disasters per year has increased. Between 1980 and 1999 (two decades), there were 90 total disasters. From 2020 to 2024 (only four years), there were 115—accounting for 28% of all recorded disasters.

Severity & Deaths:
Disasters were categorized by severity using a CASE statement. If a disaster had more than 1000 deaths or a cost of over $100000000 then the disaster would be labeled as catastrophic. If deaths equaled 100 or cost was $10000000 then it would be labeled as severe and so on.

Two tropical cyclones (Katrina, and Maria) and one drought (Central/Eastern Drought/Heat Wave) were labeled as catastrophic 

Tropical cyclones were the deadliest, accounting for 2,981 total deaths.

Droughts were the longest-lasting, with durations of up to 365 days. They accounted for 1260 deaths total.

Notable Impacts:

Homeowner insurance companies like Lexington Insurance and Bankers Insurance have pulled out of Florida due to mounting disaster costs and increased risk.

In August 2024, FEMA paused recovery and rebuilding efforts in numerous disasters when the Disaster Relief Fund (DRF) was dangerously low. Congress funded the DRF with $20 billion dollars in October 2024 to continue relief efforts.

Key Metrics
Total Disasters (1980–2024)	403
Total CPI-Adjusted Cost	$2,916,862,100,000,000
Most Deadly Event Type	Tropical Cyclones (2,981 deaths)
Longest Duration Event Type	Drought (365 days)
Total disaster count from 2020 to 2024 is 115 and accounts for 28% of all disasters.

How to Use

View the Dashboard: Explore the Tableau dashboard to interact with trends by frequency, cost, and severity.

Run SQL Analysis: Use the provided SQL script to recreate the analysis or adapt it for your own research.

Review Preprocessing Steps: The Excel file shows how the original NOAA data was prepared for SQL ingestion.

