# Use the official Python image from Docker Hub
FROM python:3.10-slim

WORKDIR /app

COPY hello.py .

CMD ["python", "hello.py"]
