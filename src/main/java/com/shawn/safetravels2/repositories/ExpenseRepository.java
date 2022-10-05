package com.shawn.safetravels2.repositories;

import com.shawn.safetravels2.models.Expense;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface ExpenseRepository extends CrudRepository<Expense, Long> {
    List<Expense> findAll();
    // this method finds books with descriptions containing the search string
    List<Expense> findByDescriptionContaining(String search);
    // this method counts how many titles contain a certain string
    Long countByVendorContaining(String search);
    // this method deletes a book that starts with a specific title
    Long deleteByVendorStartingWith(String search);
}
