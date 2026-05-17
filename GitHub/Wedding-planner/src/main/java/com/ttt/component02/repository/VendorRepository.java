package com.ttt.component02.repository;

import com.ttt.component02.model.Vendor;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;
import java.util.List;

/** COMPONENT 02 — VendorRepository */
@Repository
public interface VendorRepository extends JpaRepository<Vendor, String> {

    /**
     * Filter by discriminator value (the DTYPE/category column).
     * Uses JPQL TYPE() function since 'category' is the discriminator, not a mapped field.
     */
    @Query("SELECT v FROM Vendor v WHERE TYPE(v) = :type")
    List<Vendor> findByVendorType(@Param("type") Class<?> type);
}
