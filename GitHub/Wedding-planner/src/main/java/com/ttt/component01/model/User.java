package com.ttt.component01.model;

import jakarta.persistence.*;
import com.ttt.shared.FileOperations;

/**
 * COMPONENT 01 — Couple/User Management
 * OOP: ABSTRACTION · ENCAPSULATION · INTERFACE
 */
@Entity
@Table(name = "users")
@Inheritance(strategy = InheritanceType.JOINED)
public abstract class User implements FileOperations {

    @Id @Column(name = "user_id", length = 50) private String userId;
    @Column(nullable = false) private String name;
    @Column(nullable = false, unique = true) private String email;
    @Column(nullable = false) private String password;
    @Column(nullable = false) private String role;

    public User() {}
    public User(String userId, String name, String email, String password, String role) {
        this.userId = userId; this.name = name; this.email = email;
        this.password = password; this.role = role;
    }

    public abstract void displayRoleDetails(); // ABSTRACTION

    @Override
    public String toFileString() {
        return userId+"|"+name+"|"+email+"|"+password+"|"+role;
    }

    public String getUserId()   { return userId; }   public void setUserId(String v)   { this.userId = v; }
    public String getName()     { return name; }     public void setName(String v)     { this.name = v; }
    public String getEmail()    { return email; }    public void setEmail(String v)    { this.email = v; }
    public String getPassword() { return password; } public void setPassword(String v) { this.password = v; }
    public String getRole()     { return role; }     public void setRole(String v)     { this.role = v; }
}
