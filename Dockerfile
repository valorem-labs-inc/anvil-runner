FROM debian:bookworm-slim AS foundry

RUN apt-get update -y && apt-get install -y git curl bash
RUN apt-get clean && rm -rf /var/lib/apt/lists/*

RUN useradd -u 1000 -m foundry

USER foundry

RUN curl -L https://foundry.paradigm.xyz | bash

ENTRYPOINT ["/bin/sh", "-c"]

FROM foundry-environment as anvil

# At this point we have the entire toolchain for foundry

# Start a clean anvil chain
EXPOSE 8545

ENTRYPOINT ["anvil"]
