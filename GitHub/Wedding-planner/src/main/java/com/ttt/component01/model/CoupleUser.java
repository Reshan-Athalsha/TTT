package com.ttt.component01.model;

import jakarta.persistence.*;

/**
 * COMPONENT 01 — Couple/User Management
 * OOP: INHERITANCE · POLYMORPHISM · ENCAPSULATION
 * CoupleUser extends User with wedding-specific fields.
 */
@Entity
@Table(name = "clients")
public class CoupleUser extends User {

    @Column(name = "wedding_date") private String weddingDate;
    @Column private double budget;
    @Column(name = "guest_count") private int guestCount;
    @Column private String theme;

    public CoupleUser() { super(); this.setRole("COUPLE"); }

    public CoupleUser(String userId, String name, String email, String password) {
        super(userId, name, email, password, "COUPLE");
    }

    @Override
    public void displayRoleDetails() { // POLYMORPHISM
        System.out.println("Role: COUPLE — Planning their wedding with TTT.");
    }

    public String getWeddingDate()   { return weddingDate; }
    public void setWeddingDate(String v) { this.weddingDate = v; }
    public double getBudget()        { return budget; }
    public void setBudget(double v)  { this.budget = v; }
    public int getGuestCount()       { return guestCount; }
    public void setGuestCount(int v) { this.guestCount = v; }
    public String getTheme()         { return theme; }
    public void setTheme(String v)   { this.theme = v; }
}
