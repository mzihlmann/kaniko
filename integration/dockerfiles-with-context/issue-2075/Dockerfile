# Copyright 2022 Google, Inc. All rights reserved.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

FROM docker.io/debian:bullseye-slim as base
FROM base as build
RUN \
  set -eu; \
  touch /usr/local/bin/myfile; \
  chown root:root /usr/local/bin/myfile; \
  chmod u=rxs,go=rx /usr/local/bin/myfile; \
  ls -lh /usr/local/bin/myfile
FROM base as final
COPY --from=build ["/usr/local/bin/myfile", "/usr/local/bin/"]
# Test if file exists and its set-user-id bit is set
RUN test -u /usr/local/bin/myfile
LABEL \
  description="Testing setuid behavior in Kaniko"
