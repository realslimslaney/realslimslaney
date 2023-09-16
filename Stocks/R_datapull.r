#### pulling in stock data with R
## copying work from R Studio

### Install R Packages
#install.packages("rtools")
#install.packages("dplyr")   # has functions for manipulating data
#install.packages("tidyr")   # has functions for manipulating data
#install.packages("openxlsx")# used for outputting files to excel
#install.packages("ggplot2") # used for visualizations
#install.packages("data.table")
#install.packages("tidyverse")
#install.packages("MASS")
#install.packages("reshape")
#install.packages("reshape2")
#install.packages("zoo")
#install.packages("quantmod")


### Call packages into Library
library(base)
library(odbc)
library(dplyr)
library(tidyr)
library(openxlsx)
library(data.table)
library(tidyverse)
library(reticulate)
library(MASS)
library(reshape)
library(reshape2)
library(zoo)
library(quantmod)
library(lubridate)

### List stocks to analyze
my_stocks <- c("CI", "DAL", "LLY", "NVO" ,"SCHW","AMZN","AAPL","BAC","NYCB","ALLY","LMT","RIG","DAC")

### Define universal date variables
start_date <-  as.Date("2018-12-31")
today <- as.Date(Sys.Date())

### Connects to Yahoo Finance and pulls in stock data
yf_data = getSymbols(my_stocks, from = start_date, to = today, auto.assign = TRUE)
head(yf_data)

### Define singular data table of key stock data
stocks_dt <- data.table(yf_data)
#stocks_dt$ticker <- my_stocks

for (i in 1:length(my_stocks)){
  stocks_dt[i,"current_price"] = 1
  stocks_dt[i,"52 week high"] = 2
  stocks_dt[i,"52 week low"] = 0.5
}

print(stocks_dt)


### Find something else cool to do

