FROM python:3.8.5-slim

ENV FLASK_APP pipetest.py
ENV FLASK_ENV development
ENV FLASK_DEBUG false
ENV FLASK_RUN_PORT 8080
ENV FLASK_RUN_HOST 0.0.0.0

ENV PIPETEST_QUERIED_USERS antomer
ENV PIPETEST_QUERYING_INTERVAL 30
ENV PIPETEST_PIEPEDRIVE_COMPANY_NAME antonsawesomecompany

RUN mkdir /db/

COPY src/pipetest.py /app/
COPY src/settings.py /app/
COPY src/requirements.txt /app/

RUN pip3 install -r /app/requirements.txt

WORKDIR /app/
EXPOSE 8088
CMD flask run
