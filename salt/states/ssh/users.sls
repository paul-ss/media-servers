/storage:
  file.directory:
    - user: root
    - group: root
    - dir_mode: 755
    - file_mode: 644
    - recurse:
      - mode



{% for user in salt['pillar.get']('data:storage_users') %}
{{ 'user-created-' + user.name }}:
  user.present:
    - name: {{ user.name }} 
    - usergroup: true
    - home: {{ '/storage/' + user.name }}
    - require:
        - file: /storage
{% endfor %}


{% for group in salt['pillar.get']('data:storage_groups') %}
{{ 'group-created-' + group.name }}:
  group.present:
    - name: {{ group.name }}
    - system: False
    - members:
    {%- for user in group.users %}
      - {{ user }}
    {%- endfor %}
    - require:
    {%- for user in group.users %}
      - user: {{ 'user-created-' + user }}
    {%- endfor %}
    
  file.directory:
    - name: {{ '/storage/' + group.name }}
    - user: root
    - group: {{ group.name }}
    - dir_mode: 775
    - file_mode: 644
    - recurse:
      - mode
    - require:
      - group: {{ 'group-created-' + group.name }}
{% endfor %}


{% for group in salt['pillar.get']('data:storage_groups') %}
{% for user in group.users %}
{{ 'symlink-' + user + '-' + group.name }}:
  file.symlink:
    - name: {{ '/storage/' + user + '/' + group.name }}
    - target: {{ '/storage/' + group.name }}
    - require: 
      - file: {{ '/storage/' + group.name }}
      - user: {{ 'user-created-' + user }}
{% endfor %}
{% endfor %}