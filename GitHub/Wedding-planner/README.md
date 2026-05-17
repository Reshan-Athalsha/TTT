# 💍 WeddingBliss Management System (Base Repository)
**SE1020 - Year 1 Semester 2 Project**

A comprehensive, file-based Wedding Planning and Vendor Booking System built with Java and Spring Boot. This repository serves as the foundational architecture for the team, pre-configured with Component 1 (User Management) and the master File I/O utilities.

---

## ⚠️ TEAM CONTRIBUTING GUIDELINES (READ BEFORE CODING) ⚠️

Welcome to the Base Repository! The core architecture, Spring Boot engine, and Component 1 are already fully configured and tested. **To prevent merge conflicts and application crashes, you must strictly follow these rules:**

#### 🚫 RULE 1: NEVER Create Another `main` Method
Spring Boot applications can only have **ONE** entry point. 
* **DO NOT** create a new Java class with `public static void main(String[] args)`. 
* The only main method is inside `WeddingplannerApplication.java`. If you create a second one, the application will fail to compile.

#### 🚫 RULE 2: The Core Engine is OFF-LIMITS
Do not modify, rename, or move the following files. They are the foundation of the app:
* `pom.xml` (Do not add dependencies without team approval)
* `WeddingplannerApplication.java` (The core runner)
* `com.wedding.util.FileHandler` (The master file I/O utility)
* `com.wedding.weddingplanner.model.User` (The parent class you must inherit from)

#### ✅ RULE 3: How to Build Your Component (JSP UPDATE)
* **Models:** Put your classes in `com.wedding.weddingplanner.model`. If your entity represents a person, it **must** `extend User`.
* **Controllers:** Put your classes in `com.wedding.weddingplanner.controller`.
* **Views (JSP):** We are NO LONGER using Thymeleaf/HTML. You must create **`.jsp`** files and place them strictly inside `src/main/webapp/WEB-INF/jsp/`. Use basic Scriptlets (`<% %>`) or Expression Language (`${}`) for logic.
* **File Handling:** Do not write your own `Scanner` or `FileWriter`. You MUST use `FileHandler.ensureFileExists()` and `FileHandler.writeLineToFile()`.

#### ✅ RULE 4: Git Branching (No Committing to Main!)
Never write your code directly on the `main` branch. 
1. Pull the latest code: `git pull origin main`
2. Create your own branch: `git checkout -b yourname-component`
3. Write your code, test it locally, and push your branch to GitHub.

---

## 🏗️ Architecture & OOP Implementation
To satisfy the grading rubric, this project heavily demonstrates the four pillars of Object-Oriented Programming:
* **Inheritance:** `Client`, `Vendor`, and `Admin` classes successfully `extend` the abstract parent `User` class.
* **Polymorphism:** Child classes override abstract methods from the `User` class (e.g., `displayRoleDetails()`).
* **Encapsulation:** All model classes utilize strict data hiding with `private` fields and public getters/setters.
* **Composition/Aggregation:** Modeled relationships between Bookings, Payments, Users, and Itineraries.

---

## 💾 Data Persistence (File Handling)
**Strict Constraint Met: NO DATABASES WERE USED.**
* We engineered a centralized `FileHandler.java` utility class to manage all read/write operations securely using `try-catch` blocks.
* Data is stored in the `data/` directory using pipe-delimited (`|`) `.txt` files (e.g., `users.txt`).
* Collections (`ArrayList`) are utilized extensively in the controllers to read file data, modify states, and overwrite files.

---

## 💻 Tech Stack
* **Backend:** Java 17+, Spring Boot 3.x
* **Frontend:** JSP (JavaServer Pages), HTML5, Bootstrap 5 (No external stylesheets)
* **Build Tool:** Apache Maven

---

## 🚀 How to Run (For Grading Assessment)
1. **Clone the Repository:** `git clone [https://github.com/Reshan-Athalsha/Wedding-planner]`
2. **Compile the Project:** Run `mvn clean compile` in the terminal.
3. **Start the Server:** Run the `WeddingplannerApplication.java` main method.
4. **Access the Application:** Open your web browser and navigate to 👉 **http://localhost:8080/**