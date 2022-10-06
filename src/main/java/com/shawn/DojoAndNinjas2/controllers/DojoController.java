package com.shawn.DojoAndNinjas2.controllers;


import java.util.List;

import javax.validation.Valid;

import com.shawn.DojoAndNinjas2.models.Dojo;
import com.shawn.DojoAndNinjas2.services.DojoService;
import com.shawn.DojoAndNinjas2.services.NinjaService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;

@Controller
public class DojoController {

    @Autowired
    DojoService dojoService;

    @Autowired
    NinjaService ninjaService;

    @GetMapping("/")
    public String index() {
        return "redirect:/dojos/new";
    }

    @GetMapping("/dojos/new")
    public String newDojo(@ModelAttribute("dojo") Dojo dojo) {
        return "/views/newDojo.jsp";
    }

    @PostMapping("/dojos/new")
    public String createDojo(@Valid @ModelAttribute("dojo") Dojo dojo, BindingResult result) {
        if (result.hasErrors())
            return "/views/newDojo.jsp";
        else {
            dojoService.createDojo(dojo);
            return "redirect:/dashboard";
        }
    }

    @GetMapping("/dashboard")
    public String index(Model model) {
        List<Dojo> dojos = dojoService.allDojos();
        model.addAttribute("dojos", dojos);
        return "/views/dashboard.jsp";
    }

    @GetMapping("/dojos/{id}")
    public String show(@PathVariable("id") Long id, Model model) {
        Dojo dojo = dojoService.findDojo(id);
        model.addAttribute("dojo", dojo);
        return "/views/dojoShow.jsp";
    }


}