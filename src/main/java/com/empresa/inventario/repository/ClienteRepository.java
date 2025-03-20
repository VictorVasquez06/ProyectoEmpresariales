package com.empresa.inventario.repository;



import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.empresa.inventario.model.Cliente;

@Repository
public interface ClienteRepository extends JpaRepository<Cliente, Long> {}