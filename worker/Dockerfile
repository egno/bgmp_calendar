FROM python:3.8

# Keeps Python from generating .pyc files in the container
ENV PYTHONDONTWRITEBYTECODE 1

# Turns off buffering for easier container logging
ENV PYTHONUNBUFFERED 1

COPY . /app

WORKDIR /app

RUN python -m pip install -r requirements.txt

CMD ["python", "app.py"]