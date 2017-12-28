class ProductGetter
  def initialize(report_type)
    @report_type = report_type
  end

  def self.report_type_query
    order_date = 'orders.order_placed_at'
    case @report_type
      when 'daily' then
        [", to_char(#{order_date},'YYYY-MM-DD') AS sold_by_day", ',sold_by_day']
      when 'weekly' then
        [", to_char(#{order_date},'YYYY-WW') AS sold_by_week", ',sold_by_week']
      when 'monthly' then
        [", to_char(#{order_date},'YYYY-MM') AS sold_by_month", ',sold_by_month']
      else
        ['', '']
    end
  end

  def self.product_columns
    column = "products.product_name,
              sum(order_details.qty_ordered) AS qty_purchased,
              product_units.unit
              "
  end

  def self.display_columns
    column = 'customers.id AS customer_id, customers.first_name AS first_name,
              categories.category_name AS category_name,
              sum(order_details.qty_ordered) AS number_purchased'
  end

end