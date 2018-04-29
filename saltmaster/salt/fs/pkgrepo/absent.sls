{% for repo_name, repo_info in salt['pillar.get']('absent:pkgrepo', {}).iteritems() %}
{{ repo_name }}:
  pkgrepo.absent:
{%   for k, v in repo_info.iteritems() %}
    - {{ k }}: {{ v }}
{%   endfor %}
{% endfor %}
