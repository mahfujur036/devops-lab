FROM python:3.11-alpine AS builder

WORKDIR /app

COPY requirements.txt .
RUN pip3 install --no-cache-dir -r requirements.txt

FROM python:3.11-alpine AS runtime

COPY --from=builder /app/app.py .
COPY app.py .

RUN adduser --disabled-password --gecos '' app
USER app

EXPOSE 5000

ENTRYPOINT ["python3"]

CMD ["app.py"]
