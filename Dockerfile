FROM python:3.4
MAINTAINER leeseohyeon21@gmail.com

RUN apt-get update \
       && apt-get install -y --no-install-recommends \
              postgresql-client \
       && rm -rf /var/lib/apt/lists/*

WORKDIR /C:/docker/django/mysite
COPY requirements.txt ./
RUN pip install -r requirements.txt
COPY . .

EXPOSE 8000

CMD ["python", "manage.py", "runserver", "0.0.0.0:8000"]