#### Pulling in stock data with python
import polars as pl
import yfinance as yf

my_stocks =["CI", "DAL", "LLY", "NVO" ,"SCHW","AMZN","AAPL","BAC","NYCB","ALLY","LMT","RIG","DAC"]
stocks_df = my_stocks.info