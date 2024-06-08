FROM scratch as builder

COPY --from=node:alpine / /

WORKDIR /app

COPY index.js package.json ./

RUN apk add --no-cache npm && npm install


ENV PORT=8888
ENV NODE_ENV=production

FROM nginx:alpine

RUN apk add --update nodejs

ARG VERSION=1.0.0
ENV VERSION=${VERSION}

COPY nginx.conf /etc/nginx/conf.d/default.conf

COPY --from=builder /app /usr/share/nginx/html

EXPOSE 80

HEALTHCHECK --interval=30s --timeout=10s --start-period=5s --retries=3 \
 CMD curl -f http://localhost:8888 || exit 1


CMD [ "sh", "-c", "nginx & node /usr/share/nginx/html/index.js"] 