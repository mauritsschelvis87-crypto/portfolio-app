# Docker setup (alle projecten)

Elk project heeft hetzelfde patroon:

1. **Dockerfile** in de projectmap → bouwt de app
2. **GitHub Actions** → pusht image naar Docker Hub bij push op `main`
3. **Server** → `docker compose pull` + `docker compose up -d`

## Server mappen

| Project | Map op server |
|---------|---------------|
| Portfolio | `/opt/portfolio/` |
| Film webshop | `/opt/homecinema/homecinema-deploy/` |
| Medical | `/opt/medical-data-platform/deploy/` |
| Marco Polo | `/opt/school-project/` |
| Origins (Flutter) | `/opt/origins/` |
| Nginx | `/opt/reverse-proxy/` |

## Update op server

```bash
cd /opt/portfolio && ./update.sh
cd /opt/homecinema/homecinema-deploy && ./update.sh
cd /opt/medical-data-platform/deploy && ./update.sh
cd /opt/school-project && ./update.sh
cd /opt/origins && ./update.sh
```

## Docker Hub images

- `s1156856/portfolio-page:latest`
- `s1156856/homecinema-frontend:latest`
- `s1156856/homecinema-backend:latest`
- `s1156856/medical-frontend:latest`
- `s1156856/medical-backend:latest`
- `s1156856/medical-ai-service:latest`
- `s1156856/school-project:latest`
- `s1156856/origins-game:latest`
