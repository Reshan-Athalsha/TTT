package com.ttt.component05.model;
import jakarta.persistence.*;

/** COMPONENT 05 — PublicReview (Inheritance from Review) */
@Entity @DiscriminatorValue("PUBLIC")
public class PublicReview extends Review {

    public PublicReview() { super(); }

    public PublicReview(String id, String vendorId, String userName, int rating, String comment, String date) {
        super(id, vendorId, userName, rating, comment, date);
    }

    @Override public boolean canEdit() { return false; }      // POLYMORPHISM
    @Override public String getReviewType() { return "PUBLIC"; }
}
