setup() {
  load 'test_helper/bats-support/load'
  load 'test_helper/bats-assert/load'

  # get the containing directory of this file
  # use $BATS_TEST_FILENAME instead of ${BASH_SOURCE[0]} or $0,
  # as those will point to the bats executable's location or the preprocessed file respectively
  DIR="$(cd "$(dirname "$BATS_TEST_FILENAME")" >/dev/null 2>&1 && pwd)"

  # make executables in ../ visible to PATH
  PATH="$DIR/..:$PATH"

  source convert_time_to_seconds.bash
}

@test "identifies 'second' unit" {
  output=$(determine_time_unit "1 second")
  assert_output "seconds"
}

@test "identifies 'seconds' unit" {
  output=$(determine_time_unit "1 seconds")
  assert_output "seconds"
}

@test "identifies 'minute' unit" {
  output=$(determine_time_unit "1 minute")
  assert_output "minutes"
}

@test "identifies 'minutes' unit" {
  output=$(determine_time_unit "1 minutes")
  assert_output "minutes"
}

@test "identifies 'hour' unit" {
  output=$(determine_time_unit "1 hour")
  assert_output "hours"
}

@test "identifies 'hours' unit" {
  output=$(determine_time_unit "1 hours")
  assert_output "hours"
}

@test "identifies 'day' unit" {
  output=$(determine_time_unit "1 day")
  assert_output "days"
}

@test "identifies 'days' unit" {
  output=$(determine_time_unit "1 days")
  assert_output "days"
}

@test "converts '1 minute' to seconds" {
  output=$(convert_time_to_seconds '1 minute')
  assert_output 60
}

@test "converts '2 minutes' to seconds" {
  output=$(convert_time_to_seconds '2 minutes')
  assert_output 120
}

@test "converts '1 hour' to seconds" {
  output=$(convert_time_to_seconds '1 hour')
  assert_output 3600
}

@test "converts '3 hours' to seconds" {
  output=$(convert_time_to_seconds '3 hours')
  assert_output 10800
}

@test "converts '1 day' to seconds" {
  output=$(convert_time_to_seconds '1 day')
  assert_output 86400
}

@test "converts '4 days' to seconds" {
  output=$(convert_time_to_seconds '4 days')
  assert_output 345600
}

@test "converts '5.5 days' to seconds" {
  output=$(convert_time_to_seconds '5.5 days')
  assert_output 475200
}

@test "converts '1 week' to seconds" {
  output=$(convert_time_to_seconds '1 week')
  assert_output 604800
}

@test "converts '3 weeks' to seconds" {
  output=$(convert_time_to_seconds '3 weeks')
  assert_output 1814400
}
