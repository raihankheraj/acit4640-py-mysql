FROM python:3

RUN mkdir /app 
RUN mkdir /frontend
RUN mkdir /backend

WORKDIR /tmp

RUN pip install gunicorn
RUN apt-get  update -y
RUN apt-get install -y wget wait-for-it


# RUN wget https://github.com/timoguic/acit4640-py-mysql/archive/refs/heads/master.zip -O /tmp/source.zip
# RUN unzip /tmp/source.zip

COPY ./backend/ /backend/src
COPY ./frontend/ /frontend

# RUN mv acit4640-py-mysql-master/frontend /frontend
# RUN mv acit4640-py-mysql-master/backend /backend/src

WORKDIR /backend/src
RUN python -m pip install -r ./requirements.txt

# COPY ./waitforit_backend.sh .


# EXPOSE 8000
CMD ["bash", "waitforit_backend.sh"]