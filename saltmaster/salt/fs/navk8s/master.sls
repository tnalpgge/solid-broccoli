include:
  - navk8s.pkgrepo
  - navk8s.pkg
  - navk8s.sysctl
  - navk8s.services

{#
{% from 'navk8s/map.jinja' import navk8s %}

{% for destination, infos in navk8s.files.get('kubemaster', {}).iteritems() %}
{{ destination }}:
  file.managed:
    - source: {{ infos.source | yaml }}
{%   if 'template' in infos %}
    - template: {{ infos.template }}
{%   endif %}
    - require:
        - pkg: navk8s_kubemaster_packages_installed
{%   if 'services' in infos %}
    - watch_in:
{%     for service in infos.get('services', []) %}
        - service: {{ navk8s.services.kubemaster[service] }}
{%     endfor %}
{%   endif %}
{% endfor %}
#}
