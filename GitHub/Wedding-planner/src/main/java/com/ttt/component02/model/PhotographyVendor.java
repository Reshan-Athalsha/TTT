package com.ttt.component02.model;
import jakarta.persistence.*;

/** COMPONENT 02 — Photography Vendor | OOP: INHERITANCE · POLYMORPHISM */
@Entity @DiscriminatorValue("PHOTOGRAPHY")
public class PhotographyVendor extends Vendor {

    public PhotographyVendor() { super(); }
    public PhotographyVendor(String id, String name, String location, String desc, String price) {
        super(id, name, location, desc, price);
    }

    @Override public String getCategory() { return "PHOTOGRAPHY"; }

    @Override
    public double calculatePricing(int hours) { // POLYMORPHISM: premium per-hour rate × 1.2
        try { return Double.parseDouble(getPriceRange().replaceAll("[^0-9.]","")) * hours * 1.2; }
        catch (Exception e) { return 0; }
    }
}
