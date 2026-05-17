package com.ttt.component04.model;
import jakarta.persistence.*;
import com.ttt.shared.FileOperations;

/** COMPONENT 04 — Planning Tools | Task model (Checklist) */
@Entity @Table(name = "tasks")
public class Task implements FileOperations {
    @Id @Column(name="task_id", length=50) private String taskId;
    @Column(nullable=false) private String title;
    @Column private String category;    // CEREMONY, RECEPTION, VENDOR, DIY
    @Column(name="due_date") private String dueDate;
    @Column private boolean completed;
    @Column(name="task_type") private String taskType; // POLYMORPHISM demo

    public Task() {}
    public Task(String taskId, String title, String category, String dueDate, String taskType) {
        this.taskId=taskId; this.title=title; this.category=category;
        this.dueDate=dueDate; this.completed=false; this.taskType=taskType;
    }
    @Override public String toFileString() { return taskId+"|"+title+"|"+category+"|"+dueDate+"|"+completed; }

    public String getTaskId()    { return taskId; }    public void setTaskId(String v)    { this.taskId=v; }
    public String getTitle()     { return title; }     public void setTitle(String v)     { this.title=v; }
    public String getCategory()  { return category; }  public void setCategory(String v)  { this.category=v; }
    public String getDueDate()   { return dueDate; }   public void setDueDate(String v)   { this.dueDate=v; }
    public boolean isCompleted() { return completed; } public void setCompleted(boolean v){ this.completed=v; }
    public String getTaskType()  { return taskType; }  public void setTaskType(String v)  { this.taskType=v; }
}
