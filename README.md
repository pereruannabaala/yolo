# YOLO E‑Commerce App

A full‑stack e‑commerce web application built with **Node.js / Express**, **MongoDB / Atlas**, and **React** (served via Nginx), containerized with **Docker / Docker Compose**.

---

## 🚀 Features

- CRUD operations on **Products** (create, read, update, delete)  
- RESTful API for product management  
- React frontend for browsing and interacting with products  
- Use of **MongoDB Atlas** for cloud-hosted database  
- Dockerized services (backend, frontend) and orchestration via Docker Compose  
- Clean architecture with microservices, environment configuration, and proper networking  

---

## 📂 Repository Structure
```
yolo/
├── backend/                 # Backend (Node.js / Express)
│   ├── server.js
│   ├── routes/api/productRoute.js
│   ├── models/Products.js
│   ├── package.json
│   └── Dockerfile
├── client/                  # Frontend (React)
│   ├── src/
│   ├── public/
│   ├── package.json
│   └── Dockerfile
├── docker-compose.yaml
├── .gitignore
└── README.md

```
