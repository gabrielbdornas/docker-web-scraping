import os
from __init__ import (
    version,
    docker_user,
    image_name,
)

# Construct the Docker build command
command = f"""
docker build . --file Dockerfile --progress=plain --no-cache \
    --tag {docker_user}/{image_name}:{version} \
    --tag {docker_user}/{image_name}:latest
"""

# Run the command
os.system(command)
