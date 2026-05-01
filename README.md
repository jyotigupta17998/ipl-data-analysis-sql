# 🏏 What Actually Wins IPL Matches?  
### A Data-Driven Analysis Using MySQL & Power BI

---

## 📌 Problem Statement

T20 cricket is often seen as unpredictable, but underlying patterns still drive match outcomes.

This project analyzes 12 seasons of IPL data (2008–2020) to answer:

- What factors actually influence winning in IPL?
- Do high-scoring players really contribute most to victories?
- How important are toss decisions and venue conditions?
- What type of players provide the most value to a team?

Unlike typical IPL analyses that focus on surface-level statistics,
this project emphasizes decision-making insights using advanced SQL techniques.

---

## 📂 Dataset

| Detail | Info |
|---|---|
| Source | Kaggle – IPL Complete Dataset |
| Seasons Covered | 2008–2020 |
| Matches | 1,076 |
| Deliveries | 1,06,670 |

Dataset not included due to size.  
Download directly from Kaggle:  
https://www.kaggle.com/datasets/patrickb1912/ipl-complete-dataset-20082020

---

## 🛠️ Tools & Technologies

- **MySQL** → Data extraction, transformation, and analysis  
- **Power BI** → Interactive dashboard and visualization  

### SQL Techniques Used:
- Joins, Aggregations  
- Conditional Logic (CASE WHEN)  
- Window Functions (RANK, PARTITION BY)  
- CTEs (Common Table Expressions)  
- Data Cleaning (handling NULL / NA values)

---

## 🔍 Analytical Approach

The project is structured in two layers:

### 1. Descriptive Analysis (What happened?)
- Team performance trends  
- Top batsmen and bowlers  
- Toss impact on match outcomes  
- Venue distribution  

### 2. Analytical Insights (Why it happened?)
- Player consistency vs total performance  
- Match impact vs run accumulation  
- Venue-based toss strategy  
- Context-driven performance (chases, wins)

---

## 📊 Key Insights

- **Chasing provides a structural advantage**, but its effectiveness varies significantly by venue  
- **Consistency matters more than peak performance** — players with stable contributions outperform high-variance scorers  
- **High total runs ≠ high match impact** — contribution in winning matches is more important  
- **Toss strategy is context-dependent** — venue conditions influence whether batting or chasing is optimal  
- **A few teams dominate long-term performance**, indicating the importance of squad stability and management  

---

## 📈 Advanced Analysis Highlights

### 🔹 Player Consistency Modeling
- Designed a **consistency score** using average runs and variance  
- Identifies players who deliver stable performance across matches  

### 🔹 Venue-Based Toss Strategy
- Analyzed toss decisions across venues  
- Found that **toss advantage is not universal**, varies by stadium  

### 🔹 Impact-Based Player Evaluation
- Compared player contribution in winning matches vs total runs  
- Highlighted difference between **volume scorers vs impact players**

---

## 🎯 Strategic Recommendations

- Prioritize **consistent middle-order batsmen** over high-variance players  
- Use **venue-specific toss strategies** instead of fixed decisions  
- Evaluate players based on **match impact, not just total runs**  
- Build **balanced teams** rather than relying on top-heavy batting  

---

## 📊 Power BI Dashboard

An interactive dashboard was built to complement SQL analysis.

### Features:
- KPI Cards (Matches, Runs, Wickets)  
- Top Players Analysis  
- Team Performance Breakdown  
- Batting & Bowling Comparisons  
- Interactive filters (Season, Player)

### Preview:

![Overview](power-bi-dashboard/Overview.png)  
![Batting Analysis](power-bi-dashboard/Batting%20Analysis.png)  
![Bowling Analysis](power-bi-dashboard/Bowling%20Analysis.png)

---

## ⚠️ Data Quality Handling

- `dismissal_kind` contained `'NA'` instead of proper NULL values  
- Cleaned using filtering conditions  
- Ensured accurate wicket calculations  

This reflects handling of **real-world dirty data issues**.

---

## 📁 Repository Structure
```
ipl-data-analysis-sql/
│
├── README.md
├── ipl_analysis.sql
├── LICENSE
│
├── screenshots/
│   ├── query1_team_wins.png
│   ├── query2_toss_impact.png
│   ├── query3_top_batsmen.png
│   └── ...
│
└── power-bi-dashboard/
├── IPL-data-analysis-Power-BI.pbix
├── Overview.png
├── Batting Analysis.png
└── Bowling Analysis.png
```

---

## 📌 Key Takeaway

This project demonstrates how raw data can be transformed into  
**actionable insights using SQL and visualization tools.**

Rather than focusing only on “who performed best,”  
the analysis answers:

> **What actually drives winning outcomes—and how can teams act on it?**

---

## 📄 License

This project is licensed under the MIT License.  
See the [LICENSE](LICENSE) file for details.
