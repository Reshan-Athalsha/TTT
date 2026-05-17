package com.ttt.component04.controller;

import com.ttt.component04.model.*;
import com.ttt.component04.repository.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import java.util.List;
import java.util.UUID;

/** COMPONENT 04 — Wedding Planning Tools Controller (Tasks, Budget, Guests) */
@Controller
@RequestMapping("/planning")
public class PlanningController {

    @Autowired private TaskRepository taskRepository;
    @Autowired private BudgetItemRepository budgetRepository;
    @Autowired private GuestRepository guestRepository;

    // ===== TASK / CHECKLIST =====
    @GetMapping("/checklist")
    public String viewChecklist(Model model) {
        List<Task> tasks = taskRepository.findAll();
        long done = tasks.stream().filter(Task::isCompleted).count();
        model.addAttribute("tasks", tasks);
        model.addAttribute("completedCount", done);
        model.addAttribute("totalCount", tasks.size());
        return "component04/checklist";
    }

    @PostMapping("/tasks/add")
    public String addTask(@RequestParam String title, @RequestParam String category,
                          @RequestParam String dueDate, @RequestParam String taskType) {
        String id = "TSK-" + UUID.randomUUID().toString().substring(0,5).toUpperCase();
        taskRepository.save(new Task(id, title, category, dueDate, taskType));
        return "redirect:/planning/checklist";
    }

    @GetMapping("/tasks/complete/{id}")
    public String completeTask(@PathVariable String id) {
        taskRepository.findById(id).ifPresent(t -> { t.setCompleted(!t.isCompleted()); taskRepository.save(t); });
        return "redirect:/planning/checklist";
    }

    @GetMapping("/tasks/delete/{id}")
    public String deleteTask(@PathVariable String id) {
        taskRepository.deleteById(id); return "redirect:/planning/checklist";
    }

    // ===== BUDGET =====
    @GetMapping("/budget")
    public String viewBudget(Model model) {
        List<BudgetItem> items = budgetRepository.findAll();
        double totalEstimated = items.stream().mapToDouble(BudgetItem::getEstimated).sum();
        double totalActual    = items.stream().mapToDouble(BudgetItem::getActual).sum();
        model.addAttribute("budgetItems", items);
        model.addAttribute("totalEstimated", totalEstimated);
        model.addAttribute("totalActual", totalActual);
        model.addAttribute("difference", totalEstimated - totalActual);
        return "component04/budget";
    }

    @PostMapping("/budget/add")
    public String addBudgetItem(@RequestParam String category, @RequestParam String description,
                                @RequestParam double estimated, @RequestParam double actual) {
        String id = "BDG-" + UUID.randomUUID().toString().substring(0,5).toUpperCase();
        budgetRepository.save(new BudgetItem(id, category, description, estimated, actual));
        return "redirect:/planning/budget";
    }

    @GetMapping("/budget/delete/{id}")
    public String deleteBudgetItem(@PathVariable String id) {
        budgetRepository.deleteById(id); return "redirect:/planning/budget";
    }

    // ===== GUEST LIST =====
    @GetMapping("/guests")
    public String viewGuests(Model model) {
        List<Guest> guests = guestRepository.findAll();
        long confirmed = guests.stream().filter(g -> "CONFIRMED".equals(g.getRsvpStatus())).count();
        long declined  = guests.stream().filter(g -> "DECLINED".equals(g.getRsvpStatus())).count();
        model.addAttribute("guests", guests);
        model.addAttribute("confirmedCount", confirmed);
        model.addAttribute("declinedCount", declined);
        return "component04/guestList";
    }

    @PostMapping("/guests/add")
    public String addGuest(@RequestParam String name, @RequestParam String email,
                           @RequestParam(defaultValue="0") int tableNumber,
                           @RequestParam(defaultValue="false") boolean plusOne) {
        String id = "GST-" + UUID.randomUUID().toString().substring(0,5).toUpperCase();
        guestRepository.save(new Guest(id, name, email, "PENDING", tableNumber, plusOne));
        return "redirect:/planning/guests";
    }

    @GetMapping("/guests/rsvp/{id}/{status}")
    public String updateRsvp(@PathVariable String id, @PathVariable String status) {
        guestRepository.findById(id).ifPresent(g -> { g.setRsvpStatus(status); guestRepository.save(g); });
        return "redirect:/planning/guests";
    }

    @GetMapping("/guests/delete/{id}")
    public String deleteGuest(@PathVariable String id) {
        guestRepository.deleteById(id); return "redirect:/planning/guests";
    }
}
