package com.ttt.component01.repository;

import com.ttt.component01.model.CoupleUser;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

/** COMPONENT 01 — CoupleUserRepository */
@Repository
public interface CoupleUserRepository extends JpaRepository<CoupleUser, String> {
    CoupleUser findByEmail(String email);
}
