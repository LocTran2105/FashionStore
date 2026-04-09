# FashionStore 🛍️ - E-commerce Web Application

## 📖 Overview
FashionStore is a full-stack e-commerce web application tailored for a modern clothing brand. Built on the robust Spring Boot framework, it seamlessly combines traditional server-side rendering (MVC) with modern real-time interactions and Artificial Intelligence to deliver a superior shopping and management experience.

## 💼 Business Logic & Features

### 1. Customer Portal (Web Interface)
* **Product Discovery:** Users can browse fashion items, filter by categories, and view detailed product descriptions.
* **Shopping Cart & Checkout:** Seamless session management allowing users to safely add items to their cart and complete purchases.
* **AI Style Assistant:** An integrated AI Chatbot that provides personalized outfit recommendations and answers customer inquiries instantly.

### 2. Admin Dashboard (Management Interface)
* **Sidebar Layout:** A classic, intuitive left-sidebar navigation layout for efficient workflow.
* **Inventory Management:** Full CRUD (Create, Read, Update, Delete) operations for Categories and Fashion Products.
* **Order Tracking & Real-time Alerts:** Admins receive instant notification pulses when a new order is placed by a customer, powered by WebSockets (no page refresh required).
* **Role-Based Access Control:** Strictly secured routes ensuring only users with `ROLE_ADMIN` can access the dashboard.

## 🛠️ Tech Stack & Architecture

* **Core Framework:** Java 17 / Spring Boot 3.3.x
* **Frontend Engine:** Thymeleaf, HTML5, CSS3, Vanilla JavaScript
* **Database & ORM:** MySQL, Spring Data JPA (Hibernate)
* **Security & Auth:** Spring Security, Spring Session (JDBC backing)
* **Real-time Communication:** Spring WebSockets (STOMP)
* **Artificial Intelligence:** Spring AI (OpenAI integration)
* **Project Structure:** `hcmute.edu.vn.fashionstore`

## 🚀 Setup & Installation

**1. Prerequisites:**
* Java Development Kit (JDK) 17 or higher.
* MySQL Server (running on port 3306).
* An active OpenAI API Key for the Chatbot feature.

**2. Database Configuration:**
Create a database in MySQL named `fashion_db`:
```sql
CREATE DATABASE fashion_db;