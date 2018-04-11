include:
  - navk8s.pkg
  - systemd.reload

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
{%     for target in infos.get('watch_in', []) %}
{%       for category, identifiers in target.iteritems() %}
{%         for identifier in identifiers %}
        - {{ category }}: {{ identifier }}
{%         endfor %}
{%       endfor %}
{%     endfor %}
{%     for service in infos.get('services', []) %}
        - service: {{ navk8s.services.kubemaster[service] }}
{%     endfor %}
{%   endif %}
{% endfor %}

{% for swapfile in salt['mount.swaps']() %}
swapoff_{{ swapfile }}:
  module.run:
    - name: mount.swapoff
    - m_name: {{ swapfile }}
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
