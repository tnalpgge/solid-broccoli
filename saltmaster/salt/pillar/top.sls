base:

  '*':
    - salt.mine

  '*saltmaster*':
    - salt.formulae
    - pkg.git

  'roles:kubemaster':
    - match: grain
    - salt.grains.kubemaster
    - pkg.kubernetes-master

  'roles:kubenode':
    - match: grain
    - salt.grains.kubenode
    - pkg.kubernetes-node

  'roles:dns':
    - match: grain
    - salt.grains.dns
    - dnsmasq

  'not roles:dns':
    - match: compound
    - resolver

  'roles:ntp':
    - match: grain
    - salt.grains.ntp
    - ntp.server

  'not G@roles:ntp':
    - match: compound
    - ntp.client

  'os_family:Debian':
    - match: grain
    - pkg.python-apt
    - pkg.python-pycurl
    - pkg.python-software-properties

  'G@roles:wildfly and G@os:Ubuntu':
    - match: compound
    - pkgrepo.ppa-ilanddev-wildfly
    - pkg.openjdk-8

  'G@roles:wildfly and G@os:SUSE':
    - match: compound
    - pkgrepo.home-ecsos-aggregation
