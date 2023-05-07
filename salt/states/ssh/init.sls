include:
  - ssh.users

openssh-server:
  pkg.installed: []
  service.running:
    - name: sshd
    - require:
      - pkg: openssh-server
    - watch:
      - file: /etc/ssh/sshd_config



# TODO: download actual file for 20.04 and load it
# TODO: handle path
/etc/ssh/sshd_config:
  file.managed:
    - source: {{ opts['file_roots']['base'][0] + '/ssh/files/sshd_config' }}
    - user: root
    - group: root
    - mode: 644
    - template: jinja
    - require:
      - pkg: openssh-server

