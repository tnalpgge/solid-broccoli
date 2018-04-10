salt:
  minion:
    mine_interval: 60
    mine_functions:
      network.get_hostname: []
      network.ip_addrs:
        interface: enp0s8
      network.ip_addrs6:
        interface: enp0s8
