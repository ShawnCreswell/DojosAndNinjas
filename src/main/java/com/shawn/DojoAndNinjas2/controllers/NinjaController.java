package com.shawn.DojoAndNinjas2.controllers;

import java.util.List;

import javax.validation.Valid;

import com.shawn.DojoAndNinjas2.models.Dojo;
import com.shawn.DojoAndNinjas2.models.Ninja;
import com.shawn.DojoAndNinjas2.services.DojoService;
import com.shawn.DojoAndNinjas2.services.NinjaService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

@Controller
public class NinjaController {

    @Autowired
    DojoService dojoService;

    @Autowired
    NinjaService ninjaService;

    @GetMapping("/ninjas/new")
    public String newNinja(@ModelAttribute("ninja") Ninja ninja, Model model) {
        List<Dojo> allDojos = dojoService.allDojos();
        model.addAttribute("dojos", allDojos);
        return "/views/newNinja.jsp";
    }

    @PostMapping("/ninjas/new")
    public String createNinja(@Valid @ModelAttribute("ninja") Ninja ninja, BindingResult result) {
        if (result.hasErrors())
            return "/views/newNinja.jsp";
        else {
            ninjaService.createNinja(ninja);
            return "redirect:/dashboard";
        }
    }

}
