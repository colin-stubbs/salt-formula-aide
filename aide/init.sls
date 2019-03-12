{% from "aide/map.jinja" import aide_map with context %}

{%- if grains['os'] == 'Ubuntu' %}
aide_workdir:
  file.directory:
    - user:  root
    - name:  /var/lib/aide
    - group:  root
    - mode:  755
{%- endif %}

aide:
  pkg.installed:
    - name: aide
  cmd.run:
    - name: 'aide -c /etc/aide.conf --init && mv /var/lib/aide/aide.db.new.gz /var/lib/aide/aide.db.gz'
    - unless: 'test -f /var/lib/aide/aide.db.gz'
    - require:
      - pkg: aide
{%- if grains['os'] == 'Ubuntu' %}
      - file: aide_workdir
{%- endif %}
  file.managed:
    - name: /etc/aide.conf
    - source: salt://aide/files/aide.conf
    - template: jinja
    - user: root
    - group: root
    - mode: 0600
    - require:
      - pkg: aide
    - context:
        aide_map: {{ aide_map | yaml() }}
