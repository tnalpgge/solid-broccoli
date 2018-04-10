base:

  '*':
    - packages
    - ntp.ng

  'saltmaster*':
    - salt.master
    - salt.minion
    - salt.api
    - salt.pkgrepo
    - salt.formulas

  'roles:dns':
    - match: grain
    - dnsmasq

  'not G@roles:dns':
    - match: compound
    - resolver.ng

  'roles:kubernetes':
    - match: grain
    - navk8s
