FROM python:3.10-slim-bullseye

RUN apt-get update \
  && apt-get install -y --no-install-recommends --no-install-suggests \
  build-essential=12.9 \
  default-libmysqlclient-dev=1.0.5 \
  && pip install --no-cache-dir --upgrade pip==23.1.2 \
  && apt-get clean \
  && rm -rf /var/lib/apt/lists/*

RUN useradd --create-home appuser

WORKDIR /app

# COPY command without --chown, so files will be owned by root
COPY ./requirements.txt /app
RUN pip install --no-cache-dir --requirement /app/requirements.txt
COPY . /app

# Make sure everything in /app is owned by root and not world-writable
RUN chown -R root:root /app && chmod -R 755 /app

USER appuser

EXPOSE 5000

CMD ["python3", "server.py"]
