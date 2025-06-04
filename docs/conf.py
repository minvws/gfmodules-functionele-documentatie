# Configuration file for the Sphinx documentation builder.
#
# For the full list of built-in configuration values, see the documentation:
# https://www.sphinx-doc.org/en/master/usage/configuration.html

# -- Project information -----------------------------------------------------
# https://www.sphinx-doc.org/en/master/usage/configuration.html#project-information

project = "Generieke Functies"
copyright = "2025 Generieke Functies"
author = "irealisatie"
release = "1"

# -- General configuration ---------------------------------------------------
# https://www.sphinx-doc.org/en/master/usage/configuration.html#general-configuration

extensions = ["myst_parser", "sphinxcontrib.mermaid"]

templates_path = ["_templates"]
exclude_patterns = ['_build']

language = "nl"

# -- Options for HTML output -------------------------------------------------
# https://www.sphinx-doc.org/en/master/usage/configuration.html#options-for-html-output

html_static_path = ["_static"]
html_show_sphinx = False
html_show_sourcelink = False

# Add mermaidjs and dependencies to the _static directory to avoid security policy issues in the browser
# https://manpages.debian.org/unstable/python3-sphinxcontrib-mermaid/sphinxcontrib-mermaid.3.en.html

mermaid_use_local = "/_static/js/mermaid.min.js"
mermaid_elk_use_local = "/_static/js/mermaid-layout-elk.esm.min.mjs"
d3_use_local = "/_static/js/d3.min.js"

# -- Theme: Rijksoverheid UI and Options for HTML output -----------

html_theme = 'sphinx-rijkshuisstijl-2008'
html_theme_path = ["."]
locale_dirs = ['locales/']

html_theme_options = {
    "description": "Generieke Functies",
    "github_user": "minvws",
    "github_repo": "gfmodules-functional-documentation",
    "tidelift_url": "https://github.com/minvws/gfmodules-functional-documentation",
    "show_copyright_privacy_block_footer": "true",
    "copyright_url": "/copyright.html",
    "privacy_url": "https://irealisatie.nl/privacy",
}