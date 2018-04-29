{% for repo_name, repo_info in salt['pillar.get']('pkgrepo', {}).iteritems() %}
{{ repo_name }}:
  pkgrepo.managed:
{%   for k, v in repo_info.iteritems() %}
    - {{ k }}: {{ v }}
{%   endfor %}
{% endfor %}
