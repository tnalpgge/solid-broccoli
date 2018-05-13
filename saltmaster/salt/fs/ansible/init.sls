/home/vagrant/.ssh:
  file.directory:
    - user: vagrant
    - group: vagrant
    - mode: 700
    - recurse:
        - user
        - group

/home/vagrant/.ssh/id_rsa:
  file.managed:
    - source: /vagrant/.vagrant/machines/default/virtualbox/private_key
    - user: vagrant
    - group: vagrant
    - mode: 400
