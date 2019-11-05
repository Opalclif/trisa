#!/usr/bin/env bash

set -o errexit
set -o nounset
set -o pipefail

REPO_ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/../.." && pwd -P)"
source "${REPO_ROOT}/hack/lib/init.sh"

pki::init::ca
pki::issue::subca 1
pki::issue::subca 2
pki::issue::end-entity::local vasp1 ../server-csr.json subca1
pki::issue::end-entity::local vasp2 ../server-csr.json subca1
pki::issue::end-entity::local vasp3 ../server-csr.json subca2
