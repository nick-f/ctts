# ctts (Convert Time to Seconds)

A small bash script to allow for easy conversion of simple time strings
(e.g. `3 hours`) to the number of seconds.

## Usage

```sh
source convert_time_to_seconds.bash

convert_time_to_seconds "1 hour"
# Returns 3600

convert_time_to_seconds "3 days"
# Returns 259200

convert_time_to_seconds "30.5 minutes"
# Returns 1830
```

Note: If installing from [homebrew](#homebrew), the script will be available
with the shorter name `ctts`.

### Supported units

- seconds
- hours
- minutes
- days

All of the supported units allow for including or omitting the trailing
pluralising `s`.

## Installation

### Homebrew

Note: If installing from homebrew, the script will be available with the shorter
name `ctts`.

```sh
brew install nick-f/labs/ctts
```

### Manual download

Download or clone the repo.

## Known limitations

- Only supports single time units. Mixing, say, hours and minutes
  (`1 hour 30 minutes`) won't work.

## Running the test suite

```sh
./test/bats/bin/bats test
```
