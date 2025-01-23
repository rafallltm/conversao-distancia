FROM python:3.10-alpine

WORKDIR /app

RUN apk update && apk upgrade --no-cache

COPY . .

RUN pip install -r requirements.txt

RUN adduser -D appuser && chown -R appuser:appuser /app
USER appuser

EXPOSE 5000

ENTRYPOINT ["gunicorn", "-w", "4", "-b", "0.0.0.0:5000", "app:app"]
