FROM node:16.17.0

WORKDIR /app/

RUN npm install -g pnpm

COPY [".gitmodules", ".npmrc", "pnpm-workspace.yaml", "./"]
COPY proto/ ./proto/

WORKDIR /app/packages/march-core
COPY packages/march-core .
RUN pnpm install
RUN pnpm build

WORKDIR /app/packages/nestjs-proto-gen-ts
COPY packages/nestjs-proto-gen-ts .
RUN pnpm install
RUN pnpm build

WORKDIR /app/services/march-auth
COPY services/march-auth .

RUN pnpm i . && pnpm prisma:gen

RUN pnpm build

CMD [ "pnpm", "start:prod" ]

EXPOSE 3000
