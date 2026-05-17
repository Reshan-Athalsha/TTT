package com.ttt.component03.model;

import jakarta.persistence.*;
import com.ttt.shared.FileOperations;

/** COMPONENT 03 — Payment Management | OOP: ENCAPSULATION · COMPOSITION · INTERFACE */
@Entity
@Table(name = "payments")
public class Payment implements FileOperations {

    @Id @Column(name = "payment_id", length = 50) private String paymentId;
    @Column(name = "booking_id", nullable = false) private String bookingId; // COMPOSITION
    @Column(nullable = false) private double amount;
    @Column(name = "payment_method", nullable = false) private String paymentMethod;
    @Column(nullable = false) private String status;
    @Column(name = "payment_date", nullable = false) private String paymentDate;

    public Payment() {}
    public Payment(String paymentId, String bookingId, double amount,
                   String paymentMethod, String status, String paymentDate) {
        this.paymentId = paymentId; this.bookingId = bookingId; this.amount = amount;
        this.paymentMethod = paymentMethod; this.status = status; this.paymentDate = paymentDate;
    }

    @Override
    public String toFileString() {
        return paymentId+"|"+bookingId+"|"+amount+"|"+paymentMethod+"|"+status+"|"+paymentDate;
    }

    public String getPaymentId()     { return paymentId; }
    public void setPaymentId(String p) { this.paymentId = p; }
    public String getBookingId()     { return bookingId; }
    public void setBookingId(String b) { this.bookingId = b; }
    public double getAmount()        { return amount; }
    public void setAmount(double a)  { this.amount = a; }
    public String getPaymentMethod() { return paymentMethod; }
    public void setPaymentMethod(String m) { this.paymentMethod = m; }
    public String getStatus()        { return status; }
    public void setStatus(String s)  { this.status = s; }
    public String getPaymentDate()   { return paymentDate; }
    public void setPaymentDate(String d) { this.paymentDate = d; }
}
