Docker for Web Scraping

Builds a Docker image for web scraping processes

### Version Update

After updates, it is necessary to:
- Update the image version in the `pyproject.toml` file.

### Commands - taskipy

- `task image`: generates the image for the latest version (as described in `pyproject.toml`).
- `task container`: runs the container for the latest version (as described in `pyproject.toml`).
- `task push`: publishes latest image version (as described in `pyproject.toml`) to Docker Hub.

### Docker Usage - Reference

- The `docker images` command checks the images installed on the machine.
- The `docker container ls -a` command shows containers.
- The `docker rmi <image-id>` command removes an image by its ID.
- Example of using the container (docker run):

```
# The `--rm` tag removes the container after it closes.
# The `it` tag and the `bash` command enter the machine for testing.
# The `-v` tag shares a folder between the machines.

$ docker run -it --rm -v $PWD:/work_dir gabrielbdornas/docker-web-scraping:1.0.3 bash
```
