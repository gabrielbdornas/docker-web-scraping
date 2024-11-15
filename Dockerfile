FROM python:3.12.2-slim-bullseye

WORKDIR /work_dir

RUN apt-get -y update
RUN apt-get install -y \
  nano \
  wget \
  unzip \
  libglib2.0-0 \
  libnss3 \
  libx11-6 \
  libx11-xcb1 \
  libxcomposite1 \
  libxdamage1 \
  libxi6 \
  libxrandr2 \
  libxtst6 \
  libgtk-3-0 \
  libasound2 \
  libatk1.0-0 \
  libcups2 \
  libxss1 \
  libgbm1 \
  libpango-1.0-0 \
  libpangocairo-1.0-0 \
  git \
  python3 \
  python3-venv \
  python3-dev \
  libpq-dev \
  && apt-get clean && rm -rf /var/lib/apt/lists/*

# Defining Chrome version
ARG CHROME_VERSION="131.0.6778.69"
ARG CHROME_LINK=https://storage.googleapis.com/chrome-for-testing-public/${CHROME_VERSION}/linux64

# Download Chrome driver
RUN wget --no-verbose -O /tmp/chromedriver-linux64.zip ${CHROME_LINK}/chromedriver-linux64.zip \
    && unzip /tmp/chromedriver-linux64.zip -d /tmp \
    && mv /tmp/chromedriver-linux64/chromedriver /usr/local/bin/chromedriver \
    && chmod +x /usr/local/bin/chromedriver \
    && rm -rf /tmp/chromedriver-linux64.zip /tmp/chromedriver-linux64
# Install Chrome
RUN wget --no-verbose -O /tmp/chrome-linux64.zip ${CHROME_LINK}/chrome-linux64.zip \
  && unzip /tmp/chrome-linux64.zip -d /tmp/chrome-linux64 \
  && mkdir -p /opt/google \
  && mv /tmp/chrome-linux64/chrome-linux64 /opt/google/chrome \
  && ln -sf /opt/google/chrome/chrome /usr/bin/google-chrome \
  && rm -rf /tmp/chrome-linux64.zip /tmp/chrome-linux64

RUN google-chrome --version
RUN chromedriver --version

