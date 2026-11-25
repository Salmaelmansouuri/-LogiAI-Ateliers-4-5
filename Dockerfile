FROM python:3.11-slim

WORKDIR /app

COPY requirements.txt .

RUN --mount=type=cache,target=/root/.cache/pip python -m pip install --timeout 300 --retries 10 -r requirements.txt

COPY pyproject.toml /tmp/build/
COPY logiai/ /tmp/build/logiai/
RUN pip install --no-cache-dir --no-deps /tmp/build && rm -rf /tmp/build
COPY models/ ./models/
COPY data/ ./data/

EXPOSE 8000

CMD ["python", "-m", "uvicorn", "logiai.api.main:app", "--host", "0.0.0.0", "--port", "8000"]
