# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

c1 = Category.create(category_name: 'Bouquets') #1
c2 = Category.create(category_name: 'Electronics') #2
c3 = Category.create(category_name: 'Clothings') #3
c4 = Category.create(category_name: 'Shoes') #4
c5 = Category.create(category_name: 'Stationeries') #5
c6 = Category.create(category_name: 'Grocery') #6

u1 = ProductUnit.create(unit: 'oz') #1
u2 = ProductUnit.create(unit: 'lbs') #2
u3 = ProductUnit.create(unit: 'each') #3

p1 = Product.create(product_name: 'gift baskets',
                    description: 'baskets with multiple flowers and chocolates',
                    qty_in_stock: 50, product_unit_id: u3.id,
                    unit_price: 15, tax: 10, product_available: 'y') #1
p1.product_categories.create(category_id: c1.id)
p1.product_categories.create(category_id: c6.id)

p2 = Product.create(product_name: 'red flowers',
                    description: 'bunch of red flowers',
                    qty_in_stock: 64, product_unit_id: u3.id, unit_price: 15,
                    tax: 10, color: 'red', product_available: 'y') #2
p2.product_categories.create(category_id: c1.id)

p3 = Product.create(product_name: 'yellow flowers',
                    description: 'bunch of yellow flowers',
                    qty_in_stock: 44, product_unit_id: u3.id, unit_price: 15,
                    tax: 10, color: 'yellow', product_available: 'y') #3
p3.product_categories.create(category_id: c1.id)

p4 = Product.create(product_name: 'Avacado',
                    description: 'fresh produce',
                    weight_in_stock: 100,
                    product_unit_id: u2.id, unit_price: 15,
                    tax: 10, product_available: 'y') #4
p4.product_categories.create(category_id: c6.id)

p5 = Product.create(product_name: 'headphones',
                    description: 'skull candy headphones',
                    qty_in_stock: 20, product_unit_id: u3.id, unit_price: 50,
                    tax: 10, product_available: 'y') #5
p5.product_categories.create(category_id: c1.id)
p5.product_categories.create(category_id: c2.id)
p5.product_categories.create(category_id: c5.id)

p6 = Product.create(product_name: 'laptop',
                    description: 'Dell Inspiron laptop',
                    qty_in_stock: 15, product_unit_id: u3.id, unit_price: 200,
                    tax: 10, product_available: 'y') #6
p6.product_categories.create(category_id: c1.id)
p6.product_categories.create(category_id: c2.id)
p6.product_categories.create(category_id: c5.id)

cust = Customer.create(first_name: 'John', last_name: 'Mac', active: 'y', phone: 5103000213, email: 'xyz@abc.com', address: '2500 Carlos Boulevard', city: 'Orange', zip_code: 122332, state: 'CA', country: 'US') #1
ord = cust.orders.create(order_status: 'delivered',
                         total_price: 52.5, no_of_items: 2,
                         shipment_address: '4500 carlos St', shipment_city: 'Hayward',
                         shipment_state: 'CA', shipment_country: 'US',
                         order_placed_at: 1.year.ago, order_shipped_at: 1.year.ago,
                         order_delivered_at: 1.year.ago) #1

ord.order_details.create(product_id: p1.id, price: 15, qty_ordered: 1,
                         purchase_unit_price: 15, purchase_tax: 10)
ord.order_details.create(product_id: p4.id, price: 37.5, qty_ordered: 2.445,
                         purchase_unit_price: 15, purchase_tax: 10)

ord = cust.orders.create(order_status: 'waiting_for_delivery',
                         total_price: 166.5, no_of_items: 2,
                         shipment_address: '4500 carlos St', shipment_city: 'Hayward',
                         shipment_state: 'CA', shipment_country: 'US',
                         order_placed_at: 1.month.ago,
                         order_shipped_at: 17.day.ago)
ord.order_details.create(product_id: p3.id, price: 150, qty_ordered: 10,
                         purchase_unit_price: 15, purchase_tax: 10, color: p3.color)
ord.order_details.create(product_id: p4.id, price: 16.5, qty_ordered: 5.1,
                         purchase_unit_price: 15, purchase_tax: 10)

