FROM python:3-alpine3.13

WORKDIR /app

COPY requirements.txt .
RUN pip install -r requirements.txt

COPY backend/ .
RUN python3 manage.py makemigrations
RUN python3 manage.py migrate

CMD [ "python3","manage.py","runserver" ]