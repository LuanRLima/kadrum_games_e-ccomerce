INSERT INTO "order_item" (order_id, product_id)
SELECT o.id, 1-- (orderItem a ser inserido)
FROM "order" o
WHERE o.id = 1;