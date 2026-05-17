package com.ttt.component04.repository;
import com.ttt.component04.model.Guest;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import java.util.List;

@Repository
public interface GuestRepository extends JpaRepository<Guest, String> {
    List<Guest> findByRsvpStatus(String rsvpStatus);
}
