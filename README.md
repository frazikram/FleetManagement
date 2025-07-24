
# 🚗 Uber-Style Fleet Management System – Design Document

## 1. Overview

A full-stack, real-time system that connects riders with drivers, tracks vehicle locations, manages trip dispatching, and handles payments and fleet operations. Designed to support global scale, multi-device support, and developer productivity.

---

## 2. Tech Stack Summary

| Layer               | Technology                            |
|---------------------|----------------------------------------|
| **Frontend (Web)**  | React + TypeScript + Tailwind/Chakra UI |
| **Frontend (Mobile)**| React Native + TypeScript + Expo       |
| **Backend**         | NestJS (TypeScript)                    |
| **Infrastructure**  | AWS + Terraform                        |
| **SQL**             | Amazon RDS (PostgreSQL)                |
| **NoSQL**           | Amazon DynamoDB                        |
| **Realtime/Cache**  | Amazon ElastiCache (Redis)             |
| **Messaging**       | Amazon SQS / SNS / EventBridge         |
| **Storage**         | Amazon S3                              |

---

## 3. High-Level Architecture

```
+--------------------------+
|    Frontend Clients      |
|--------------------------|
| - Rider Web (React)      |
| - Rider Mobile (RN)      |
| - Driver Mobile (RN)     |
| - Admin Panel (React)    |
+-----------+--------------+
            |
+-----------v------------+
|   API Gateway / ALB    |
+-----------+------------+
            |
     +------v-------+
     |  NestJS App  |
     +------+-------+
            |
+-----------+-----------+
|   Microservices:      |
|  - Trips              |
|  - Dispatch           |
|  - Drivers            |
|  - Riders             |
|  - Geo / Pricing      |
+-----------+-----------+
            |
+-----------+-----------+-----------+-----------+
|     PostgreSQL       |   DynamoDB |   Redis   |   S3   |
|   (Trip data)        | (Profiles) | (Location)| (Docs) |
+----------------------+-----------+-----------+--------+
```

---

## 4. Frontend Architecture

### 🌐 Web (React + TS)
- Rider web portal
- Admin dashboard
- Built with React Router, React Query, Tailwind 

### 📱 Mobile (React Native + TS)
- Rider & Driver apps
- Real-time trip tracking & updates
- Background location tracking for drivers
- Push notifications

### 🔐 Auth Flow
- OAuth2 + JWT via AWS Cognito (or Auth0)
- Web: secure cookies or memory storage
- Mobile: Secure storage (Keychain/Keystore)

### 📡 Realtime Communication
- WebSocket or MQTT via NestJS Gateway
- Live driver tracking, trip updates, dispatch offer timers

---

## 5. Backend Services (NestJS Microservices)

| Service         | Description                                  | Storage         |
|------------------|----------------------------------------------|------------------|
| Trip Service     | Trip lifecycle (requested → completed)       | PostgreSQL        |
| Driver Service   | Driver profiles, vehicle data                | DynamoDB          |
| Rider Service    | Rider profiles, saved locations              | DynamoDB          |
| Location Service | GPS tracking, geo queries                    | Redis             |
| Dispatch Service | Trip-driver matching, retries, TTL offers    | Redis + PostgreSQL |
| Pricing Service  | Fare + ETA estimation                        | Internal calc or Map APIs |
| Notification     | SMS, push, email                             | SNS / 3rd party     |
| Admin Service    | Analytics, CRUD for fleet ops                | Mixed DBs & S3     |

---

## 6. Data Modeling

| Entity         | Store           | Reason                                  |
|----------------|------------------|------------------------------------------|
| Trips          | PostgreSQL       | Relational, transactional consistency    |
| Invoices       | PostgreSQL       | Accurate, auditable billing              |
| Driver/Rider   | DynamoDB         | Flexible schemas, fast read/write        |
| Live Locations | Redis GEO        | Real-time spatial queries (Haversine)    |
| Documents      | Amazon S3        | File uploads (licenses, receipts)        |

---

## 7. Infrastructure (AWS + Terraform)

### 🔧 Terraform Modules

| Module         | Purpose                               |
|----------------|----------------------------------------|
| `vpc/`         | VPC, subnets, route tables             |
| `rds/`         | PostgreSQL (Amazon RDS)                |
| `dynamodb/`    | NoSQL (Driver/Rider tables)            |
| `redis/`       | Real-time location (ElastiCache Redis) |
| `sqs/`         | Trip & dispatch events                 |
| `ecs/`         | Fargate deployment of NestJS services  |
| `iam/`         | Service permissions                    |
| `secrets/`     | Secrets Manager config                 |

---

## 8. CI/CD Plan

| Component | Tool                        | Purpose                        |
|-----------|-----------------------------|--------------------------------|
| Web       | Vercel / GitHub Actions     | Auto-deploy on push to main    |
| Mobile    | Expo EAS / Bitrise          | Dev & prod build pipelines     |
| Backend   | GitHub Actions + ECS        | Docker + NestJS deploy         |
| Infra     | Terraform Cloud / CLI       | Infra automation & multi-env   |

---

## 9. Security Considerations

- OAuth2 / JWT (Cognito or Auth0)
- IAM roles for each service
- VPC isolation for backend & DBs
- Secrets stored in AWS Secrets Manager
- HTTPS, rate limiting, CSRF/XSS protections
- Redis used for rate limiting, TTL trip offers

---

## 10. Future Enhancements

- Surge pricing engine
- Heatmap analytics via OpenSearch or ClickHouse
- Driver incentive & bonus tracking
- Voice-over-IP integration
- Route optimization with in-house ML

---

## 11. Monorepo Layout

```
/fleet-platform
│
├── /frontend
│   ├── /web         # React app
│   └── /mobile      # React Native app
│
├── /backend         # NestJS monorepo
│   ├── /apps        # Microservices (trip, rider, driver...)
│   └── /libs        # Shared DTOs, interfaces
│
├── /infra           # Terraform IaC
│   ├── /modules     # Reusable TF modules
│   └── /environments/dev, staging, prod
│
└── README.md

