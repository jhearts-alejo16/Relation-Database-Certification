# 🎯 Interactive CLI Number Guessing Game (Bash & PostgreSQL)

A high-performance Bash-based command-line interface (CLI) application backed by a relational PostgreSQL database to track persistent user gameplay statistics, best records, and personal histories.

## 🛠️️ Tech Stack
* **Language:** Bash Shell Scripting
* **Database:** PostgreSQL
* **Version Control:** Git

## 💡 Key Features
* **Persistent Gameplay Analytics:** Automatically aggregates player history, total games played, and personal high scores.
* **Input Validation & Sanitization:** Robust regex validation ensuring non-integer inputs are caught dynamically.
* **Relational Schema Design:** Fully normalized database tables using foreign keys and cascading constraints.

## 🚀 Setup & Execution
1. Import database schema:
   ```bash
   psql -U postgres < number_guess.sql