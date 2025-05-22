FROM python:3.11.12-alpine3.21


ENV PIP_DISABLE_PIP_VERSION_CHECK 1
ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1
RUN apk add --no-cache \
    gcc \
    g++ \
    musl-dev \
    python3-dev \
    libffi-dev \
    build-base \
    py3-pip \
    linux-headers
WORKDIR /code

COPY . .

RUN pip install -r requirements.txt
EXPOSE 8000

# Run server
RUN python manage.py makemigrations
RUN python manage.py migrate
RUN python manage.py train

CMD ["python", "manage.py", "runserver", "0.0.0.0:8000"]