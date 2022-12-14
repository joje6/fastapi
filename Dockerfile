FROM python:3.8-slim-buster

ENV PYTHONDONTWRITEBYTECODE=1
ENV PYTHONUNBUFFERED=1

COPY requirements.txt .
RUN python -m pip install -r requirements.txt

WORKDIR /app
COPY . /app

RUN useradd appuser && chown -R appuser /app
USER appuser

ENTRYPOINT ["uvicorn","main:app","--port","8000","--host","0.0.0.0"]
