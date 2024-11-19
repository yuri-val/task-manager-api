# Task Manager API

Task Manager API is a Rails backend application paired with a React frontend for managing tasks, projects, clients, invoices, and payments. It features JSON API with JWT authentication, Sidekiq for background jobs, and currency updates via OpenExchangeRates.

---

## Features

- **Task Management**: Track tasks, time entries, rates, and payments.
- **Project Management**: Associate tasks with projects and clients.
- **Client Management**: Manage client details, contacts, and associated projects.
- **Invoice Management**: Create and track invoices with status updates.
- **Currency Exchange**: Update and convert currencies via OpenExchangeRates.
- **Authentication**: Secure user login using Devise with JWT tokens.
- **Background Jobs**: Automated currency rate updates using Sidekiq.

---

## Table of Contents

- [Task Manager API](#task-manager-api)
  - [Features](#features)
  - [Table of Contents](#table-of-contents)
  - [Getting Started](#getting-started)
    - [Prerequisites](#prerequisites)
    - [Installation](#installation)
  - [API Documentation](#api-documentation)
    - [**Authentication**](#authentication)
    - [**Clients**](#clients)
    - [**Projects**](#projects)
    - [**Tasks**](#tasks)
  - [Environment Variables](#environment-variables)
  - [Running Tests](#running-tests)
  - [Deployment](#deployment)
  - [License](#license)
  - [Contributions](#contributions)

---

## Getting Started

### Prerequisites

- **Ruby**: 3.1.0 or higher
- **Rails**: 6.1 or higher
- **Node.js**: 14.x or higher
- **PostgreSQL**: 12.x or higher
- **Redis**: For Sidekiq background jobs

### Installation

1. Clone the repository:

   ```bash
   git clone https://github.com/your-username/task-manager-api.git
   cd task-manager-api
   ```

2. Install dependencies:

   ```bash
   bundle install
   yarn install
   ```

3. Set up the database:

   ```bash
   rails db:create db:migrate db:seed
   ```

4. Run the Rails server:

   ```bash
   rails server
   ```

5. Start Sidekiq:

   ```bash
   bundle exec sidekiq
   ```

6. Access the application at `http://localhost:3000`.

---

## API Documentation

The API follows the JSON:API standard. Below is a brief overview of the key endpoints:

### **Authentication**

- **POST** `/api/v1/users/sign_in`: Log in to the system.
- **DELETE** `/api/v1/users/sign_out`: Log out of the system.

### **Clients**

- **GET** `/api/v1/clients`: Retrieve all clients.
- **POST** `/api/v1/clients`: Create a new client.
- **GET** `/api/v1/clients/:id`: Retrieve a specific client.

### **Projects**

- **GET** `/api/v1/projects`: Retrieve all projects.
- **POST** `/api/v1/projects`: Create a new project.

### **Tasks**

- **GET** `/api/v1/tasks`: Retrieve all tasks.
- **POST** `/api/v1/tasks`: Create a new task.

_For detailed API documentation, please refer to the Swagger/OpenAPI docs in `http://localhost:3000/docs` (if configured)._

---

## Environment Variables

Configure the following environment variables in a `.env` file:

```bash
# OpenExchangeRates API
OPEN_EXCHANGE_RATES_APP_ID=your_api_key

# Devise JWT Secret
DEVISE_JWT_SECRET_KEY=your_devise_jwt_secret_key

# Database
DATABASE_URL=postgres://user:password@localhost:5432/task_manager_api

# Redis
REDIS_URL=redis://localhost:6379/0
```

---

## Running Tests

The application uses RSpec for testing.

1. Run all tests:

   ```bash
   bundle exec rspec
   ```

2. Run a specific test file:

   ```bash
   bundle exec rspec spec/models/client_spec.rb
   ```

---

## Deployment

1. Ensure the production environment is set up with PostgreSQL and Redis.
2. Configure environment variables on the server.
3. Precompile assets:

   ```bash
   rails assets:precompile
   ```

4. Run database migrations:

   ```bash
   rails db:migrate RAILS_ENV=production
   ```

5. Start the application using a process manager like **Puma** or **Passenger**.

---

## License

This project is licensed under the MIT License. See the [LICENSE](LICENSE) file for details.

---

## Contributions

Contributions are welcome! Please submit a pull request or open an issue to suggest improvements.

---

**Happy coding!** 🎉 If you have any questions or issues, feel free to reach out!
