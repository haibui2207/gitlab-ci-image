# gitlab-ci-image
A custom [gitlab ci image](https://docs.gitlab.com/ee/ci/yaml/#image).\
This image already set up packages:
  + [Ubuntu 18.04](https://ubuntu.com/blog/tag/ubuntu-18-04)
  + [docker](https://www.docker.com)
  + [docker-compose](https://docs.docker.com/compose) (1.2x.x)
  + [Nodejs](https://nodejs.org/) (12.x)
  + [Npm](https://www.npmjs.com/) (latest)

# Build image

```bash
  docker build -t <image-name> .
```

# Deploy to [Docker hub](https://hub.docker.com/)
Run command line as administrator

```bash
  docker login --username=<username>
  docker tag <image-name> <docker-hub-repo>:latest
  docker push <docker-hub-repo>:latest
```

# Usage

```yml
  # gitlab-ci.yml
  
  image: <docker-hub-repo>:latest
  services:
    - docker:<version>-dind
  stages:
    - build
    - test
    - deploy
  
  build:
    stage: build
    script:
      # npm avaliable
      - npm install
      - npm run build
    ...
  test:
    stage: test
    script:
      # npm avaliable
      - npm install
      - npm run test
    ...
  deploy:
    stage: deploy
    ...
```
