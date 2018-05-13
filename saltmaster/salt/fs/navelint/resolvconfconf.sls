# vim: ft=yaml
{% from 'navelint/map.jinja' import navelint %}
/etc/resolvconf.conf:
  file.managed:
    - user: root
    - group: wheel
    - mode: 644
    - contents:
{% for i in ( 'search_domains', 'name_servers', 'name_servers_append' ) %}
  {% if i in navelint.resolvconf %}
        - {{ i }}="{{ navelint.resolvconf[i] | join(' ') }}"
  {% endif %}
{% endfor %}

/etc/resolv.conf:
  cmd.run:
    - name: /sbin/resolvconf -u
    - watch:
        - file: /etc/resolvconf.conf
