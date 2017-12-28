SELECT
  o.id,
  o.customer_id,
  o.total_price,
  o.no_of_items,
  od.product_id,
  cat.category_name,
  od.order_id,
  od.id AS ORDER_DETAIL_ID,
  od.qty_ordered,
  od.price,
  od.purchase_unit_price
FROM orders o,
  order_details od,
  categories cat,
  product_categories h
WHERE o.id = od.order_id
      AND h.product_id = od.product_id
      AND h.category_id = cat.id
ORDER BY order_id;


SELECT
  customer.id            AS customer_id,
  customer.first_name    AS customer_first_name,
  category.category_name AS category_name,
  sum(order_detail.qty_ordered)
FROM customers customer,
  categories category,
  orders ord,
  products prd,
  product_categories prd_category,
  order_details order_detail
WHERE ord.customer_id = customer.id
      AND order_detail.order_id = ord.id
      and order_detail.product_id = prd.id
      AND prd.id = order_detail.product_id
      AND prd.id = prd_category.product_id
      AND category.id = prd_category.category_id
      AND order_detail.product_id = prd_category.product_id
GROUP BY customer.id,
  customer.first_name,
  category.category_name
ORDER BY 1         ;




select o.customer_id, o.id, o.no_of_items,
       od.order_id, od.product_id, od.price,
       od.qty_ordered,c.category_name
from orders o, order_details od,categories c,
     products s, product_categories pc
where o.id = od.order_id
and pc.product_id=od.product_id
and s.id = pc.product_id
and s.id = od.product_id
and c.id=pc.category_id
order by 4;

SELECT p.product_name, sum(od.qty_ordered), date_trunc('day', ord.order_placed_at)
FROM orders ord,
  order_details od,
  products p
WHERE ord.id = od.order_id
      AND od.product_id = p.id
GROUP BY product_name, ord.order_placed_at
ORDER by 1

Product.joins(:categories).joins(:order_details).joins('INNER JOIN orders ord on order_details.order_id = ord.id').joins('INNER JOIN customers c on c.id = ord.customer_id').select("c.id, c.first_name, categories.category_name, sum(order_details.qty_ordered),").group("c.id,c.first_name, categories.category_name ")