# Pipeline d’événements de commandes en temps réel avec Snowflake

## 🚀 Présentation du projet
Ce projet démontre la mise en place d’un **pipeline de données temps réel** entièrement basé sur **Snowflake**.

Il permet d’ingérer des événements de commandes e-commerce au format JSON, de les transformer de manière incrémentale et de fournir des tables prêtes pour l’analyse.

Ce dépôt est conçu pour mettre en valeur des **compétences concrètes en data engineering Snowflake**.

---

## 🧱 Stack technique
- Snowflake
- SQL
- JSON / JSON Lines
- Snowflake Streams & Tasks

---

## 📂 Structure du projet
```text
├── data/
│ └── orders_events.jsonl
├── sql/
│ ├── 01_setup.sql
│ ├── 02_raw_layer.sql
│ ├── 03_streams.sql
│ ├── 04_transform.sql
│ ├── 05_tasks.sql
│ └── 06_queries.sql
├── docs/
│ └── architecture.md
└── README.md
```
---

## 🏗️ Architecture
Le pipeline suit un **pattern ELT moderne** :
- Ingestion des données brutes
- Traitement incrémental via Streams
- Transformations automatisées via Tasks
- Tables analytiques prêtes à l’usage

📘 Détails complets : `docs/architecture.md`

---

## 🔄 Étapes du pipeline

1. Dépôt des fichiers JSON Lines dans un stage Snowflake
2. Chargement des événements dans la couche raw
3. Détection des nouvelles données via un stream
4. Transformation automatique vers la couche analytics
5. Analyse via requêtes SQL

---

## 📊 Cas d’usage
- Suivi du chiffre d’affaires journalier
- Analyse de la valeur client
- Suivi du cycle de vie des commandes
- Détection d’événements tardifs
- Alimentation de dashboards temps réel

---

## ▶️ Exécution du projet

1. Création de l’infrastructure Snowflake :
```sql
-- Exécuter sql/01_setup.sql
```
2. Création de la couche raw et du stream :
```sql
-- Exécuter sql/02_raw_layer.sql
-- Exécuter sql/03_streams.sql
```
3. Création de la table analytics :
```sql
-- Exécuter sql/04_transform.sql
```
4. Activation du traitement automatique :
```sql
-- Exécuter sql/05_tasks.sql
```
5. Requêtes analytiques :
```sql
-- Exécuter sql/06_queries.sql
```

## 🎯 Objectifs du projet

Ce projet met en évidence :

- L’ingestion temps réel
- Les capacités natives de Snowflake
- Le traitement incrémental
- Une modélisation orientée analytique
- Des pratiques proches de la production


## 📌 Évolutions possibles

- Auto-ingestion avec Snowpipe
- Contrôles de qualité des données
- Optimisation des coûts
- Intégration d’outils BI
- CI/CD pour le SQL