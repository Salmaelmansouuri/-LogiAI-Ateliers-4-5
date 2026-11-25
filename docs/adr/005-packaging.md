# ADR 005 - Packaging de LogiAI

## Statut
Accepte.

## Contexte
LogiAI doit etre installable et distribuable independamment de son code source.

## Decisions
- Utiliser des versions minimales dans pyproject.toml.
- Fixer les versions dans requirements.txt.
- Distribuer le code Python sous forme de Wheel.
- Conserver le modele et les donnees en dehors du package.
- Utiliser LOGIAI_HOME pour localiser les ressources externes.

## Consequences
Des versions exactes dans pyproject.toml limiteraient la compatibilite.
Des versions non fixees dans requirements.txt reduiraient la reproductibilite.
Inclure le modele dans le Wheel augmenterait sa taille.
La separation permet de mettre a jour le code et le modele independamment.
