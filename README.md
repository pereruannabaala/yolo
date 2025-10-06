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
---

## 🛠 Setup & Development

### Prerequisites

- Node.js installed (for local development)  
- Docker & Docker Compose installed  
- A MongoDB Atlas cluster with connection URI  
- (Optional) `.env` files for environment configuration  

### Local Setup 

1. Clone the repo:  
   ```bash
   git clone https://github.com/pereruannabaala/yolo.git
   cd yolo

2. Backend setup
```
cd backend
npm install
npm run dev 
```

3. Client setup
```
cd ../client
npm install
npm start
```

## 🐳 Running with Docker Compose

Ensure your `backend/.env` contains a valid `MONGO_URL` and other required environment variables.
From the root directory, run:

```bash
docker compose up
```
This will build and launch:
- **backend** service
- **client** service
The application will then be accessible in your browser at: ``http://localhost:3000``

## 🖼 Image Deployment on DockerHub
Below is a screenshot showing the images successfully pushed to DockerHub:
![DockerHub Image Deployment](images/dockerhub-screenshot.png)

## 📄 License

This project is licensed under the MIT License. See the [LICENSE](LICENSE) file for details.

---

## 🐳 Badges

![Docker](https://img.shields.io/badge/Docker-🐳-blue)  
[![DockerHub](https://img.shields.io/badge/DockerHub-View-blue?logo=docker)](https://hub.docker.com/repository/docker/pereruannabaala/yolo)




