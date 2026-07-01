FROM node:22-alpine AS deps
WORKDIR /app
COPY package.json package-lock.json* ./
RUN npm ci

FROM node:22-alpine AS build
WORKDIR /app
COPY --from=deps /app/node_modules ./node_modules
COPY . .
RUN npm run build

FROM nginx:alpine AS runtime
COPY --from=build /app/dist /usr/share/nginx/html
COPY nginx.conf /etc/nginx/conf.d/default.conf
EXPOSE 80
# Host-Header setzen, damit der Check den Content-Block (200) trifft statt des
# www->non-www-Redirects (301). Sonst folgt wget dem Redirect nach aussen ueber
# Traefik und der Check haengt bei einem Ausfall im Deadlock (502). max-redirect=0
# als Sicherheitsgurt, damit der Healthcheck nie wieder die oeffentliche URL prueft.
HEALTHCHECK --interval=30s --timeout=10s --start-period=10s --retries=3 \
    CMD wget --no-verbose --tries=1 --spider --max-redirect=0 \
    --header="Host: hinzke.rocks" http://127.0.0.1:80/ || exit 1
