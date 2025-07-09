# Generic Functions Modules - Functional Documentation

This repository contains the functional documentation for the [Generic Functions Modules](https://github.com/minvws/gfmodules-coordination).
The documentation is built using Sphinx.

## Prerequisites

- Make
- Docker (with Sphinx and Python)

## Development

1. Download the latest version of the Rijkshuisstijl Sphinx theme.

    For this, you need to have the GitHub CLI installed and authenticated.
    See [GitHub CLI documentation](https://github.com/cli/cli) for installation instructions.

    ```bash
    gh release download --clobber -D docs/ --repo minvws/icore-manon-sphinx-theme --pattern 'sphinx-rijkshuisstijl*.zip'
    ```

2. Compile and generate the documentation locally

    It will start the local live server and watch for changes in the source files.

    ```bash
    make dev
    ```

    If you want to build the documentation without starting a live server, you can run:

    ```bash
    make all
    ```

## Additional Resources

- [Mermaid-CLI](https://github.com/mermaid-js/mermaid-cli)
- [Sphinx docs](https://www.sphinx-doc.org/en/master/usage/quickstart.html)
