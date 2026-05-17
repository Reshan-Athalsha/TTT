package com.ttt.component05.model;
import jakarta.persistence.*;

/** COMPONENT 05 — VerifiedReview (Inheritance from Review) */
@Entity @DiscriminatorValue("VERIFIED")
public class VerifiedReview extends Review {

    public VerifiedReview() { super(); }

    public VerifiedReview(String id, String vendorId, String userName, int rating, String comment, String date) {
        super(id, vendorId, userName, rating, comment, date);
    }

    @Override public boolean canEdit() { return true; }       // POLYMORPHISM
    @Override public String getReviewType() { return "VERIFIED"; }
}
