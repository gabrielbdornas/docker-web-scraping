Docker for Web Scraping
===

Constroi Docker image para processos de web Scraping

### Atualização de versão.

Após atualizações é necessário:
- Atualizar a versão da imagem que será publicada no arquivo `pyproject.toml`, nas tasks `image` e `container`.
- Atualizar a versão da imagem que será publicada no DockerHub no aquivo `.github/workflows/main.yaml` (final da última linha).

Task `image` é tanto pelo processo GitHub actions quanto para debug local.
Task `container` pode ser utilizada para debug local.

### Utilização docker

- Comando `docker images` verifica images instaladas na máquina.
- comando `docker container ls -a` mostra containers.
- Comando `docker rmi <image-id>` remove uma imagem a partir no seu id.
- Exemplo de utilização local do comando docker run: `docker run -it --rm -v $PWD:/work_dir gabrielbdornas/docker-web-scraping:1.0.2 bash`:
    - Tag `--rm` remove o container após seu fechamento.
    - Tag `it` e comando `bash` entra na máquina para testes.
    - Tag `-v` compartilha pasta entre as máquinas.
