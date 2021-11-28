
library(tidyverse)

setwd('C:/Users/Naika/Desktop/Personal Space/Data Analytics/ANA 515 - Data Storage/Week 6/')
getwd()

#1 - Read the data into data frame using function "read_csv" from package "tidyverse"
stormEvents <- read_csv('StormEvents_details-ftp_v1.0_d1993_c20210803.csv')

#2 - Limit the data frame to listed columns
vars <- c("BEGIN_DATE_TIME" , "EPISODE_ID", "END_DATE_TIME", "EVENT_ID" , 
             "STATE" , "STATE_FIPS", "CZ_NAME", "CZ_TYPE", "CZ_FIPS", "EVENT_TYPE", 
             "SOURCE", "BEGIN_LAT", "BEGIN_LON", "END_LAT", "END_LON")
stormEvents_Final <- stormEvents[vars]
head(stormEvents_Final,10)
getwd()

#3 - Convert to date-time class
install.packages("lubridate")
library(lubridate)
library(dplyr)

stormEvents_Final <- stormEvents_Final %>%
mutate(END_DATE_TIME = dmy_hms(END_DATE_TIME))

stormEvents_Final <- stormEvents_Final %>%
  mutate(BEGIN_DATE_TIME = dmy_hms(BEGIN_DATE_TIME))
head(stormEvents_Final)

#4 - Change "country" to title case
install.packages("stringr")
library(stringr)
stormEvents_Final$STATE <-  str_to_title(stormEvents_Final$STATE, locale = "en")
head(stormEvents_Final,10)

#5 - Limit to the events listed by county FIPS 
install.packages("dplyr")
library(dplyr)
stormEvents_Final <- stormEvents_Final %>%
  filter(CZ_TYPE == "C")  %>%
    select(-CZ_TYPE)

#6 - Pad the state and county FIPS with a "0" at the beginning and unite the columns
stormEvents_Final$STATE_FIPS <- str_pad(stormEvents_Final$STATE_FIPS,width = 3, side = "left", pad = "0")
stormEvents_Final$CZ_FIPS <- str_pad(stormEvents_Final$CZ_FIPS,width = 3, side = "left", pad = "0")
install.packages("tidyr")
library(tidyr)
stormEvents_Final <- unite(stormEvents_Final,"fips",c(STATE_FIPS,CZ_FIPS),sep = "", remove = FALSE)
head(stormEvents_Final)

#7 - Change all column names to lower case
stormEvents_Final <- rename_all(stormEvents_Final,tolower) 


#8 - New data frame with the 3 columns
us_state_info<-data.frame(state=state.name, region=state.region, area=state.area)

#9 - Create a dataframe with the number of events per state using a frequency table
eventsFreq <- data.frame(table(stormEvents_Final$state))
eventsFreq<-rename(eventsFreq, c("state"="Var1"))
head(eventsFreq)
state_storms <- merge(x=eventsFreq,y=us_state_info,by.x="state", by.y="state")


#10 - The plot
library(ggplot2)
storm_plot <- ggplot(state_storms,aes(x = area, y = Freq)) + 
  geom_point(aes(color = region)) + 
  labs(x = "Land area(square miles)",
       y = "# of storm events in 1993")
storm_plot



















