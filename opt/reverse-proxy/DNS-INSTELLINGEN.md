# DNS instellen bij ZXCS (maurits-portfolio.nl)

Log in op je ZXCS-beheerpanel en voeg deze **A-records** toe (allemaal naar je Hetzner-server):

| Type | Naam / Host | Waarde |
|------|-------------|--------|
| A | `@` (of leeg) | `178.105.245.202` |
| A | `www` | `178.105.245.202` |
| A | `films` | `178.105.245.202` |
| A | `medical` | `178.105.245.202` |

Nameservers blijven zoals je hebt ingesteld:

- ns.zxcs.nl
- ns.zxcs.be
- ns.zxcs.eu

## Na DNS (5–60 minuten wachten)

| Site | URL |
|------|-----|
| Portfolio | https://maurits-portfolio.nl |
| Film webshop | https://films.maurits-portfolio.nl |
| Medisch platform | https://medical.maurits-portfolio.nl |

Oude IP-links (`178.105.245.202:8080` / `:8082`) blijven werken als fallback.
