# Template Ecological Workflow

[![CI](https://github.com/<ORG>/<REPO>/actions/workflows/ci.yaml/badge.svg)](https://github.com/<ORG>/<REPO>/actions)

A minimal, fully reproducible analysis stack:

* **renv** – library isolation (`renv.lock` committed)  
* **_targets** – declarative pipeline  
* **Quarto** – report rendered _from_ the pipeline  
* **GitHub Actions** – clone → restore → build → render on every push  

## Quick‑start

```bash
git clone https://github.com/<ORG>/<REPO>.git
cd <REPO>
R -e 'install.packages("renv"); renv::restore()'   # install locked packages
R -e 'targets::tar_make()'                         # run the pipeline
quarto render report.qmd                           # render the HTML report
