package com.ttt.component03.repository;

import com.ttt.component03.model.Booking;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

/** COMPONENT 03 — Booking & Payment | BookingRepository */
@Repository
public interface BookingRepository extends JpaRepository<Booking, String> {}
