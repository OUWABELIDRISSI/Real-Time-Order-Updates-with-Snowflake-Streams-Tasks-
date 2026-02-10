# Architecture – Pipeline d’événements de commandes en temps réel (Snowflake)

## 1. Vue d’ensemble
Ce projet met en œuvre un **pipeline de données temps réel** basé sur **Snowflake** pour ingérer, transformer et analyser des événements de commandes e-commerce.

L’architecture suit les bonnes pratiques modernes du data engineering :
- Ingestion orientée événements
- Séparation des couches raw et analytics
- Traitements incrémentaux avec Streams
- Automatisation via Tasks Snowflake

---

## 2. Diagramme logique de l’architecture

---
```text
Fichiers JSON Lines (.jsonl)
│
▼
Stage Snowflake
│
▼
Couche RAW (orders_events_raw)
│
▼
Stream Snowflake
│
▼
Task Snowflake
│
▼
Couche ANALYTICS (orders_events_clean)
│
▼
BI / Analyses / Requêtes SQL
```

---

## 3. Flux de données

### Étape 1 – Génération des événements
Les événements du cycle de vie des commandes (ORDER_CREATED, ORDER_PAID, ORDER_SHIPPED, etc.) sont générés sous forme de fichiers **JSON Lines** (`.jsonl`).

Chaque ligne correspond à un événement unique et immuable.

---

### Étape 2 – Ingestion (Couche Raw)
Les événements sont chargés dans un **stage interne Snowflake**, puis insérés dans la table `raw.orders_events_raw` sous forme de `VARIANT`.

Avantages :
- Flexibilité du schéma
- Ingestion sans perte de données
- Possibilité de rejouer les données

---

### Étape 3 – Capture des changements
Un **STREAM Snowflake** détecte les nouvelles lignes ajoutées à la table raw.

Cela permet :
- Un traitement incrémental
- Une logique idempotente
- Une consommation optimisée du compute

---

### Étape 4 – Transformation (Couche Analytics)
Une **TASK Snowflake**, exécutée toutes les minutes :
- Lit les nouveaux événements depuis le stream
- Extrait les champs JSON
- Applique les types appropriés
- Alimente la table `analytics.orders_events_clean`

---

### Étape 5 – Analyse
La couche analytics permet :
- L’analyse du chiffre d’affaires
- L’analyse du comportement client
- Le suivi du cycle de vie des commandes
- La détection d’événements en retard

---

## 4. Choix d’architecture

### Pourquoi le format JSON Lines ?
- Adapté au streaming
- Append-only
- Compatible avec Snowpipe
- Standard largement utilisé pour les données événementielles

### Pourquoi Streams & Tasks ?
- Solution native Snowflake
- Pas besoin d’orchestrateur externe
- Traitement incrémental et économique

### Pourquoi séparer Raw et Analytics ?
- Auditabilité des données
- Débogage facilité
- Support de l’évolution du schéma
- Bonne pratique des architectures modernes

---

## 5. Scalabilité
Cette architecture peut évoluer en :
- Activant Snowpipe pour l’auto-ingestion
- Ajustant la taille du warehouse
- Ajoutant des data marts
- Connectant des outils BI (Power BI, Looker, Tableau)

---

## 6. Améliorations possibles
- Contrôles de qualité des données
- Déduplication des événements
- Versioning de schéma
- Monitoring et alertes
- Gestion des rôles et des accès
