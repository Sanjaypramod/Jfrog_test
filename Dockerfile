
# Use an official Python image as the base image
FROM python:3.9-slim

# Arguments
ARG JFROG_USERNAME
ARG JFROG_PASSWORD
ARG JFROG_URL

# Set the working directory in the container
WORKDIR /app

# Copy requirements file
COPY setup.py .

# # Install dependencies from JFrog
# RUN pip config set global.index-url https://${JFROG_USERNAME}:${JFROG_PASSWORD}@${JFROG_URL} && \
#     pip install --extra-index-url https://pypi.org/simple --no-cache-dir .

# pip conf
RUN mkdir -p /root/.config/pip
COPY pip.conf ~/.config/pip/pip.conf

# Copy the application code to the container
COPY . /app

# Install pip requirements
# RUN python -m pip install -r requirements.txt

# Define the command to run the application
# CMD ["python", "app.py"]

CMD ["sleep", "300"]



# # Use an official Python image as the base image
# FROM python:3.9-slim

# # Set the working directory in the container
# WORKDIR /app

# # Copy requirements.txt to the container
# COPY setup.py .

# # Copy .env file to the container
# COPY .env .

# # Install python-dotenv to load environment variables from .env
# RUN apt-get update && apt-get install -y python3-dotenv

# # Set JFrog as the package index and install dependencies
# RUN export $(cat .env | xargs) && \
#     pip config set global.index-url https://${JFROG_USERNAME}:${JFROG_PASSWORD}@${JFROG_URL} && \
#     pip install --extra-index-url https://pypi.org/simple --no-cache-dir .

    

# # Copy the application code to the container
# COPY app.py .

# # Define the command to run the application
# CMD ["python", "app.py"]





