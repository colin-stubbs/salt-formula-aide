{% from "aide/map.jinja" import aide_map with context %}

include:
  - aide

{% if aide_map.schedule %}
cron-aide:
  cron.present:
    - identifier: SALT-CRON-AIDE
    - name: 'aide --check 1>/dev/null 2>&1'
    - user: {{ aide_map.schedule.user }}
    - minute: {{ aide_map.schedule.minute }}
    - hour: {{ aide_map.schedule.hour }}
    - daymonth: {{ aide_map.schedule.daymonth }}
    - month: {{ aide_map.schedule.month }}
    - dayweek: {{ aide_map.schedule.dayweek }}
    - require:
      - pkg: aide
{% endif %}
