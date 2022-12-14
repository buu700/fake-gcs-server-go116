# Copyright 2019 Francisco Souza. All rights reserved.
# Use of this source code is governed by a BSD-style
# license that can be found in the LICENSE file.

set -e

./fake-gcs-server -backend memory -port 8080 -scheme http -data "${PWD}"/examples/data &

export STORAGE_EMULATOR_HOST=http://localhost:8080
pip install -r examples/python/requirements.txt
python examples/python/python.py

kill %1
