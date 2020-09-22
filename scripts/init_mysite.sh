#!/bin/bash

# Install packages for local
# TODO: Installation of requirements should be done in docker build.
poetry install

# Prepare database
poetry run python manage.py migrate
poetry run python manage.py shell -c "from django.contrib.auth import get_user_model; get_user_model().objects.create_superuser('admin', 'admin@example.com', 'adminpass');"

# Start runserver
poetry run python manage.py runserver 0.0.0.0:8000
