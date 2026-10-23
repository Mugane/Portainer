# Dockerized Portainer

This is a dockerized version of Portainer with custom templates that can be trivially run. There are existing open source projects that meet a similar need, but the available templates are limited or configurations are not extensive enough for my needs over the years. So this is my patch kit. Be sure to check out these [Tampermonkey](https://github.com/Mugane/Tampermonkey) scripts that include a [Portainer dropdown selector](https://github.com/Mugane/Tampermonkey/blob/main/screenshots/portainer-template-url-history.png) and local storage memory for template URLS so you can switch easily.

Portainer app templates include forms to facilitate managing deployment parameters (unlike Portainer custom app templates).

Reverse proxy versions of some public services are provided to facilitate domain mapping and SSL certificate management.

This is a fairly new repo and will be updated frequently. The goal is to establish a set of core templates for rapid containerized development or production deployments. 

#### Running Portianer

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

## Portainer Stack templates

This repo contains custom portainer templates, you can install them after running Portainer by switching the App Templates URL (under [Settings](http://localhost:9000/#!/settings)) to (https://mugane.github.io/Portainer/templates.json)

Commits to the `main` branch automatically trigger the collate.sh script to generate and publish the final `templates.json` file to [GitHub Pages](https://mugane.github.io/Portainer/templates.json). `templates.json` is not present in the `main` branch to avoid confusion when making source updates.

While templates are being developed and customized, you might find additional useful templates using this URL for the templates target: `https://raw.githubusercontent.com/Lissy93/portainer-templates/main/templates.json`

## Modifying the templates

See [Portainer Documentation](https://docs.portainer.io/advanced/app-templates/format) for format descriptions.

Edit the json and optional docker-compose.yml files under the `templates` folder. To test locally, run the `collate.sh` script to regenerate the template.json file with the full list of templates. On windows you can set up a watch by running the `monitor.ps1` script in PowerShell:
    - Open PowerShell as Administrator, navigate to the Portainer repo folder and run:
    ```
    docker run -d -v ${PWD}:/usr/share/nginx/html -p 8080:80 --name portemp nginx:latest
    Set-ExecutionPolicy RemoteSigned -Scope Process
    .\monitor.ps1
    ```
On linux, you can run 
    ```
    sudo docker run --name templates-json --rm -d -p 8080:80 -v "${PWD}/templates.json:/usr/share/nginx/html/templates.json:ro" nginx:alpine
    ```
Use [http://localhost:8080/templates.json](http://localhost:8080/templates.json) for the templates url in your local Portainer settings. If you can't open that in a browser, try [http://http://172.17.0.1:8080/templates.json](http://172.17.0.1:8080/templates.json) 

By convention the `./templates/name.json` file and the optional `./templates/name/docker-compose.yml` folder use the same `name` for clarity. It is dash-separated, lowercase and describes the primary nature of the template contents. 

In order to test local `./templates/name/docker-compose.yml` and `./templates/name/Dockerfile` files, you'll need to specify a Git repository url in the `./templates/name.json` file ("repository" section). It's a bit tedious - you need a local Git HTTP SERVER to do this. The [https://mugane.github.io/Portainer/templates.json](https://mugane.github.io/Portainer/templates.json) library contains a simple single-repo server exactly for this reason. The template name is `Git HTTP Server (Alpine)`. Point it at your Portainer folder and fire it up prior to starting debugging, and it will provide the endpoint for your local template tests. You should verify that the collate.sh script is updated to use whatever your local docker IP/Port is, if you do not use the defaults below:

<img width="1240" height="686" alt="image" src="https://github.com/user-attachments/assets/bec11f1c-dc7b-49c9-ae99-21fea03fd378" />

In order for changes to be picked up, you will need to commit them (the git server will pull from the advertised refs rather than the working tree). 
    - Use `git commit -am "some test stage message"` (or use `git add [files] && git commit -a "some message"` for specific commits)
    - Once you're satisfied with the tests, roll back the commits and consolidate the changes into one with 
    - `git reset --soft $(git merge-base HEAD origin/main)` (to prevent cutting changes from a [stale main](https://github.com/Team-Commonly/commonly/issues/516))
    - `git commit -m "complete change summary"`
    - `git pull`
    - `git push` 

You will also need to restart the templates-json docker container after each run of .collate.sh so use `./collate.sh --local && sudo docker restart templates-json`

## Wish list

The following containers would be nice to have.

<!--

Lower priority: From Lissy: Caddy, CrateDB, Drupal, Elasticsearch, Ghost, Httpd, Jenkins, Ironfunctions, Joomla, Magento, Minio, Mongo, Plone, PostgreSQL, Redis, Registry, Scality S3, Solr, Urbackup, Blender, Boinc, Gitqlient, Ubuntu, OPC router, softing edgeConnector containers Apache Httpd, influxdb, freescout, wger, [dockge](https://www.youtube.com/watch?v=HEklvsr7q54), [Activepieces](https://www.youtube.com/watch?v=MRm75uTf_A4), [Plane PM](https://www.youtube.com/watch?v=HqKvfDZICBA), [Flowise AI](https://www.youtube.com/watch?v=03RBE72lNf8), [Ory Kratos](https://www.youtube.com/watch?v=T-UPdN1hxKA), umami.is, mamoto,

Other: Geany, Home Assistant, Jellyfin, , WireGuard, Domoticz, openHAB
-->

SEO:
- [https://github.com/every-app/open-seo] Open SEO

Productivity:
- [https://github.com/storytold] Adobe clones (remove top bar and make PWA)

DevOps:
- [https://github.com/cypress-io/cypress](Cypress)
- [https://forgejo.org/releases/](Forgejo) Exclusively free fork of for-profit Gitea
- Dokku
- OPC Router
- Grafana + Prometheus + Loki + Tempo
- Terraform/Ansible
- [https://github.com/ChrispyBacon-dev/DockFlare](Dockflare) Automate Cloudflare Tunnels with Docker Labels
- [https://github.com/terramate-io/terramate](Terramate) Use terraform hcl with other IaC platforms - see https://spacelift.io/blog/terraform-alternatives and https://www.qovery.com/blog/infrastructure-automation-tools-comparison
Pulumi

AI: 
- [https://github.com/LangConfig/langconfig](LangConfig) LangChain/LangGraph orchestrator/workflow builder [https://docs.litellm.ai/docs/proxy/docker_quick_start](docs)
- [https://github.com/BerriAI/litellm](LiteLLM) LLM proxy API router (see https://portainer-templates.as93.net/litellm)
- [https://github.com/diegosouzapw/OmniRoute](OmniRoute) AI Gateway
- [https://github.com/Panniantong/Agent-Reach](Agent Reach)
- [https://github.com/n8n-io/n8n/tree/master](n8n) Visual building/custom code (LangChain), integrations
- [https://github.com/open-free-llm-api/awesome-freellm-apis](Free LLM APIs)
- [https://github.com/Kaliiiiiiiiii-Vinyzu/patchright](Patchright) from [https://playwright.dev/](Playwright)
- [https://github.com/unslothai/unsloth] Unsloth (model fine tuning/training)
- [https://github.com/p-e-w/heretic] Heretic (abliteration) - see https://github.com/dreamfast/heretic-docker/ as an example
- [https://github.com/anomalyco/opencode](Open Code) The open source AI coding agent
- [https://github.com/open-webui/open-webui](Open-Webui)
- [https://github.com/stackblitz-labs/bolt.diy](Bolt.diy) Prompt, run, edit, and deploy full-stack web apps [https://stackblitz-labs.github.io/bolt.diy/](docs)
- [https://github.com/ollama/ollama](Ollama)
- Hugging face setup (run hugging face models like https://huggingface.co/fastino/GLiNER2.5-Decide)
- [https://github.com/tashfeenahmed/freellmapi](Free LLM API) 7.4 billion tokens per month. 34 free LLM providers. 635 free model endpoints. All behind one /v1 endpoint, plus any custom OpenAI-compatible endpoint. Smart routing, automatic failover, encrypted keys. Personal experimentation only.
- [https://github.com/alishahryar1/free-claude-code](Free Claude Code) Use Claude Code, Codex, VSCode, Pi, and OpenCode (and 6 other harnesses) for free (1.3B+ free tokens) from your terminal, app, IDE, or phone, and now from the browser with native browser sessions (multi-harness + multi-model) like OpenClaw (voice supported + ToS friendly)
<!--
    - [https://web.facebook.com/reel/1578382909964624](web design) Add setup for building websites (make open source version)
>
<!--
Models/implementatnois:
- Laya *open jev https://www.youtube.com/shorts/nVNQUzpw3Nw
- Whisper (audio/translate) https://www.youtube.com/watch?v=bavO_V80ohM
- https://ollama.com/library/qwen3.8:27b

OSINT:
- []()
- []()

-->