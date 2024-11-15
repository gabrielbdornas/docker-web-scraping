import os
from dotenv import load_dotenv
from __init__ import (
    docker_user,
    image_name,
)

load_dotenv()
DOCKER_USER = os.environ.get('DOCKER_USER')
DOCKER_TOKEN = os.environ.get('DOCKER_TOKEN')


# Construct the Docker build command
# -a flag push all images tags created in the moment of the push
command = f"""
docker login -u { DOCKER_USER } -p { DOCKER_TOKEN } \
    && docker push -a {docker_user}/{image_name}
"""

# Run the command
os.system(command)
