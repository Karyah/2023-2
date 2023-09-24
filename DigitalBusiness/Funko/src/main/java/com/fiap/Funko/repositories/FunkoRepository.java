package com.fiap.Funko.repositories;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import com.fiap.Funko.model.Funko;
import com.fiap.Funko.model.StatusFunko;

public interface FunkoRepository extends JpaRepository<Funko, Long>{
	List<Funko> findByStatus(StatusFunko status);
}
