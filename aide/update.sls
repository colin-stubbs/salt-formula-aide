{% from "aide/map.jinja" import aide_map with context %}

include:
  - aide

aide-update:
  cmd.run:
    - name: 'aide --update'
    - require:
      - pkg: aide
