https://recyclarr.dev

# Put secrets.yml under `/config/secrets.yml`
# Put recyclarr.yml under `/config/recyclarr.yml`
# Put settings.yml under `/config/settings.yml`

# Put everything under configs under `configs` folder

# After adding new instance of radarr or sonarr manually update using `docker compose run --rm recyclarr sync`

<!-- EXTRAS -->
<!-- Languages -->
<!-- https://trash-guides.info/Radarr/Tips/How-to-setup-language-custom-formats/#language-examples -->
# From the `extras` folder import custom formats as needed
## !!! Quality Profile Language must be set to `Any` !!!

## Below extras specification
- Language: Prefer Language X (English)				+10
- Language: Prefer Language X (Spanish)				+10
- Language: Prefer Multi Language (English/Spanish)	+10
- Language: Multiple Only (English/Spanish)			-10000

## Custom Format Radarr/Sonarr Id's:
- Original:         -2
- Any:              -1
- Unknown:          0
- English:          1
- Spanish:          3
- Spanish (Latino): 37
- Japanese:         8
- Dutch:            7
- Flemish:          19

## Reusable commands:
- `recyclarr config list local`
- `recyclarr delete custom-formats media_radarr_movies_hd --all`
- `recyclarr sync radarr -i media_radarr_movies_hd`
- `recyclarr sync radarr -i media_radarr_movies_anime_hd`
- `recyclarr sync sonarr -i media_sonarr_series_hd`
- `recyclarr sync sonarr -i media_sonarr_series_anime_hd`

## Where to find recyclarr configs examples
https://recyclarr.dev/wiki/guide-configs