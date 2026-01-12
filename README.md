cat > README.md << 'EOF'
# 📊 Data Engineering Portfolio

**Building data solutions from extraction to insights**

Hi! I'm Milagros Garrido, a data engineer focused on SQL analytics, data modeling, and building scalable data pipelines.

This repository showcases hands-on projects demonstrating data engineering fundamentals and problem-solving skills with real-world datasets.

---

## 🛠️ Tech Stack

- **Databases:** PostgreSQL
- **Containerization:** Docker, Docker Compose
- **Languages:** SQL
- **Tools:** Git, Linux (Fedora)

---

## 📁 Project Structure
```
data-engineering-portfolio/
├── 02_Docker/
│   ├── config/
│   │   └── create_tables.sql       # Database schema
│   └── docker-compose.yaml         # PostgreSQL setup
├── Tablas Proyecto/
│   └── *.csv                       # Sample datasets
└── README.md
```

---

## 🚀 Featured Projects

### 📈 Sales Analytics with Outlier Detection
- **Challenge:** Compare average sales by product type with and without outliers
- **Solution:** Implemented IQR (Interquartile Range) method to identify and filter outliers
- **Tech:** PostgreSQL, SQL window functions, statistical analysis
- **Key Skills:** Data cleaning, aggregation, statistical methods

---

## 🏃 How to Run

### Prerequisites
- Docker
- Docker Compose

### Setup
```bash
# Clone the repository
git clone https://github.com/mgarrido311/data-engineering-portfolio.git
cd data-engineering-portfolio

# Start PostgreSQL
cd 02_Docker
docker-compose up -d

# Connect to database
docker exec -it <container_name> psql -U postgres -d henry
```

---

## 📫 Contact

- **LinkedIn:** [linkedin.com/in/milagrosgarrido](https://www.linkedin.com/in/milagrosgarrido/)
- **GitHub:** [@mgarrido311](https://github.com/mgarrido311)

---

💡 *This portfolio is continuously evolving as I learn and build more data engineering solutions.*
EOF
