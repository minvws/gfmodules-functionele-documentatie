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
html_css_files = ["custom.css"]

html_show_sphinx = False
html_show_sourcelink = False

# -- Theme: Rijksoverheid UI and Options for HTML output -----------

html_theme = 'sphinx-rijkshuisstijl-2008'
html_theme_path = ["."]
locale_dirs = ['locales/']

html_theme_options = {
    "description": "Generieke Functies",
    "github_user": "minvws",
    "github_repo": "gfmodules-functionele-documentatie",
    "tidelift_url": "https://github.com/minvws/gfmodules-functionele-documentatie",
    "show_copyright_privacy_block_footer": "true",
    "copyright_url": "/copyright.html",
    "privacy_url": "/privacy.html",
}