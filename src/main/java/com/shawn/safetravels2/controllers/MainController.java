package com.shawn.safetravels2.controllers;

import com.shawn.safetravels2.models.Expense;
import com.shawn.safetravels2.services.ExpenseService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;

import javax.validation.Valid;
import java.util.List;

@Controller
@RequestMapping("expenses")
public class MainController {

    @Autowired
    ExpenseService expenseService;

    @GetMapping("")
    public String index(@ModelAttribute("expense") Expense expense, Model model) {
        List<Expense> expenses = expenseService.allExpenses();
        model.addAttribute("expenses", expenses);
        return "index.jsp";
    }

    @PostMapping("add")
    public String create(
            @Valid @ModelAttribute("expense") Expense expense,
            BindingResult result, Model model)
    {
        if (result.hasErrors()) {
            List<Expense> expenses = expenseService.allExpenses();
            model.addAttribute("expenses", expenses);
            return "index.jsp";
        }
        expenseService.createExpense(expense);
        return "redirect:";
    }

    @GetMapping("edit/{id}")
    public String edit(@PathVariable("id") Long id, Model model) {
        Expense expense = expenseService.findExpense(id);
        model.addAttribute("expense", expense);
        return "edit.jsp";
    }

    @PutMapping("edit/{id}")
    public String update(@Valid @ModelAttribute("expense") Expense expense, BindingResult result) {
        if (result.hasErrors())
            return "edit.jsp";
        else {
            expenseService.updateExpense(expense);
            return "redirect:/expenses";
        }

    }

    @GetMapping("{id}")
    public String show(@PathVariable("id") Long id, Model model) {
        Expense expense = expenseService.findExpense(id);
        model.addAttribute("expense", expense);
        return "show.jsp";
    }

    @DeleteMapping("{id}")
    public String delete(@PathVariable("id") Long id) {
        expenseService.deleteExpense(id);
        return "redirect:/expenses";
    }

}
