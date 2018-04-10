include:
  - navk8s

{% from 'navk8s/map.jinja' import navk8s %}

{% for destination, infos in navk8s.files.get('kubenode', {}).iteritems() %}
{{ destination }}:
  file.managed:
    - source: {{ infos.source | yaml }}
{%   if 'template' in infos %}
    - template: {{ infos.template }}
{%   endif %}
    - require:
        - pkg: navk8s_kubenode_packages_installed
{%   if 'services' in infos %}
    - watch_in:
{%     for service in infos.get('services', []) %}
        - service: {{ navk8s.services.kubenode[service] }}
{%     endfor %}
{%   endif %}
{% endfor %}
