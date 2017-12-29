/*
SQL query to return the results as display below:
customer_id | customer_first_name | category_id | category_name | number_purchased
1           | John                | 1           | Bouquets      | 15
*/
SELECT
  customers.id            AS customer_id,
  customers.first_name    AS customer_first_name,
  categories.id            AS category_id,
  categories.category_name AS category_name,
  sum(order_details.qty_ordered)
FROM customers customers,
  categories categories,
  orders orders,
  products products,
  product_categories product_categories,
  order_details order_details
WHERE orders.customer_id = customers.id
      AND order_details.order_id = orders.id
      and order_details.product_id = products.id
      AND products.id = order_details.product_id
      AND products.id = product_categories.product_id
      AND categories.id = product_categories.category_id
      AND order_details.product_id = product_categories.product_id
GROUP BY customers.id,
  customers.first_name,
  categories.id,
  categories.category_name
ORDER BY 1;
