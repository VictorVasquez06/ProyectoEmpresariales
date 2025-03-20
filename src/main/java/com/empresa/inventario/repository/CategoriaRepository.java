package com.empresa.inventario.repository;



import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.empresa.inventario.model.Categoria;

@Repository
public interface CategoriaRepository extends JpaRepository<Categoria, Long> {}