# FROGERON — moteur de jeu

Structure à placer à la RACINE de votre dépôt GitHub :

- `project.godot`, `main.tscn`, `main.gd` : projet Godot 4.3 (exemple de test).
- `export_presets.cfg` : preset d'export "Web" (sans threads, donc compatible GitHub Pages).
- `editor/` : éditeur 3D (ouvert sur /editor/).
- `site/index.html` : page d'accueil (copiée à la racine du site).
- `.github/workflows/deploy.yml` : exporte le projet Godot et publie le site.

## Mise en route (une seule fois)

1. Sur GitHub : Settings → Pages → Source : **GitHub Actions**.
2. Remplacez les fichiers du dépôt par cette structure, puis faites un commit sur `main`.
3. Onglet **Actions** : suivez le job "Build et publier FROGERON".
4. Une fois terminé, le site est disponible sur :
   - `…/` : accueil
   - `…/game/` : votre projet Godot
   - `…/editor/` : l'éditeur 3D

## Utiliser votre propre projet Godot

Copiez vos fichiers Godot à la racine (en remplaçant les fichiers de test) en gardant
`export_presets.cfg` qui contient le preset "Web". Si votre projet est dans un sous-dossier,
ajoutez `working-directory` dans le workflow.

## Tester en local (optionnel)

Godot 4.3 → Projet → Exporter → ajouter "Web" → Exporter le projet.
Servir le dossier avec `python3 -m http.server` puis ouvrir `http://localhost:8000`.
