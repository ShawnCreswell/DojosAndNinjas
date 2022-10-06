package com.shawn.DojoAndNinjas2.repositories;


import java.util.List;

import com.shawn.DojoAndNinjas2.models.Ninja;
import org.springframework.data.repository.CrudRepository;


public interface NinjaRepository extends CrudRepository<Ninja, Long> {
    List<Ninja> findAll();
}