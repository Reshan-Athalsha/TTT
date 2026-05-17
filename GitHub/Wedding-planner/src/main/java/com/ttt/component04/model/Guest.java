package com.ttt.component04.model;
import jakarta.persistence.*;
import com.ttt.shared.FileOperations;

/** COMPONENT 04 — Planning Tools | Guest model */
@Entity @Table(name = "guests")
public class Guest implements FileOperations {
    @Id @Column(name="guest_id", length=50) private String guestId;
    @Column(nullable=false) private String name;
    @Column private String email;
    @Column(name="rsvp_status") private String rsvpStatus; // PENDING, CONFIRMED, DECLINED
    @Column(name="table_number") private int tableNumber;
    @Column(name="plus_one") private boolean plusOne;

    public Guest() {}
    public Guest(String guestId, String name, String email, String rsvpStatus, int tableNumber, boolean plusOne) {
        this.guestId=guestId; this.name=name; this.email=email;
        this.rsvpStatus=rsvpStatus; this.tableNumber=tableNumber; this.plusOne=plusOne;
    }
    @Override public String toFileString() { return guestId+"|"+name+"|"+email+"|"+rsvpStatus+"|"+tableNumber; }

    public String getGuestId()     { return guestId; }    public void setGuestId(String v)     { this.guestId=v; }
    public String getName()        { return name; }       public void setName(String v)        { this.name=v; }
    public String getEmail()       { return email; }      public void setEmail(String v)       { this.email=v; }
    public String getRsvpStatus()  { return rsvpStatus; } public void setRsvpStatus(String v)  { this.rsvpStatus=v; }
    public int getTableNumber()    { return tableNumber; } public void setTableNumber(int v)    { this.tableNumber=v; }
    public boolean isPlusOne()     { return plusOne; }    public void setPlusOne(boolean v)    { this.plusOne=v; }
}
