package com.ttt.component05.model;
import jakarta.persistence.*;
import com.ttt.shared.FileOperations;

/**
 * COMPONENT 05 — Reviews & Ratings
 * OOP: ABSTRACTION (abstract class), INHERITANCE (VerifiedReview, PublicReview)
 * JPA: SINGLE_TABLE with @DiscriminatorColumn — 'review_type' handled by JPA, NOT a field.
 */
@Entity @Table(name = "reviews")
@Inheritance(strategy = InheritanceType.SINGLE_TABLE)
@DiscriminatorColumn(name = "review_type", discriminatorType = DiscriminatorType.STRING)
public abstract class Review implements FileOperations {

    @Id @Column(name="review_id", length=50) private String reviewId;
    @Column(name="vendor_id") private String vendorId;
    @Column(name="user_name") private String userName;
    @Column(nullable=false) private int rating;
    @Column(nullable=false) private String comment;
    @Column(name="review_date") private String reviewDate;
    @Column private String status;

    public Review() {}
    public Review(String reviewId, String vendorId, String userName,
                  int rating, String comment, String reviewDate) {
        this.reviewId=reviewId; this.vendorId=vendorId; this.userName=userName;
        this.rating=rating; this.comment=comment; this.reviewDate=reviewDate;
        this.status="PUBLISHED";
    }

    public abstract boolean canEdit();         // ABSTRACTION
    public abstract String getReviewType();    // Each subclass returns its own type label

    @Override public String toFileString() {
        return reviewId+"|"+vendorId+"|"+userName+"|"+rating+"|"+comment+"|"+reviewDate;
    }

    public String getReviewId()   { return reviewId; }    public void setReviewId(String v)   { this.reviewId=v; }
    public String getVendorId()   { return vendorId; }    public void setVendorId(String v)   { this.vendorId=v; }
    public String getUserName()   { return userName; }    public void setUserName(String v)   { this.userName=v; }
    public int getRating()        { return rating; }      public void setRating(int v)        { this.rating=v; }
    public String getComment()    { return comment; }     public void setComment(String v)    { this.comment=v; }
    public String getReviewDate() { return reviewDate; }  public void setReviewDate(String v) { this.reviewDate=v; }
    public String getStatus()     { return status; }      public void setStatus(String v)     { this.status=v; }
}
