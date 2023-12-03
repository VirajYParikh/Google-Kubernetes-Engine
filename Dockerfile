# Start with a Linux micro-container to keep the image tiny
FROM python:3.7.4

# Document who is responsible for this image
MAINTAINER Viraj Parikh "vp2359@nyu.edu"

# Install just the Python runtime (no dev)
#RUN apk add --no-cache \
   # py3-pip \
   # ca-certificates

# Expose any ports the app is expecting in the environment
ENV PORT 8001
EXPOSE $PORT

# Set up a working folder and install the pre-reqs
WORKDIR /app
ADD mnist/requirements.txt /app
RUN pip install --upgrade pip
RUN pip install -r requirements.txt

# Add the code as the last Docker layer because it changes the most
ADD mnist/main.py  /app/main.py

# Run the service:qa:
CMD [ "python", "main.py" ]