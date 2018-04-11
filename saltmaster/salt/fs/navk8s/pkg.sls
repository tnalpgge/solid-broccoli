# vim: ft=yaml
{% from 'navk8s/map.jinja' import navk8s %}

{% for role, packages in navk8s.get('packages', {}).iteritems() %}
{%   if role in grains.get('roles', []) %}
navk8s_{{ role }}_packages_installed:
  pkg.installed:
    - pkgs: {{ packages }}
{%   endif %}
{% endfor %}
