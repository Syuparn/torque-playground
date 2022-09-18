FROM python

# download v8 source code
# https://v8.dev/docs/source-code
RUN apt-get update -y && \
    apt-get install -y git
RUN git clone https://chromium.googlesource.com/chromium/tools/depot_tools.git
ENV PATH=/depot_tools:$PATH
RUN gclient

WORKDIR /v8
RUN fetch v8

WORKDIR /v8/v8
RUN git checkout main && \
    git pull
RUN gclient sync

# copy test code block and patch test source file to execute Torque
WORKDIR /v8/v8/test/cctest/torque
COPY test-torque-patch.cc .
# HACK: insert test block
RUN cat test-torque.cc | sed "/\}  \/\/ namespace compiler/i $(cat test-torque-patch.cc | sed -z 's/\n/\\n/g')" > test-torque.cc

# copy torque source code you wrote
WORKDIR /v8/v8/test/torque
# HACK: rename original torque file to modify it later
RUN cp test-torque.tq test-torque.original.tq

# build deps for Torque
WORKDIR /root
COPY build-torque .
COPY run-torque .
COPY src src
RUN ./build-torque src/main.tq
