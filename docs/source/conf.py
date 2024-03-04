import os
import sys
from pathlib import Path

CURRENT_DIR = Path(__file__).resolve().parent


# sys.path.insert(0, os.path.abspath("../"))
sys.path.insert(0, CURRENT_DIR.parent.as_posix())


project = "HLSDataset"
copyright = "2024, TBD..."
author = "TBD..."


extensions = [
    "sphinx.ext.autodoc",
    "sphinx.ext.autosummary",
    "sphinx.ext.viewcode",
    "sphinx.ext.githubpages",
]

templates_path = ["_templates"]
exclude_patterns = []


html_theme = "furo"
html_static_path = ["_static"]

html_css_files = [
    "custom.css",
]
