input {
  udp {
    port => {{ LS_INPUT_PORT | default("25826") }}
    buffer_size => 1452
    codec => collectd { }
    type => "collectd"
  }
}
filter {
  mutate {
    replace => [ "message", "%{message}" ]
    gsub => [ 'message','\n','']
  }
  if [message] =~ /^{.*}$/ {
    json { source => message }
  }
}
output {
  elasticsearch {
    hosts => ["{{ ELASTICSEARCH_ADDR | default("127.0.0.1:9200") }}"]
    index => "{{ ELASTICSEARCH_INDEX | default("logstash-%{+YYYY.MM.dd}") }}"
    user => "{{ ELASTICSEARCH_USER | default("") }}"
    password => "{{ ELASTICSEARCH_PASSWD | default("") }}"
  }
}
