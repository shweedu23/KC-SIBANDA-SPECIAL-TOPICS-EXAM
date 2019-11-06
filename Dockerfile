FROM r-base

COPY ./requirements.R requirements.R 
COPY ./crime.csv crime.csv 
COPY ./app.R app.R 

RUN RScript requirements.R 

CMD ["RScript", "app.R"]