
compose () {
  docker-compose --x-networking --x-network-driver bridge $@
}
setup() {
  eval $(docker-machine env default --shell bash)
  compose up -d
  sleep 60
}

teardown() {
  compose stop
}

@test "pi is 3.2" {
  run compose run datanode hadoop jar /share/hadoop/mapreduce/hadoop-mapreduce-examples-2.7.0.jar pi 10 10
  echo $output
  [[ ${lines[${#lines[@]} - 1]} =~ 3.20 ]]
}
