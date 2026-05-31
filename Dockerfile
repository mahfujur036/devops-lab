FROM python:3.11.15-trixie

WORKDIR /app

RUN useradd app

COPY . .

RUN pip3 install --no-cache-dir -r requirements.txt

USER app

ENTRYPOINT ["python3"]

CMD ["app.py"]
