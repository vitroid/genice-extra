#!/usr/bin/env python
from jinja2 import Template, BaseLoader, Environment, FileSystemLoader
import toml
import genice2_extra

import sys

project = toml.load("pyproject.toml")

project |= {
    # "usage": genice2_yaplot.formats.yaplot.desc["usage"],
    "version": genice2_extra.__version__,
}

t = Environment(loader=FileSystemLoader(searchpath=".")).get_template(sys.argv[1])
markdown_en = t.render(**project)
print(markdown_en)
