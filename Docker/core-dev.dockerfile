FROM node:16.17.0

WORKDIR /app/

RUN npm install -g pnpm
# RUN npm --silent install --global --depth 0 pnpm@5.13.4
# RUN apk update && apk add --no-cache --repository=http://dl-cdn.alpinelinux.org/alpine/edge/testing && pnpm i grpc
# RUN apk add --no-cache git
# RUN apk add --no-cache tzdata

# RUN pnpm config set store-dir /root/.pnpm-store/v3

COPY [".gitmodules", ".npmrc", "pnpm-workspace.yaml", "./"]

WORKDIR /app/packages/march-core
COPY packages/march-core .
RUN pnpm i . && pnpm build
