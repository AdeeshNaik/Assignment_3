# Assignment_3
Getting &amp; Cleaning Data
1.	Go to https://www1.ncdc.noaa.gov/pub/data/swdi/stormevents/csvfiles/ and download the bulk storm details data for the year you were born, in the file that starts “StormEvents_details” and includes “dXXXX”. For example, it looks like this for 2017:  
  
Make sure it is the details file, not fatalities or locations
Move this into a good local directory for your current working directory and read and save it. (5 points)

2.	Limit the dataframe to the following columns: (10 points)
•	the beginning and ending dates and times (make sure to keep BEGIN_DATE_TIME and END_DATE_TIME) 
•	the episode ID
•	the event ID
•	the state name and FIPS
•	the “CZ” name
•	type
•	FIPS
•	the event type 
•	the source
•	the beginning latitude and longitude and ending latitude and longitude 

3.	Convert the beginning and ending dates (BEGIN_DATE_TIME and END_DATE_TIME) to a “date-time” class (there should be one column for the beginning date-time and one for the ending date-time) (5 points) 

4.	Change state and county names to title case (e.g., “New Jersey” instead of “NEW JERSEY”) (5 points) 

5.	Limit to the events listed by county FIPS (CZ_TYPE of “C”) and then remove the CZ_TYPE column (5 points) 

6.	Pad the state and county FIPS with a “0” at the beginning (hint: there’s a function in stringr to do this) and then unite the two columns to make one fips column with the 5 or 6-digit county FIPS code (5 points) 

7.	Change all the column names to lower case (you may want to try the rename_all function for this) (5 points) 

8.	There is data that comes with base R on U.S. states (data("state")). Use that to create a dataframe with these three columns: state name, area, and region (5 points)

9.	Create a dataframe with the number of events per state in the year of your birth. Merge in the state information dataframe you just created in step 8. Remove any states that are not in the state information dataframe. (5 points) 

10.	Create the plot between Land Area and no of storm events in 1993 (10 points): 
