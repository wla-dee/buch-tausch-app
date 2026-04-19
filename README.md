# Buch‑Tausch-App‑Datenbank  
# Autor: Vladyslav 
# Kurs: Data-Mart-Erstellung in SQL (DLBDSPBDM01_D)
# Finale Abgabe (Phase 1–3)

## Projektübersicht
Dieses Repository enthält die vollständige Entwicklung eines relationalen Datenbankmanagementsystems für eine Buch‑Tausch-App.  
Das System bildet Benutzer, Bücher, Exemplare, Ausleihen, Bewertungen, Meldungen sowie Übergaben über Spots oder Vaults ab.

Alle Tabellen, Daten und Testfälle befinden sich in der SQL‑Datei.

---

## Inhalte
- bookApp_db.sql – vollständiges Schema + Testdaten + Testfälle  
- Abschlussbericht (PDF)  
- Abstract  (PDF)
- Präsentationen (Phase 1 & 2)  
- Screenshots  
- ER‑Modell  

---

## Installation & Einrichtung

### 1. PostgreSQL installieren
- PostgreSQL (Version 14+) installieren  
- Passwort für Benutzer **postgres** setzen  
- pgAdmin mitinstallieren  
- Standardport **5432** beibehalten  

---

### 2. Datenbank erstellen

**pgAdmin:**  
- *Servers → PostgreSQL → Databases*  
- Rechtsklick → **Create Database**  
- Name: **dein DB-Name**

**oder per SQL:**  
CREATE DATABASE **dein DB-Name**;


---

### 3. SQL‑Datei importieren

**pgAdmin:**  
- Datenbank **dein DB-Name** auswählen  
- **Query Tool** öffnen  
- Datei bookApp_db.sql laden  
- auf **Ausführen** klicken 

**oder das gleiche im Terminal: ausführen**  
psql -U postgres -d dein DB-Name -f bookApp_db.sql


---

## Datenbankstruktur
- **12 Tabellen**  
- **20 Fremdschlüssel**  
- **143 Datensätze**  
- **CHECK‑ und UNIQUE‑Constraints**  
- **XOR‑Constraint zwischen Spot und Vault**

---

## GitHub‑Link
**https://github.com/wla-dee/buch-tausch-app**

---

## Kontakt
Vladyslav

