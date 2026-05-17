package com.ttt.component03.repository;

import com.ttt.component03.model.Payment;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

/** COMPONENT 03 — PaymentRepository | Spring Data JPA */
@Repository
public interface PaymentRepository extends JpaRepository<Payment, String> {}
