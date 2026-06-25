# DNS instellen bij ZXCS (maurits-portfolio.nl)

## Stap 1 — Hosting ontkoppelen (belangrijk)

Als je domein nog aan een **ZXCS-hostingpakket** hangt, blijven er AAAA-records naar de ZXCS-parkeerpagina wijzen. Klik op de DNS-pagina op:

**(Ont-)koppel een hosting pakket** → **Ontkoppel**

Daarna kun je alle records zelf beheren.

## Stap 2 — DNS wijzigen

Klik **DNS wijzigen** en zet deze records:

### A-records (IPv4)

| Type | Naam / Host | Waarde |
|------|-------------|--------|
| A | `@` (of leeg) | `178.105.245.202` |
| A | `www` | `178.105.245.202` |
| A | `films` | `178.105.245.202` |
| A | `medical` | `178.105.245.202` |
| A | `school` | `178.105.245.202` |

### AAAA-records (IPv6) — dit lost de parkeerpagina op

Verwijder oude AAAA-records met `2a06:2ec0:1::ffed` (ZXCS) en zet ze op je Hetzner-server:

| Type | Naam / Host | Waarde |
|------|-------------|--------|
| AAAA | `@` | `2a01:4f8:c015:b799::1` |
| AAAA | `www` | `2a01:4f8:c015:b799::1` |
| AAAA | `films` | `2a01:4f8:c015:b799::1` |
| AAAA | `medical` | `2a01:4f8:c015:b799::1` |
| AAAA | `school` | `2a01:4f8:c015:b799::1` |

**Alternatief:** verwijder alle AAAA-records als je geen IPv6 wilt gebruiken.

### Optioneel

- `ftp` → verwijderen of ook naar `178.105.245.202`
- `mail` → alleen laten staan op ZXCS (`185.104.28.238`) als je e-mail via ZXCS gebruikt

Nameservers blijven:

- ns.zxcs.nl
- ns.zxcs.be
- ns.zxcs.eu

## Na DNS (TTL is 24 uur, vaak sneller)

| Site | URL |
|------|-----|
| Portfolio | https://maurits-portfolio.nl |
| Film webshop | https://films.maurits-portfolio.nl |
| Medisch platform | https://medical.maurits-portfolio.nl |
| Marco Polo project | https://school.maurits-portfolio.nl |

HTTP wordt automatisch doorgestuurd naar HTTPS.

## HTTPS (Certbot)

Op de server:

```bash
cd /opt/reverse-proxy
./setup-https.sh          # eerste keer certificaat aanvragen
./renew-cert.sh           # handmatig vernieuwen
```

Certificaat vernieuwt automatisch via cron (2x per dag).

Fallback via IP: `178.105.245.202`, `:8080`, `:8082`

## Controleren

```powershell
nslookup maurits-portfolio.nl 8.8.8.8
nslookup -type=AAAA maurits-portfolio.nl 8.8.8.8
```

Verwacht:

- A → `178.105.245.202`
- AAAA → `2a01:4f8:c015:b799::1` (of geen AAAA)
