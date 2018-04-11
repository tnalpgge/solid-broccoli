# vim: ft=yaml
{% from 'navk8s/map.jinja' import navk8s %}

{% for reponame, repoinfo in navk8s.pkgrepos.iteritems() %}
{{ reponame }}:
  pkgrepo.managed:
    - baseurl: {{ repoinfo.baseurl }}
    - enabled: {{ repoinfo.enabled }}
    - humanname: {{ repoinfo.humanname }}
    - gpgcheck: {{ repoinfo.gpgcheck }}
    - repo_gpgcheck: {{ repoinfo.repo_gpgcheck }}
    - gpgkey: {{ repoinfo.gpgkey | join(' ') }}
{% endfor %}
