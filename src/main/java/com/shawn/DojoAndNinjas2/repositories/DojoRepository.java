package com.shawn.DojoAndNinjas2.repositories;

import java.util.List;

import com.shawn.DojoAndNinjas2.models.Dojo;
import org.springframework.data.repository.CrudRepository;


public interface DojoRepository extends CrudRepository<Dojo, Long>{
    List<Dojo> findAll();
}