FROM ubuntu:24.04 AS builder

# Avoid interactive prompts during package installation
ENV DEBIAN_FRONTEND=noninteractive

# Install build dependencies
RUN apt-get update && apt-get install -y --no-install-recommends \
    git \
    bash \
    coreutils \
    jq \
    util-linux \
    && rm -rf /var/lib/apt/lists/*

# Set working directory
WORKDIR /ctxos

# Copy the CtxOS project
COPY . /ctxos/

# Install the CLI binary
RUN chmod +x bin/ctxos && \
    bin/ctxos --help >/dev/null 2>&1

# Builder stage: can run tests
FROM builder AS test

# Install test dependencies
RUN apt-get update && apt-get install -y --no-install-recommends \
    python3 \
    python3-pip \
    && pip3 install jq 2>/dev/null || true \
    && rm -rf /var/lib/apt/lists/*

# Run the CLI test suite
RUN cd /ctxos && PATH="/ctxos/bin:$PATH" python3 test/ctxos-cli-test.sh 2>&1 | tail -20

# Final stage: minimal runtime
FROM ubuntu:24.04 AS runtime

ENV DEBIAN_FRONTEND=noninteractive

# Install runtime dependencies needed for CtxOS
RUN apt-get update && apt-get install -y --no-install-recommends \
    bash \
    coreutils \
    jq \
    util-linux \
    && rm -rf /var/lib/apt/lists/*

# Copy the installed CLI from builder
COPY --from=builder /ctxos/bin /usr/local/bin/

# Copy helper scripts
COPY --from=builder /ctxos/install /usr/local/share/ctxos/install/

# Set PATH
ENV PATH="/usr/local/bin:/usr/local/share/ctxos/bin:${PATH}"

# Default command shows help
CMD ["ctxos", "--help"]