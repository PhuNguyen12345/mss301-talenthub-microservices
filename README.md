# TalentHub (ATS)

TalentHub is a small-scale microservices-based Applicant Tracking System (ATS) built for learning and practicing modern backend development with Java and Spring ecosystem technologies.

This project is developed as part of the MSS301 — Microservices Development with Java course at FPT University.

---

# 🚀 Tech Stack

- Java 21
- Spring Boot 3.5
- Spring Cloud 2025
- Maven Multi-module
- Docker & Docker Compose
- PostgreSQL
- Eureka Server
- Spring Cloud Gateway
- Spring Cloud Config
- Kafka / RabbitMQ
- Keycloak
- Flyway
- OpenFeign
- Zipkin
- Grafana
- MinIO

---

# 📦 Project Structure

```bash
talenthub/
├── pom.xml
├── docker-compose.yml
├── docker-compose.infra.yml
├── README.md
│
├── infra/
│   ├── eureka-server/
│   ├── config-server/
│   └── api-gateway/
│
├── services/
│   ├── job-service/
│   ├── candidate-service/
│   ├── application-service/
│   ├── notification-service/
│   └── cv-parser-service/
│
├── shared/
│   ├── common-events/
│   ├── common-web/
│   └── common-security/
│
└── config-repo/
```

---

# 🧩 Services Overview

| Service              | Port | Description                   |
|----------------------|------|-------------------------------|
| eureka-server        | 8761 | Service Discovery             |
| config-server        | 8888 | Centralized Configuration     |
| api-gateway          | 8080 | API Gateway                   |
| job-service          | 8081 | Job Management                |
| candidate-service    | 8082 | Candidate Management          |
| application-service  | 8083 | Application Processing        |
| notification-service | 8084 | Email / Notification Handling |
| cv-parser-service    | 8085 | CV Parsing & Processing       |

---

# 🏗 Architecture

The project follows a layered architecture inspired by Hexagonal Architecture / Clean Architecture.

Example package structure:

```bash
com.talenthub.job/
├── api/
├── domain/
├── application/
├── infrastructure/
└── config/
```

## Layers

| Layer          | Responsibility                                |
|----------------|-----------------------------------------------|
| api            | REST Controllers, DTOs, Validation            |
| domain         | Business rules, entities, aggregates          |
| application    | Use-case orchestration                        |
| infrastructure | Database, Kafka, Feign, external integrations |
| config         | Spring configuration                          |

---

# ⚙️ Quick Start

## 1. Clone Repository

```bash
git clone <repo-url> talenthub
cd talenthub
```

---

## 2. Build Project

```bash
mvn clean install -DskipTests
```

---

## 3. Start Infrastructure

```bash
docker compose -f docker-compose.infra.yml up -d
```

This will start:
- PostgreSQL
- Kafka
- RabbitMQ
- Keycloak
- MinIO
- MailHog
- Zipkin
- Grafana

---

## 4. Run Services

Run services individually from IntelliJ IDEA or via Maven:

```bash
cd services/job-service
mvn spring-boot:run
```

---

## 5. Smoke Test

```bash
curl http://localhost:8081/api/v1/jobs/ping
```

Expected response:

```json
{
  "service": "job-service",
  "status": "UP"
}
```

---

# 🐳 Run Full Stack

```bash
docker compose up -d
```

---

# 🛠 Development Conventions

## Branch Naming

```bash
feat/job-service-crud
feat/application-saga
fix/gateway-cors
```

---

## Commit Convention

```bash
feat(job-service): add CRUD endpoints
fix(gateway): correct CORS configuration
```

---

# 📚 Best Practices

- Database per service
- Shared event DTOs only
- No shared business domain
- No business logic inside Gateway
- Use environment variables for secrets
- Use Config Server for centralized configs

---

# ❌ Anti-patterns

- Shared database between services
- Business logic in Gateway
- Hardcoded credentials
- Polyrepo architecture for small teams
- Shared domain model across services

---

# 🧪 Future Improvements

- Distributed tracing with Zipkin
- Circuit Breaker with Resilience4j
- Saga Pattern
- Outbox Pattern
- CI/CD with GitHub Actions
- Testcontainers integration
- Observability with Grafana

---

# 👨‍💻 Authors

Developed for learning purposes in MSS301 — Microservices Development with Java.

---

# 📄 License

This project is for educational purposes.