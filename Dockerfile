FROM python:3.11-alpine AS builder

WORKDIR /app

COPY requirements.txt .
RUN pip3 install --no-cache-dir -r requirements.txt

FROM python:3.11-alpine AS runtime

COPY --from=builder /root/.local /root/.local
COPY app.py .

RUN adduser --disabled-password --gecos '' app
USER app

ENTRYPOINT ["python3"]

CMD ["app.py"]
