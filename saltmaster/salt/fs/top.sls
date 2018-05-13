base:

  '*':
    - salt.minion
    - packages
    - ntp.ng
    - users

  'saltmaster*':
    - salt.master
    - salt.api
    - salt.pkgrepo
    - salt.formulas

  'roles:dns':
    - match: grain
    - dnsmasq

  'not G@roles:dns and not G@os:FreeBSD':
    - match: compound
    - resolver.ng

  'not G@roles:dns and G@os:FreeBSD':
    - match: compound
    - navelint.resolvconfconf

  'roles:kubernetes':
    - match: grain
    - navk8s

  'roles:openshift':
    - match: grain
    - openshift-origin.docker-storage-setup
