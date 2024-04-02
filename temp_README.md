![Logo]({{tool.genice.urls.logo}})

# [{{project.name}}]({{project.urls.Homepage}})

Installs all official extra-plugins for [GenIce2]({{tool.genice.urls.repository}}).

version {{version}}

## Requirements

{% for item in tool.poetry.dependencies %}* {{item}}{{tool.poetry.dependencies[item]}}
{% endfor %}

## Install from PyPI

    % pip install {{project.name}}

