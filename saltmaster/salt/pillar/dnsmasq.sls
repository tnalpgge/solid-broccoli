dnsmasq:
  hosts:
    navelint.com:
      saltmaster: 172.28.128.254
      ns: 172.28.128.253
      time: 172.28.128.252
      kubemaster: 172.28.128.251
      kubeconfig: 172.28.128.250
      oo-master-fe27-00: 172.28.128.240
      oo-infra-fe27-00: 172.28.128.230
      oo-app-fe27-00: 172.28.128.220
      oo-app-fe27-01: 172.28.128.221
      oo-stor-fe27-00: 172.28.128.210
  dnsmasq_hosts: salt://dnsmasq/files/dnsmasq.hosts
  dnsmasq_conf: salt://dnsmasq/files/dnsmasq.conf
