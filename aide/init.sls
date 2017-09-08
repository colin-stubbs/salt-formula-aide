aide:
  pkg.installed:
    - name: aide
  cmd.run:
    - name: 'aide --init && mv /var/lib/aide/aide.db.new.gz /var/lib/aide/aide.db.gz'
    - unless: 'test -f /var/lib/aide/aide.db.gz'
    - require:
      - pkg: aide
  file.managed:
    - name: /etc/aide.conf
    - source: salt://aide/files/aide.conf
    - template: jinja
    - user: root
    - group: root
    - mode: 0600
    - require:
      - pkg: aide
