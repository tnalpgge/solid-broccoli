# vim: ft=yaml
{% from 'navk8s/map.jinja' import navk8s %}

{% for role, packages in navk8s.get('packages', {}).iteritems() %}
{%   if role in grains.get('roles', []) %}
navk8s_{{ role }}_packages_installed:
  pkg.installed:
    - pkgs: {{ packages }}
{%   endif %}
{% endfor %}

{% for role, services in navk8s.get('services', {}).iteritems() %}
{%   if role in grains.get('roles', []) %}
{%     for nickname, realname in services.iteritems() %}
{{ nickname }}:
  service.running:
    - enable: True
    - name: {{ realname }}
    - require:
        - pkg: navk8s_{{ role }}_packages_installed
{%     endfor %}
{%   endif %}
{% endfor %}
