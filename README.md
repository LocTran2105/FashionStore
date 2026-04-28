# FashionStore 🛍 - E-commerce web application

## Overview
FashionStore is a full-stack e-commerce web application tailored for a modern clothing brand. Built on the robust Spring Boot framework, it seamlessly combines traditional server-side rendering (MVC) with modern real-time interactions and AI to deliver a superior shopping and management experience.

## Business logic and features

### 1. Customer portal (Web Interface)
* **Product discovery:** Users can browse fashion items, filter by categories, search by keys and view detailed product descriptions.
* **Shopping cart and checkout:** Seamless session management allowing users to safely add items to their cart and complete purchases.
* **AI Style Assistant:** An integrated AI Chatbot that provides personalized outfit recommendations and answers customer inquiries instantly.

### 2. Admin portal (Management Interface)
* **Sidebar layout:** A classic, intuitive left-sidebar navigation layout for efficient workflow.
* **Inventory management:** Full CRUD (Create, Read, Update, Delete) operations for all object in the management system.
* **Order tracking and real-time alerts:** Admins receive instant notification pulses when a new order is placed by a customer, powered by WebSockets (no page refresh required).
* **Role-Based access control:** Strictly secured routes ensuring only users with `ROLE_ADMIN` can access the dashboard.

## Tech stack and architecture

* **Core Framework:** Java 17 / Spring Boot 3.3.x
* **Frontend Engine:** Thymeleaf, HTML5, CSS3, Vanilla JavaScript
* **Database & ORM:** MySQL, Spring Data JPA (Hibernate)
* **Security & Auth:** Spring Security, Spring Session (JDBC backing)
* **Real-time Communication:** Spring WebSockets (STOMP)
* **Artificial Intelligence:** Spring AI (OpenAI integration)
* **Project Structure:** `hcmute.edu.vn.fashionstore`

## Architecture & Technology Stack

| Layer / Technology            | Usage                       | Purpose                                                     |
| ----------------------------- | --------------------------- | ----------------------------------------------------------- |
| Spring Boot                   | Backend Framework           | Main backend application framework                          |
| Spring MVC                    | MVC Architecture            | Handle request routing and controller logic                 |
| Spring Data JPA               | Data Access Layer           | Database interaction using repositories                     |
| Hibernate                     | ORM                         | Map Java objects to MySQL tables                            |
| MySQL                         | Database                    | Store application data                                      |
| Thymeleaf                     | Server-Side Rendering (SSR) | Render dynamic HTML pages on the server                     |
| HTML5                         | Frontend Structure          | Build web page structure                                    |
| CSS3                          | UI Styling                  | Style the application interface                             |
| Bootstrap 5                   | Responsive UI Framework     | Build responsive admin dashboard UI                         |
| JavaScript                    | Frontend Logic              | Handle client-side interactions                             |
| Fetch API                     | AJAX / Async Requests       | Call REST APIs without page reload                          |
| REST API                      | Backend Communication       | CRUD operations using JSON                                  |
| JSON                          | Data Exchange Format        | Exchange data between frontend and backend                  |
| Maven                         | Build Tool                  | Dependency management and project build                     |
| JPA Entity                    | Database Mapping            | Represent database tables as Java classes                   |
| Repository Pattern            | Data Layer Pattern          | Separate database logic from business logic                 |
| Service Layer                 | Business Logic Layer        | Handle application rules and processing                     |
| DTO Pattern                   | Data Transfer               | Transfer request/response data safely                       |
| Pagination                    | Data Management             | Split large product lists into pages                        |
| Search & Filter               | Product Management          | Search products and filter by status                        |
| SweetAlert2                   | User Interaction UI         | Display modern confirmation dialogs                         |
| Hybrid SSR + CSR Architecture | Web Architecture            | Combine server-rendered pages with dynamic API interactions |


## Setup and installation

**1. Prerequisites:**
* Java Development Kit (JDK) 17 or higher.
* MySQL Server (running on port 3306).
* An active OpenAI API Key for the Chatbot feature.

**2. Database Configuration:**
Create a database in MySQL named `fashion_db`:
```sql
CREATE DATABASE fashion_db;