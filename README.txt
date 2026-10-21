FROGERON MOBILE EDITOR — prototype web

Pour tester sur iPad :
1. Décompressez ce ZIP dans Fichiers.
2. Le fichier index.html est l'application.
3. Pour que les imports 3D fonctionnent, il faut l'ouvrir depuis un hébergement HTTPS (les bibliothèques Three.js sont chargées depuis un CDN). L'ouverture directe dans l'aperçu de Fichiers peut être bloquée par iOS.
4. Vous pouvez héberger gratuitement ce dossier sur GitHub Pages ou un service d'hébergement statique HTTPS.

Fonctions du prototype :
- Vue 3D tactile (rotation/zoom).
- Ajouter cube, sphère, cylindre, lumière et sol.
- Import de fichiers GLB/GLTF avec textures intégrées.
- Sélection d'objet, position, échelle, rotation.
- Couleur / mode filaire.
- Export de la scène en GLB.
- Sauvegarde JSON des objets primitifs.

Limites :
- Ce n'est pas Godot et ce n'est pas un moteur complet.
- Les scripts, animations et scènes Godot ne sont pas encore pris en charge.
- La sauvegarde JSON de cette version ne mémorise pas les fichiers de modèles importés ; réimportez-les après chargement.
- Le navigateur doit être en ligne pour charger Three.js.
