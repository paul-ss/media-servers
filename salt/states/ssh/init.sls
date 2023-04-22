openssh-server:
  pkg.installed: []
  service.running:
    - require:
      - pkg: openssh-server
      - file: /etc/ssh/sshd_config



/etc/ssh/sshd_config:
  file.managed:
    - source: ./files/sshd_config
    - user: root
    - group: root
    - mode: 644
    - template: jinja
    - require:
      - pkg: openssh-server

