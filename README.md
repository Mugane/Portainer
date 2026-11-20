# Dockerized Portainer

This is a dockerized version of Portainer with custom templates that can be trivially run. There are existing open source projects that meet a similar need, but the available templates are limited or configurations are not extensive enough for my needs over the years. So this is my patch kit. Be sure to check out these [Tampermonkey](https://github.com/Mugane/Tampermonkey) scripts that include a [Portainer dropdown selector](https://github.com/Mugane/Tampermonkey/blob/main/screenshots/portainer-template-url-history.png) and local storage memory for template URLS so you can switch easily.

Portainer app templates include forms to facilitate managing deployment parameters (unlike Portainer custom app templates).

Reverse proxy versions of some public services are provided to facilitate domain mapping and SSL certificate management.

This is a fairly new repo and will be updated frequently. The goal is to establish a set of core templates for rapid containerized development or production deployments. 

## Running Portianer

Prerequisites: You will need docker installed and either curl/wget or git.

1. Run directly

    To run portianer directly without cloning this repository, navigate to the folder where you want to base your container mounts and run:
    ```
    # Download the Docker Compose file from the specified URL
    curl -o docker-compose.yml https://raw.githubusercontent.com/Mugane/Portainer/main/docker-compose.yml
    
    # Run Docker Compose using the downloaded file
    docker compose up -d
    ```

2. Clone & Run
    ```
    # Clone the repository
    git clone https://github.com/Mugane/Portainer.git
    
    # Change directory to the cloned repository
    cd Portainer
    
    # Run Docker Compose
    docker compose up -d
    ```

## The templates

This repo contains custom portainer templates, you can install them after running Portainer by switching the App Templates URL (under [Settings](http://localhost:9000/#!/settings)) to (https://mugane.github.io/Portainer/templates.json)

<!--
While templates are being developed and customized, you might find additional useful templates using this URL for the templates target: `https://raw.githubusercontent.com/Lissy93/portainer-templates/main/templates.json`
-->

## Contributing (Modifying the templates)

See [DEVELOPMENT.md](DEVELOPMENT.md) for local testing setup tips and conventions.

See [CONTRIBUTING.md](CONTRIBUTING.md) for instructions on how to submit contributions (and thank you!).