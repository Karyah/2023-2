package br.com.fiap.mp.repositories;

import org.springframework.data.jpa.repository.JpaRepository;

import br.com.fiap.mp.model.Pedido;

public interface PedidoRepository extends JpaRepository<Pedido, Long>{

}
