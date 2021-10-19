install.packages("vegperiod")

vegperiod(dates=goe$date, Tavg=goe$t,
          start.method="ETCCDI", end.method="ETCCDI")

# add column with sum of day degrees in vegetation periods
vegperiod(dates=goe$date, Tavg=goe$t, Tsum.out=TRUE,
          start="StdMeteo", end="StdMeteo")
