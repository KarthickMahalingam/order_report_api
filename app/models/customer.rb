class Customer < ApplicationRecord
  has_many :orders, dependent: :destroy

  scope :customer_display_fields, lambda {
    select(['customers.id AS customer_id,
            customers.first_name AS customer_first_name,
            categories.id AS category_id,
            categories.category_name AS category_name,
            sum(order_details.qty_ordered) AS number_purchased'])
  }

  scope :with_group_by, lambda {
    group('customers.id,
           customers.first_name,
           categories.id,
           categories.category_name')
  }

  def self.generate_customer_order_report(customer_id)
    Customer.joins(orders: :order_details).select('customers.id,
                                                   customers.first_name,
                                                   customers.last_name,
                                                   order_details.product_id,
                                                   orders.total_price,
                                                   orders.order_status,
                                                   orders.order_placed_at,
                                                   order_details.qty_ordered,
                                                   order_details.price,
                                                   order_details.purchase_unit_price')
  end

  def self.generate_customers_order_report
    Customer.customer_purchase_query.as_json(except: :id)
  end

  def self.customer_purchase_query
    Customer.joins(orders: [order_details: [product: :categories]])
            .with_group_by
            .customer_display_fields
  end
end

