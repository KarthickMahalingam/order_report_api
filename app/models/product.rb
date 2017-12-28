class Product < ApplicationRecord
  has_many :product_categories, dependent: :destroy
  has_many :categories, through: :product_categories
  belongs_to :product_unit
  has_many :order_details
  enum order_status: {waiting_for_delivery: 0, on_its_way: 1, delivered: 2}

  scope :group_with_relations, lambda {
    group('customers.id,
           customers.first_name,
           categories.category_name,
           orders.order_placed_at')
  }

  scope :join_orders, lambda {
    joins('INNER JOIN orders orders on orders.id = order_details.order_id')
  }

  scope :join_customers, lambda {
    joins('INNER JOIN customers customers on
            customers.id = orders.customer_id')
  }

  scope :join_product_units, lambda {
    joins('INNER JOIN product_units product_units on
            product_units.id = products.product_unit_id')
  }

  scope :period_range, lambda  {
    joins("where orders.order_placed_at
            BETWEEN '#{@start_range.to_date}' and '#{@end_range.to_date}'")

  }

  def self.customer_report
    Product.customer_report_query.as_json(except: :id)
  end

  def product_getter(report_type)
    @product_getter = ProductGetter.new(report_type)
  end

  def self.product_wise_report(report_type)
    Product.product_wise_query(report_type)
           .as_json(except: :id)
  end

  def self.product_wise_query(report_type)
    report_type_query(report_type)
    Product.joins(:order_details)
           .join_orders
           .join_product_units
           .select(product_columns + @column)
           .group('products.product_name, product_units.unit' + @group_with_type)
  end

  def self.create_periodic_report(report_type, start_range, end_range)
    @start_range = start_range.to_date
    @end_range = end_range.to_date
    Product.periodic_report_query(report_type).as_json(except: :id)
  end

  def self.periodic_report_query(report_type)
    report_type_query(report_type)
    Product.joins(:order_details)
           .join_orders
           .join_product_units
           .period_range
           .select(product_columns + @column)
           .group('products.product_name, product_units.unit' + @group_with_type)
  end

  def self.product_summary_report
    Product.joins([ order_details: [ order: :customer ]])
        .joins(:categories)
        .joins(:product_units)
        .customer_columns
        .group('1,2,3')
        .order(1)
  end

  def self.product_by_period(report_type, start_range, end_range)
    Product.joins(:order_details)
           .join_orders
           .join_product_units
           .select(product_columns + @column)
           .group('products.product_name, product_units.unit' + @group_with_type)
  end
end

