# Configuration file for the Sphinx documentation builder.
#
# For the full list of built-in configuration values, see the documentation:
# https://www.sphinx-doc.org/en/master/usage/configuration.html

# -- Project information -----------------------------------------------------
# https://www.sphinx-doc.org/en/master/usage/configuration.html#project-information

project = "Generieke Functies"
copyright = "2024, gfmodules"
author = "irealisatie"
release = "1"

# -- General configuration ---------------------------------------------------
# https://www.sphinx-doc.org/en/master/usage/configuration.html#general-configuration

extensions = ["myst_parser", "sphinxcontrib.mermaid"]

templates_path = ["_templates"]
exclude_patterns = []

language = "nl"

# -- Options for HTML output -------------------------------------------------
# https://www.sphinx-doc.org/en/master/usage/configuration.html#options-for-html-output

# html_theme = "alabaster"
html_static_path = ["_static"]
html_show_sphinx = False
html_show_sourcelink = False

# -- Theme: Rijksoverheid UI and Options for HTML output -----------
#
# Download the theme and copy it to the source directory of the sphinx project:
# https://github.com/minvws/icore-manon-sphinx-theme/actions/runs/13544738793/artifacts/2655913970

html_theme = 'rijksoverheid_ui_theme_v0.1.0-beta.4'
html_theme_path = ["."]
locale_dirs = ['locales/']

html_theme_options = {
    "description": "Generieke Functies",
    "github_user": "minvws",
    "github_repo": "gfmodules-functional-documentation",
    "tidelift_url": "https://github.com/minvws/gfmodules-functional-documentation",
}