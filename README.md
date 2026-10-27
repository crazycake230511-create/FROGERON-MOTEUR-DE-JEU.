# Football Club Manager — Godot 4

Prototype de jeu de management de football conçu avec Godot 4 et GDScript.

## Démarrage

1. Décompresser l'archive.
2. Ouvrir Godot 4.7.2.
3. Importer le fichier `project.godot` présent dans ce dossier.
4. Lancer avec F6 ou F5.

Le jeu démarre sur un écran Central inspiré des menus de carrière des jeux de football : navigation horizontale, profil du manager, prochain match, fil d'actualité et événements du club. Le menu est conçu avec des ancres proportionnelles pour mieux s'adapter aux différentes résolutions. Le jeu s'ouvre en plein écran.

## Navigation

- **Central** : prochain match, événements et actualités du club (désormais alimentés par les vrais événements de carrière : offres reçues, fins de contrat, mercato).
- **Squad** : effectif et choix des titulaires (les joueurs prêtés à d'autres clubs sont exclus de la composition).
- **Training** : formation et tactiques.
- **Transfers** : le vrai mercato — voir ci-dessous.
- **Office** : finances complètes (budget transferts, masse salariale, journal des opérations), sauvegarde et nouvelle carrière.
- **Season** : calendrier, résultats et classement.
- **Academy** : scouting et jeunes joueurs générés.
- **Customise** : paramètres et affichage.

## Le marché des transferts (v4)

L'onglet **Transfers — Global Transfer Network** est désormais un véritable mercato vivant, organisé en sous-sections :

| Onglet | Contenu |
|---|---|
| **Marché** | Tous les joueurs disponibles (filtres : poste, âge, note, potentiel, prix, contrat, club + recherche par nom) |
| **Liste** | Joueurs officiellement mis en vente par leur club |
| **Prêts** | Joueurs disponibles pour un prêt temporaire |
| **Agents** | Joueurs proposés directement par leurs agents |
| **Scout** | Jeunes talents du marché + pépites repérées par l'Academy |
| **Effectif** | Mise en vente de tes joueurs (prix demandé, disponibilité prêt) |
| **Offres** | Toutes tes négociations en cours : achats, ventes, prêts, prolongations |
| **Contrats** | Contrats de l'effectif, prêts en cours, levée d'options, prolongations |
| **Historique** | Toutes les opérations finalisées, refusées ou annulées |

### Négociations à deux niveaux

1. **Entre clubs** : montant fixe, bonus conditionnels, pourcentage à la revente, prêt avec option d'achat. Le club vendeur évalue l'offre (valeur, importance du joueur, contrat restant, finances, réputation de l'acheteur) puis accepte, refuse, contre-propositionne ou rompt les négociations.
2. **Avec le joueur** : salaire hebdomadaire, durée, prime à la signature, prime de performance, prime par but, rôle, clause libératoire. Le joueur pèse le prestige du club, la qualité de l'effectif, son âge, son potentiel et la concurrence avant de répondre.

L'argent ne bouge **qu'à la finalisation** : une négociation abandonnée ou échouée ne coûte rien. Les bonus ne sont débités qu'à leur échéance (primes de but et de performance en fin de saison).

### Un monde vivant

Chaque journée (« Advance ») fait progresser contrats, prêts, négociations et mercato : les autres clubs achètent, vendent, prêtent et te concurrencent (y compris sur tes propres cibles). Les fenêtres de transferts (été J00-J03, hiver J14-J17) sont respectées — les agents libres restent signables toute l'année. Neuf types d'opportunités apparaissent au fil des jours : joueurs listés, prêts, fins de contrat, mécontents, occasions financières, propositions d'agents, jeunes talents, révélations et agents libres.

### Architecture technique

La logique est séparée de l'interface dans des modules dédiés (`scripts/`) :

- `transfer_data.gd` — socle de données, monde IA, migration des anciennes sauvegardes
- `transfer_market.gd` — génération quotidienne du marché
- `transfer_negotiation.gd` — négociations clubs et contrats joueurs, finalisations atomiques
- `loan_manager.gd` — prêts, options et obligations d'achat, retours automatiques
- `contract_manager.gd` — échéances, pré-contrats, prolongations
- `club_ai.gd` — IA des clubs (besoins, budgets, stratégies)
- `transfer_hub.gd` — orchestration de la journée

Tout vit dans le dictionnaire `state` existant et est couvert par la sauvegarde JSON (version 3 — les anciennes sauvegardes v2 sont migrées automatiquement, sans perte).

## Tests

Le dossier `tests/` contient des suites exécutables en headless :

```
godot --headless --path . -s tests/transfer_tests.gd      # les 14 scénarios obligatoires (103 assertions)
godot --headless --path . -s tests/probe_ui.gd            # parcours de tous les écrans
godot --headless --path . -s tests/probe_migration.gd     # migration sauvegarde v2 -> v3
godot --headless --path . -s tests/probe_endurance.gd     # 75 journées, 2 saisons
godot --headless --path . -s tests/probe_neg_ui.gd        # états de négociation
```

## Notes

- Les clubs portent des noms connus à titre de démonstration ; joueurs, statistiques et résultats sont générés.
- Les matchs restent simulés : aucun match jouable sur le terrain n'est inclus.
- Les anciennes sauvegardes (version < 2) sont copiées dans `user://football_manager_save_old.json`, puis une carrière de démo démarre.
