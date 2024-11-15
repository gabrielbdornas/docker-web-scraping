import os
from __init__ import (
    version,
    docker_user,
    image_name,
)

# Construct the Docker build command
command = f"""
docker run -it --rm \
    -v $(pwd):/work_dir \
    {docker_user}/{image_name}:{version} bash
"""

# Run the command
os.system(command)
