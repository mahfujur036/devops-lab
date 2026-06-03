FROM python:3.11-alpine

WORKDIR /app

COPY requirements.txt .
RUN pip3 install --no-cache-dir -r requirements.txt

FROM python:3.11-alpine AS runtime

COPY app.py .

RUN adduser --disabled-password --gecos '' app
USER app

ENTRYPOINT ["python3"]

CMD ["app.py"]
