package com.ttt.component03.model;

import jakarta.persistence.*;
import com.ttt.shared.FileOperations;

/** COMPONENT 03 — Booking & Payment | Model: Booking */
@Entity
@Table(name = "bookings")
public class Booking implements FileOperations {

    @Id @Column(name = "booking_id", length = 50) private String bookingId;
    @Column(name = "client_name", nullable = false) private String clientName;
    @Column(name = "vendor_name", nullable = false) private String vendorName;
    @Column(name = "event_date", nullable = false)  private String eventDate;
    @Column(nullable = false) private String status;
    @Column(name = "created_date", nullable = false) private String createdDate;

    public Booking() {}
    public Booking(String bookingId, String clientName, String vendorName,
                   String eventDate, String status, String createdDate) {
        this.bookingId = bookingId; this.clientName = clientName; this.vendorName = vendorName;
        this.eventDate = eventDate; this.status = status; this.createdDate = createdDate;
    }

    @Override
    public String toFileString() {
        return bookingId+"|"+clientName+"|"+vendorName+"|"+eventDate+"|"+status+"|"+createdDate;
    }

    public String getBookingId()   { return bookingId; }
    public void setBookingId(String b) { this.bookingId = b; }
    public String getClientName()  { return clientName; }
    public void setClientName(String c) { this.clientName = c; }
    public String getVendorName()  { return vendorName; }
    public void setVendorName(String v) { this.vendorName = v; }
    public String getEventDate()   { return eventDate; }
    public void setEventDate(String e) { this.eventDate = e; }
    public String getStatus()      { return status; }
    public void setStatus(String s) { this.status = s; }
    public String getCreatedDate() { return createdDate; }
    public void setCreatedDate(String d) { this.createdDate = d; }
}
