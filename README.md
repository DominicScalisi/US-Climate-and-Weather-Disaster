# US-Climate-and-Weather-Disasters
Project Status
Completed

Project Objective

This project analyzes the NOAA U.S. Billion-Dollar Weather and Climate Disasters dataset (1980–2024) to identify trends in the economic impact, severity, and frequency of disasters over time. The goal is to uncover how the scope and scale of these events have evolved and provide data-driven insights into the growing financial and human toll of extreme weather events in the United States.

Data Source

NOAA National Centers for Environmental Information (NCEI)

Dataset: Billion-Dollar Weather and Climate Disasters (1980–2024)

Data Preparation

The dataset was first prepared into Excel to address column capitialization and fix date formatting for import to PostgreSQL.

Imported into PostgreSQL to clean and analyze

  -Null rows were removed as they did not contain any usable data.

A new column cpi_adjusted_cost_fix was created to convert CPI-adjusted costs (originally scaled in billions) into full dollar amounts for clarity.

 <img width="443" height="627" alt="Screenshot 2025-08-03 173009" src="https://github.com/user-attachments/assets/ef29f68f-079c-4b88-878a-d756b1cef2c9" />


Technologies Used

Excel (initial data formatting)

PostgreSQL (data cleaning and analysis)

SQL (queries and calculations)

Tableau (data visualization)

Key Metrics

Total Disasters from 1980–2024:	403.
Total CPI-Adjusted Cost	$2,916,862,100,000,000.
Most Deadly Event Type:	Tropical Cyclones (2,981 deaths).
Longest Duration Event: Type	Drought (365 days).
Total disaster count from 2020 to 2024 is 115 and accounts for 28% of all disasters.

Summary Insights

Economic Impact:
The total CPI-adjusted cost of all disasters is $2.92 quadrillion. The cost per decade continues to increase. From 1980 to 1989, the total cost was $2.19 trillion. From 2020 to 2024, the cost was $7.46 trillion.

Disaster Frequency:
The number of disasters per year has continued to increase. Between 1980 and 1999 (two decades), there were 90 total disasters. From 2020 to 2024 (only four years), there were 115—accounting for 28% of all recorded disasters.

Severity & Deaths:
Disasters were categorized by severity using a common table expression

<img width="1158" height="776" alt="Screenshot 2025-08-02 000221" src="https://github.com/user-attachments/assets/3061a13f-e806-4ca0-8453-df3baa2c4819" />

Two tropical cyclones (Katrina, and Maria) and one drought (Central/Eastern Drought/Heat Wave) were labeled as catastrophic. 

<img width="1249" height="766" alt="Screenshot 2025-08-02 191146" src="https://github.com/user-attachments/assets/0341d39a-89af-4a1a-8c60-57b17e823f3a" />

The amount of disasters per severity category

<img width="363" height="217" alt="Screenshot 2025-08-03 165111" src="https://github.com/user-attachments/assets/ac2bc584-5227-4fcb-b9a7-0a7020cd6790" />

Tropical cyclones were the deadliest, accounting for 7,211 total deaths.

Droughts were the longest-lasting, with durations of up to 365 days. They accounted for 1260 total deaths.

Notable Impacts:

Homeowner insurance companies like Lexington Insurance and Bankers Insurance have pulled out of Florida due to mounting disaster costs and increased risk.

In August 2024, FEMA paused recovery and rebuilding efforts in numerous disasters when the Disaster Relief Fund (DRF) was dangerously low. Congress funded the DRF with $20 billion dollars in October 2024 to continue relief efforts.