cust = Customer.create(first_name: 'ABC', last_name: 'Mac', active: 'y', phone: 5103000214, email: 'abc@abc.com', address: '2501 Carlos Boulevard', city: 'Orange', zip_code: 122332, state: 'CA', country: 'US')
ord = cust.orders.create(order_status: 'on_its_way', total_price: 60,
                         no_of_items: 3, shipment_address: '4500 carlos St',
                         shipment_city: 'Hayward', shipment_state: 'CA',
                         shipment_country: 'US', order_placed_at: 3.year.ago,
                         order_shipped_at: 3.year.ago, order_delivered_at: 3.year.ago)
ord.order_details.create(product_id: p1.id, price: 15, qty_ordered: 1,
                         purchase_unit_price: 15, purchase_tax: 10)
ord.order_details.create(product_id: p2.id, price: 30, qty_ordered: 2,
                         purchase_unit_price: 10, purchase_tax: 10, color: p2.color)
ord.order_details.create(product_id: p1.id, price: 15, qty_ordered: 1,
                         purchase_unit_price: 10, purchase_tax: 10)

cust = Customer.create(first_name: 'EFG', last_name: 'Mac', active: 'y', phone: 5103000215, email: 'efg@abc.com', address: '2502 Carlos Boulevard', city: 'Orange', zip_code: 122332, state: 'CA', country: 'US')
ord = cust.orders.create(order_status: 'waiting_for_delivery', total_price: 187.5,
                         no_of_items: 2, shipment_address: '4500 carlos St',
                         shipment_city: 'Hayward', shipment_state: 'CA',
                         shipment_country: 'US', order_placed_at: 20.day.ago)
ord.order_details.create(product_id: p4.id, price: 157.5, qty_ordered: 10,
                         purchase_unit_price: 15, purchase_tax: 10)
ord.order_details.create(product_id: p1.id, price: 30, qty_ordered: 2,
                         purchase_unit_price: 15, purchase_tax: 10)

cust = Customer.create(first_name: 'HIG', last_name: 'Mac', active: 'y', phone: 5103000217, email: 'hig@abc.com', address: '2503 Carlos Boulevard', city: 'Orange', zip_code: 122332, state: 'CA', country: 'US')
ord = cust.orders.create(order_status: 'on_its_way', total_price: 45,
                         no_of_items: 1, shipment_address: '4500 carlos St',
                         shipment_city: 'Hayward', shipment_state: 'CA',
                         shipment_country: 'US', order_placed_at: Date.yesterday,
                         order_shipped_at: Date.today)
ord.order_details.create(product_id: p1.id, price: 45, qty_ordered: 3,
                         purchase_unit_price: 15, purchase_tax: 10)

cust = Customer.create(first_name: 'KLM', last_name: 'Mac', active: 'y', phone: 5103000218, email: 'klm@abc.com', address: '2504 Carlos Boulevard', city: 'Orange', zip_code: 122332, state: 'CA', country: 'US')
ord = cust.orders.create(order_status: 'waiting_for_delivery', total_price: 45,
                         no_of_items: 1, shipment_address: '4500 carlos St',
                         shipment_city: 'Hayward', shipment_state: 'CA',
                         shipment_country: 'US', order_placed_at: Date.today)
ord.order_details.create(product_id: p1.id, price: 45, qty_ordered: 3,
                         purchase_unit_price: 15, purchase_tax: 10)

cust = Customer.create(first_name: 'Karthick', last_name: 'Mac', active: 'y', phone: 5103000219, email: 'klm@abc.com', address: '2504 Carlos Boulevard', city: 'Orange', zip_code: 122332, state: 'CA', country: 'US')
ord = cust.orders.create(order_status: 'delivered', total_price: 180, no_of_items: 3,
                         shipment_address: '2500 Mission St', shipment_city: 'Mission',
                         shipment_state: 'MN', shipment_country: 'US',
                         order_placed_at: Date.yesterday, order_shipped_at: Date.today,
                         order_delivered_at: Date.today)
ord.order_details.create(product_id: p1.id, price: 30, qty_ordered: 2,
                         purchase_unit_price: 15, purchase_tax: 10, purchase_discount: 10)
ord.order_details.create(product_id: p5.id, price: 50, qty_ordered: 1,
                         purchase_unit_price: 50, purchase_tax: 10, purchase_discount: 10)
ord.order_details.create(product_id: p6.id, price: 100, qty_ordered: 1,
                         purchase_unit_price: 100, purchase_tax: 10)


