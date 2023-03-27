FROM python:3.12.0a6-bullseye
RUN echo "Setup.  This may take a few minutes ..."
WORKDIR /work_dir
COPY requirements.txt /
COPY chromedriver /usr/local/bin
RUN apt-get -y update
RUN apt-get install -y wget nano
RUN wget http://dl.google.com/linux/chrome/deb/pool/main/g/google-chrome-stable/google-chrome-stable_88.0.4324.96-1_amd64.deb
RUN apt-get install -y ./google-chrome-stable_88.0.4324.96-1_amd64.deb
RUN google-chrome --version
RUN apt-get -y install git
RUN echo "Installing python..."
RUN apt-get install -y python3 python3-venv python3-dev libpq-dev
RUN echo "Installing python packages..."
RUN pip install -r /requirements.txt
RUN echo "The setup has been made."


