package com.ttt.component04.model;
import jakarta.persistence.*;
import com.ttt.shared.FileOperations;

/** COMPONENT 04 — Planning Tools | BudgetItem model */
@Entity @Table(name = "budget_items")
public class BudgetItem implements FileOperations {
    @Id @Column(name="item_id", length=50) private String itemId;
    @Column(nullable=false) private String category;   // VENUE, CATERING, FLOWERS etc.
    @Column(nullable=false) private String description;
    @Column private double estimated;
    @Column private double actual;

    public BudgetItem() {}
    public BudgetItem(String itemId, String category, String description, double estimated, double actual) {
        this.itemId=itemId; this.category=category; this.description=description;
        this.estimated=estimated; this.actual=actual;
    }
    @Override public String toFileString() { return itemId+"|"+category+"|"+description+"|"+estimated+"|"+actual; }

    public String getItemId()      { return itemId; }      public void setItemId(String v)      { this.itemId=v; }
    public String getCategory()    { return category; }    public void setCategory(String v)    { this.category=v; }
    public String getDescription() { return description; } public void setDescription(String v) { this.description=v; }
    public double getEstimated()   { return estimated; }   public void setEstimated(double v)   { this.estimated=v; }
    public double getActual()      { return actual; }      public void setActual(double v)      { this.actual=v; }
}
