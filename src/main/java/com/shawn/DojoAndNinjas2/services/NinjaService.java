package com.shawn.DojoAndNinjas2.services;


import java.util.List;
import java.util.Optional;

import com.shawn.DojoAndNinjas2.models.Ninja;
import com.shawn.DojoAndNinjas2.repositories.NinjaRepository;
import org.springframework.stereotype.Service;


@Service
public class NinjaService {

    private final NinjaRepository ninjaRepository;

    public NinjaService(NinjaRepository ninjaRepository) {
        this.ninjaRepository = ninjaRepository;
    }

    public List<Ninja> allNinjas() {
        return ninjaRepository.findAll();
    }

    public Ninja createNinja(Ninja n) {
        return ninjaRepository.save(n);
    }

    public Ninja findNinja(Long id) {
        Optional<Ninja> optionalNinja = ninjaRepository.findById(id);
        if(optionalNinja.isPresent()) {
            return optionalNinja.get();
        } else {
            return null;
        }
    }


}