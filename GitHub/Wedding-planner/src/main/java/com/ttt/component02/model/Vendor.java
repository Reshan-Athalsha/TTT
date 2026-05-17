package com.ttt.component02.model;

import jakarta.persistence.*;
import com.ttt.shared.FileOperations;

/**
 * COMPONENT 02 — Vendor Management
 * OOP: ABSTRACTION · ENCAPSULATION · INHERITANCE
 * JPA: SINGLE_TABLE — 'category' is the discriminator, NOT a mapped @Column field.
 */
@Entity
@Table(name = "vendors")
@Inheritance(strategy = InheritanceType.SINGLE_TABLE)
@DiscriminatorColumn(name = "category", discriminatorType = DiscriminatorType.STRING)
public abstract class Vendor implements FileOperations {

    @Id @Column(name = "vendor_id", length = 50) private String vendorId;
    @Column(name = "business_name", nullable = false) private String businessName;
    @Column private String location;
    @Column private String description;
    @Column(name = "price_range") private String priceRange;
    @Column private double rating;

    public Vendor() {}
    public Vendor(String vendorId, String businessName, String location,
                  String description, String priceRange) {
        this.vendorId = vendorId; this.businessName = businessName;
        this.location = location; this.description = description;
        this.priceRange = priceRange; this.rating = 0.0;
    }

    /** ABSTRACTION: subclasses override with their own pricing formula */
    public abstract double calculatePricing(int units);

    /** Each subclass returns its category label (POLYMORPHISM) */
    public abstract String getCategory();

    @Override
    public String toFileString() {
        return vendorId+"|"+businessName+"|"+location+"|"+getCategory()+"|"+priceRange+"|"+rating;
    }

    public String getVendorId()      { return vendorId; }    public void setVendorId(String v)      { this.vendorId = v; }
    public String getBusinessName()  { return businessName; } public void setBusinessName(String v)  { this.businessName = v; }
    public String getLocation()      { return location; }    public void setLocation(String v)      { this.location = v; }
    public String getDescription()   { return description; } public void setDescription(String v)   { this.description = v; }
    public String getPriceRange()    { return priceRange; }  public void setPriceRange(String v)    { this.priceRange = v; }
    public double getRating()        { return rating; }      public void setRating(double v)        { this.rating = v; }
}
