import toml


# Load version from pyproject.toml
with open('pyproject.toml', 'r') as f:
    data = toml.load(f)
    version = data['project']['version']
    docker_user = data['project']['docker_user']
    image_name = data['project']['name']
