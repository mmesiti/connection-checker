#!/usr/bin/env python3
import pandas as pd
from matplotlib import pyplot as plt
from sys import argv

try:
    nlast = - int(argv[1])
except:
    nlast = -86400//5


data =pd.read_csv("./connection_data.txt",sep = ';',header =0)
data.Date = pd.to_datetime(data.Date)
data['State'] = data.PingMessage.str.split(',',expand=True)[1].str.split(' ',expand=True)[1].astype(int)
state = data[['Date','State']].set_index('Date')

plt.figure(figsize = (15,8))
plt.plot(state[nlast:])
plt.title("Connection status - last day")
plt.xticks(rotation = 90)
plt.savefig("conn_history.png")
