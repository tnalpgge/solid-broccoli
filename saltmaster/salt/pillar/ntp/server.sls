ntp:
  servers: 
    - 0.us.pool.ntp.org
    - 1.north-america.pool.ntp.org
    - 2.pool.ntp.org
  ng:
    settings:
      ntpd: True
      ntp_conf:
        server:
          - 0.us.pool.ntp.org
          - 1.north-america.pool.ntp.org
          - 2.pool.ntp.org
