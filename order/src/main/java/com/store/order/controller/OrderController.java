package com.store.order.controller;

import com.store.order.domain.Order;
import com.store.order.service.OrderService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("api/order")
public class OrderController extends GenericController<Order>{
    public OrderController(OrderService service){ super(service); }

    @Autowired
    private OrderService orderService;

    @PostMapping
    public ResponseEntity<Void> create(@RequestBody Order order) {
        orderService.save(order);
        return ResponseEntity.ok().build();
    }

    @GetMapping
    public ResponseEntity<List<Order>> getAll() {
        return ResponseEntity.ok(orderService.getAll());
    }

    @GetMapping("/{id}")
    public ResponseEntity<Order> get(@PathVariable Long id, String noSuchElementException) {
        return ResponseEntity.ok(orderService.get(id, "Order not found"));
    }

    @DeleteMapping("/{id}")
    public ResponseEntity<Void> delete(@PathVariable Long id) {
        orderService.delete(id);
        return ResponseEntity.ok().build();
    }
}
