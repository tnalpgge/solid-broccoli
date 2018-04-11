# vim: ft=yaml
{% from 'navk8s/map.jinja' import navk8s %}

{% if grains.os_family == 'RedHat' %}
{{ navk8s.sysctl }}:
  file.managed:
    - user: root
    - group: root
    - source:
        - salt://navk8s/files/{{ grains.os_family }}/sysctl

"sysctl --system":
  cmd.run:
    - onchange:
        - file: {{ navk8s.sysctl }}
{% endif %}

