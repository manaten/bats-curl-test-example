#!/usr/bin/env bats

@test "post count is 100" {
  response=$(curl -s "https://jsonplaceholder.typicode.com/posts")
  [ "$(echo "$response" | jq length)" -eq 100 ]
}

@test "x-ratelimit-remaining is 999" {
  header=$(curl -s --head "https://jsonplaceholder.typicode.com/posts")
  echo "$header" | grep "x-ratelimit-remaining: 999"
}
