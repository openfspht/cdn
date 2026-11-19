#!/bin/sh
set -eu

IMAGE="${OPENFSP_VALIDATOR_IMAGE:-ghcr.io/openfspht/validator:${OPENFSP_VALIDATOR_VERSION:-0.5.0}}"

usage() {
    cat <<'USAGE'
Usage: curl -fsSL https://cdn.openfsp.org/validate.sh | sh -s -- <base-url> [options]

Runs the OpenFSP conformance suite against <base-url> and prints the report.
Requires Docker. A localhost or 127.0.0.1 address reaches the server running on this machine through
the host network (Docker Desktop: Settings, Resources, Network, enable host networking).

Options are those of the validator (--help lists them), for example:
  --api-key <key>            key of the conformance account
  --report <file>            also write the JSON report in the current directory
  --webhook-port <port>      receive webhooks on this port of this machine
  --webhook-url <url>        public URL the server must call for webhooks

Environment:
  OPENFSP_VALIDATOR_VERSION  validator version (default 0.5.0)
  OPENFSP_VALIDATOR_IMAGE    full image reference, overrides the version
USAGE
}

fail() {
    printf 'validate.sh: %s\n' "$1" >&2
    exit "${2:-64}"
}

publish() {
    case "$1" in
        '' | *[!0-9]*) fail "--webhook-port takes a port number" ;;
    esac
    [ "$2" = host ] || printf -- '-p %s:%s' "$1" "$1"
}

main() {
    [ "$#" -ge 1 ] || { usage >&2; exit 64; }
    case "$1" in
        -h | --help | help) usage; exit 0 ;;
        http://* | https://*) ;;
        *) fail "the first argument must be the http or https base URL of the server" ;;
    esac
    command -v docker > /dev/null 2>&1 || fail "Docker is required: https://docs.docker.com/get-docker/" 69

    flags="--rm --pull=missing"
    network=""
    case "$1" in
        http://localhost[:/]* | https://localhost[:/]* | http://localhost | https://localhost | \
            http://127.0.0.1[:/]* | https://127.0.0.1[:/]* | http://127.0.0.1 | https://127.0.0.1)
            network=host
            flags="$flags --network host"
            ;;
    esac
    previous=""
    workdir=""
    for argument in "$@"; do
        case "$previous" in
            --webhook-port) flags="$flags $(publish "$argument" "$network")" ;;
            --report) workdir=$(pwd) ;;
        esac
        case "$argument" in
            --webhook-port=*) flags="$flags $(publish "${argument#*=}" "$network")" ;;
            --report=*) workdir=$(pwd) ;;
        esac
        previous="$argument"
    done
    [ -z "$workdir" ] || flags="$flags --user $(id -u):$(id -g)"
    [ -t 1 ] && flags="$flags -t"

    # shellcheck disable=SC2086
    exec docker run $flags ${workdir:+-v "$workdir:/work"} "$IMAGE" validate "$@"
}

main "$@"
