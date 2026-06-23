# Todo App

A Todo REST API built with Node.js, PostgreSQL, deployed on AWS ECS Fargate.

## Tech Stack
- Node.js + Express
- PostgreSQL
- Docker
- AWS ECS Fargate + ECR + ALB
- Terraform
- GitHub Actions CI/CD

## Local Setup

### Prerequisites
- Node.js, Docker, PostgreSQL installed locally

### Run locally
```bash
npm install
npm run dev
```

## API Endpoints

| Method | Endpoint | Auth | Description |
|--------|----------|------|-------------|
| GET | /health | No | Health check |
| POST | /auth/signup | No | Register user |
| POST | /auth/login | No | Login, get JWT |
| GET | /todos | Yes | List todos |
| POST | /todos | Yes | Create todo |
| PUT | /todos/:id | Yes | Update todo |
| DELETE | /todos/:id | Yes | Delete todo |

Swagger UI available at `/api-docs`

## AWS Deployment

### 1. Initialize Terraform
```bash
cd terraform
terraform init
terraform apply
```

### 2. Push Docker image to ECR
```bash
aws ecr get-login-password --region ap-south-1 | docker login --username AWS --password-stdin <ECR_URL>
docker build -t todo-app .
docker tag todo-app:latest <ECR_URL>:latest
docker push <ECR_URL>:latest
```

## Monitoring & Logging

### CloudWatch Logs
- Log group: `/ecs/todo-app`
- View logs: AWS Console → CloudWatch → Log Groups

### CPU/Memory Monitoring
- AWS Console → ECS → Cluster → Service → Metrics tab
- Shows CPU and Memory utilization graphs

### Debugging Issues
- Check CloudWatch logs for application errors
- Check ECS service events for deployment failures
- Use `aws ecs describe-services` for service status

## CI/CD Pipeline
GitHub Actions automatically:
1. Builds Docker image on push to main
2. Pushes image to Amazon ECR
3. Deploys updated image to ECS Fargate