dnsmasq:
  hosts:
    navelint.com:
      saltmaster: 172.28.128.254
      ns: 172.28.128.253
      time: 172.28.128.252
      kubemaster: 172.28.128.251
      kubeconfig: 172.28.128.250
  dnsmasq_hosts: salt://dnsmasq/files/dnsmasq.hosts
  dnsmasq_conf: salt://dnsmasq/files/dnsmasq.conf
