# Generic Functions - Functional Documentation

This repository contains the functional documentation for the [Generic Functions Modules](https://github.com/minvws/gfmodules-coordination).
The documentation is built using Sphinx.

## Disclaimer

This project and all associated code serve solely as documentation
and demonstration purposes to illustrate potential system
communication patterns and architectures.

This codebase:

- Is NOT intended for production use
- Does NOT represent a final specification
- Should NOT be considered feature-complete or secure
- May contain errors, omissions, or oversimplified implementations
- Has NOT been tested or hardened for real-world scenarios

The code examples are only meant to help understand concepts and demonstrate possibilities.

By using or referencing this code, you acknowledge that you do so at your own
risk and that the authors assume no liability for any consequences of its use.

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

## Contribution

As stated in the [Disclaimer](#disclaimer) this project and all associated code serve solely as documentation and
demonstration purposes to illustrate potential system communication patterns and architectures.

For that reason we will only accept contributions that fit this goal. We do appreciate any effort from the
community, but because our time is limited it is possible that your PR or issue is closed without a full justification.

If you plan to make non-trivial changes, we recommend to open an issue beforehand where we can discuss your planned changes.
This increases the chance that we might be able to use your contribution (or it avoids doing work if there are reasons
why we wouldn't be able to use it).

Note that all commits should be signed using a gpg key.
