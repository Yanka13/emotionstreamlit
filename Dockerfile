FROM python:3.8.6-buster

EXPOSE 8080

COPY requirements.txt app/requirements.txt
RUN apt update; apt install -y libgl1
RUN pip install --upgrade pip
RUN pip install -r app/requirements.txt

COPY . /app
WORKDIR /app

ENTRYPOINT ["streamlit", "run", "streamlit_hadjer.py", "--server.port=8080", "--server.address=0.0.0.0"]
