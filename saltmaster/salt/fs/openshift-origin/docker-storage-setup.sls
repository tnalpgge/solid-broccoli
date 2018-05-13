{% set blockdev = '/dev/sdb' %}
{% set vg = 'docker-vg' %}
{% set lvpool = 'docker-pool' %}

/etc/sysconfig/docker-storage-setup:
  file.managed:
    - user: root
    - group: root
    - mode: 644
    - contents:
        - DEVS={{ blockdev }}
        - VG={{ vg }}

/usr/bin/docker-storage-setup:
  cmd.run:
    - unless:
        - lvdisplay {{ vg }}/{{ lvpool }}
    - require:
        - file: /etc/sysconfig/docker-storage-setup

/var/lib/docker:
  file.directory:
    - clean: True
    - user: root
    - group: root
    - mode: 755
    - unless:
        - lvdisplay {{ vg }}/{{ lvpool }}

docker:
  service.running:
    - enable: True
