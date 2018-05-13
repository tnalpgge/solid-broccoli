users:
  vagrant:
    uid: 1001
    shell: /usr/local/bin/bash
    prime_group:
      name: vagrant
      gid: 1001
    groups:
      - wheel
      - vboxusers
