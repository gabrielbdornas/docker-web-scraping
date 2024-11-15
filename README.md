Docker for Web Scraping
===

Constroi Docker image para processos de web Scraping

### Atualização de versão.

Após atualizações é necessário:
- Atualizar a versão da imagem no arquivo `pyproject.toml`.

### Comandos - taskipy

- `task image`: gera a imagem da versão mais atual (descrita no `pyproject.toml`).
- `task container`: roda container da versão mais atual (descrita no `pyproject.toml`).
- `task push`: publica imagem dockerhub.

### Utilização docker - referência

- Comando `docker images` verifica images instaladas na máquina.
- comando `docker container ls -a` mostra containers.
- Comando `docker rmi <image-id>` remove uma imagem a partir no seu id.
- Exemplo de utilização do container (docker run):

```
# Tag `--rm` remove o container após seu fechamento.
# Tag `it` e comando `bash` entra na máquina para testes.
# Tag `-v` compartilha pasta entre as máquinas.

$ docker run -it --rm -v $(pwd):/work_dir gabrielbdornas/docker-web-scraping:1.0.3 bash
```
