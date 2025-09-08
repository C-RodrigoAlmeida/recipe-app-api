FROM python:3.12-slim

LABEL maintainer="Rodrigo Almeida <c.almeidarodrigo@gmail.com>"

ENV PYTHONUNBUFFERED=1 \
    POETRY_NO_INTERACTION=1 \
    POETRY_VENV_IN_PROJECT=1

ARG DEV=false

RUN pip install poetry && \
    apt-get update && apt-get install -y --no-install-recommends build-essential && \
    rm -rf /var/lib/apt/lists/* && \
    useradd --create-home --shell /bin/bash app

WORKDIR /app

COPY pyproject.toml poetry.lock ./
COPY ./src ./src
COPY ./config ./config

RUN poetry config virtualenvs.create true && \
    poetry config virtualenvs.in-project true && \
    if [ "$DEV" = "true" ]; then \
        poetry install --no-root; \
    else \
        poetry install --only=main --no-root; \
    fi && \
    rm -rf /root/.cache && \
    mkdir -p /app/src && \
    mkdir -p /app/config && \

USER app

EXPOSE 8000

CMD ["python", "manage.py", "runserver", "0.0.0.0:8000"]