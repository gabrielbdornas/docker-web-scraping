FROM python:3.12.2-slim-bullseye
RUN echo "Setup.  This may take a few minutes ..."
WORKDIR /work_dir
COPY requirements.txt /
RUN apt-get -y update
RUN apt-get install -y wget nano
ARG CHROME_DRIVE_VERSION="114.0.5735.90"
ARG CHROME_VERSION=${CHROME_DRIVE_VERSION}-1
RUN wget --no-verbose -O /usr/local/bin/chromedriver https://chromedriver.storage.googleapis.com/${CHROME_DRIVE_VERSION}/chromedriver_linux64.zip
RUN wget --no-verbose -O /tmp/chrome.deb https://dl.google.com/linux/chrome/deb/pool/main/g/google-chrome-stable/google-chrome-stable_${CHROME_VERSION}_amd64.deb \
  && apt install -y /tmp/chrome.deb \
  && rm /tmp/chrome.deb
RUN apt-get -y install git
RUN echo "Installing python..."
RUN apt-get install -y python3 python3-venv python3-dev libpq-dev
RUN echo "Installing python packages..."
RUN pip install -r /requirements.txt
RUN google-chrome --version
RUN echo "The setup has been made."
