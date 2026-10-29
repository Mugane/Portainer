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

Commits to the `main` branch automatically trigger the collate.sh script to generate and publish the final `templates.json` file to [GitHub Pages](https://mugane.github.io/Portainer/templates.json). `templates.json` is not present in the `main` branch to avoid confusion when making source updates.

<!--
While templates are being developed and customized, you might find additional useful templates using this URL for the templates target: `https://raw.githubusercontent.com/Lissy93/portainer-templates/main/templates.json`
-->


## Wish list

### Features:

- Need to update the collation script to modify a README.md for the templates that compiles descriptions and links to each README.md and other resources (images, home pages, etc). But, this needs to be in Git. So not part of Github actions, but part of the collate.sh script.

### Services to add:

The following containers would be nice to have.

<!--

Lower priority: From Lissy: Caddy, CrateDB, Drupal, Elasticsearch, Ghost, Httpd, Jenkins, Ironfunctions, Joomla, Magento, Minio, Mongo, Plone, PostgreSQL, Redis, Registry, Scality S3, Solr, Urbackup, Blender, Boinc, Gitqlient, Ubuntu, OPC router, softing edgeConnector containers Apache Httpd, influxdb, freescout, wger, [dockge](https://www.youtube.com/watch?v=HEklvsr7q54), [Activepieces](https://www.youtube.com/watch?v=MRm75uTf_A4), [Plane PM](https://www.youtube.com/watch?v=HqKvfDZICBA), [Flowise AI](https://www.youtube.com/watch?v=03RBE72lNf8), [Ory Kratos](https://www.youtube.com/watch?v=T-UPdN1hxKA), umami.is, mamoto,

Other: Geany, Home Assistant, Jellyfin, , WireGuard, Domoticz, openHAB
-->

SEO:
- [Open SEO](https://github.com/every-app/open-seo)

Productivity:
- [Adobe clones](https://github.com/storytold) (remove top bar and make PWA)

DevOps:
- [Cypress](https://github.com/cypress-io/cypress)
- [Forgejo](https://forgejo.org/releases/) Exclusively free fork of for-profit Gitea
- Dokku
- OPC Router
- Grafana + Prometheus + Loki + Tempo
- Terraform/Ansible
- [Dockflare](https://github.com/ChrispyBacon-dev/DockFlare) Automate Cloudflare Tunnels with Docker Labels
- [Terramate](https://github.com/terramate-io/terramate) Use terraform hcl with other IaC platforms - see https://spacelift.io/blog/terraform-alternatives and https://www.qovery.com/blog/infrastructure-automation-tools-comparison
- Pulumi

AI: 
- [LangConfig](https://github.com/LangConfig/langconfig) - LangChain/LangGraph orchestrator/workflow builder [docs](https://docs.litellm.ai/docs/proxy/docker_quick_start)
- [LiteLLM](https://github.com/BerriAI/litellm) - LLM proxy API router (see https://portainer-templates.as93.net/litellm)
- [OmniRoute](https://github.com/diegosouzapw/OmniRoute) - AI Gateway
- [Agent Reach](https://github.com/Panniantong/Agent-Reach)
- [n8n](https://github.com/n8n-io/n8n/tree/master) - Visual building/custom code (LangChain), integrations
- [Free LLM APIs](https://github.com/open-free-llm-api/awesome-freellm-apis)
- [Patchright](https://github.com/Kaliiiiiiiiii-Vinyzu/patchright) - from [https://playwright.dev/](Playwright)
- [Unsloth](https://github.com/unslothai/unsloth) - Model fine tuning/training
- [Heretic](https://github.com/p-e-w/heretic) (abliteration) - see https://github.com/dreamfast/heretic-docker/ as an example
- [Open Code](https://github.com/anomalyco/opencode) - The open source AI coding agent
- [Open-Webui](https://github.com/open-webui/open-webui)
- [Bolt.diy](https://github.com/stackblitz-labs/bolt.diy) Prompt, run, edit, and deploy full-stack web apps ([docs](https://stackblitz-labs.github.io/bolt.diy/))
- [Ollama](https://github.com/ollama/ollama)
- Hugging face setup (run hugging face models like https://huggingface.co/fastino/GLiNER2.5-Decide)
- [Free LLM API](https://github.com/tashfeenahmed/freellmapi) 7.4 billion tokens per month. 34 free LLM providers. 635 free model endpoints. All behind one /v1 endpoint, plus any custom OpenAI-compatible endpoint. Smart routing, automatic failover, encrypted keys. Personal experimentation only.
- [Free Claude Code](https://github.com/alishahryar1/free-claude-code) Use Claude Code, Codex, VSCode, Pi, and OpenCode (and 6 other harnesses) for free (1.3B+ free tokens) from your terminal, app, IDE, or phone, and now from the browser with native browser sessions (multi-harness + multi-model) like OpenClaw (voice supported + ToS friendly)
<!--
    - [web design](https://web.facebook.com/reel/1578382909964624) Add setup for building websites (make open source version)
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

## Contributing (Modifying the templates)

See [Portainer Documentation](https://docs.portainer.io/advanced/app-templates/format) for format descriptions.

Edit the json and optional docker-compose.yml files under the `templates` folder. To test locally, run the `collate.sh` script to regenerate the template.json file with the full list of templates, run the git http server, and commit your changes locally before testing (See steps 1 and 2 below). 
    
Use [http://localhost:8080/templates.json](http://localhost:8080/templates.json) for the templates url in your local Portainer settings. If you can't open that in a browser, try [http://http://172.17.0.1:8080/templates.json](http://172.17.0.1:8080/templates.json) 

By convention the `./templates/name.json` file and the optional `./templates/name/docker-compose.yml` folder use the same `name` for clarity. It is dash-separated, lowercase and describes the primary nature of the template contents. 

### STEP 1/2: templates.json
- **Automatic (Windows)**: you can set up a watch by running the `monitor.ps1` script in PowerShell. Open PowerShell as Administrator, navigate to the Portainer repo folder and run:
  ```
  docker run -d -v ${PWD}:/usr/share/nginx/html -p 8080:80 --name templates-json nginx:latest
  Set-ExecutionPolicy RemoteSigned -Scope Process
  .\monitor.ps1 templates-json
  ```
- **Automatic (Linux)**: you can set up monitoring (and the docker container templates-json that serves the collated local file), by running:
  ```
  sudo ./monitor.sh # if your docker install requires sudo, or:
  . monitor.sh # if your docker install does not require sudo
  ```
- **Manual**:
  - To serve the template.json file locally, run:
    ```
    sudo docker run --name templates-json --rm -d -p 8080:80 \
        -v "${PWD}/templates.json:/usr/share/nginx/html/templates.json:ro" nginx:alpine
    ```
  - You will also need to restart the templates-json docker container after each run of .collate.sh - so to do the collation, run:
    ```
    ./collate.sh --local && sudo docker restart templates-json
    ```
    
### Step 2/2: Git server

In order to test local `./templates/name/docker-compose.yml` and `./templates/name/Dockerfile` files, you'll need to specify a Git repository url in the `./templates/name.json` file ("repository" section). You need a local Git HTTP SERVER to do this. This [templates.json](https://mugane.github.io/Portainer/templates.json) library contains a simple single-repo server exactly for this reason. The template name is `Git HTTP Server (Alpine)`. Point it at your Portainer folder and fire it up prior to starting debugging, and it will provide the endpoint for your local template tests. You should verify that the collate.sh script is updated to use whatever your local docker IP/Port is, if you do not use the defaults below:

<img width="1240" height="686" alt="image" src="https://github.com/user-attachments/assets/bec11f1c-dc7b-49c9-ae99-21fea03fd378" />

In order for changes to be picked up, you will need to commit them (the git server will pull from the advertised refs rather than the working tree). 

- To commit the changes locally:
  ```
  git add -A && git commit -m "some message" # all changes, including new files, or:
  git add [files] && git commit -m "some message" # for specific new files && changes, or:
  git commit -m "some message" [files] # for changes to specific files only (no new files), or:
  git commit -am "some message" # for all changes only (no new files)
  ```
- Once you're satisfied with the tests, roll back the commits and consolidate the changes into one with this sequence. `merge-base` prevents cutting changes from a [stale main branch](https://github.com/Team-Commonly/commonly/issues/516)
    
  ```
  git reset --soft $(git merge-base HEAD origin/main)
  git commit -m "complete change summary"
  git pull --ff-only # Check whether origin/main has changed
  ```

  If this succeeds, there is no divergence and the local branch can be pushed directly:
  ```
  git push
  ```

  If it fails with:
  ```
  fatal: Not possible to fast-forward, aborting.
  ```
  the local branch and `origin/main` have diverged. Rebase the consolidated local commit onto the remote changes:
  ```
  git rebase origin/main
  git push
  ```
