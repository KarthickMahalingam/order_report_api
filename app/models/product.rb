class Product < ApplicationRecord
  has_many :product_categories, dependent: :destroy
  has_many :categories, through: :product_categories
  belongs_to :product_unit
  has_many :order_details
  enum order_status: {waiting_for_delivery: 0, on_its_way: 1, delivered: 2}

  def self.validate_date_range
    return false if @start_range > @end_range
    true
  end

  def self.product_display_fields
    "products.product_name,
     sum(order_details.qty_ordered) AS qty_purchased,
     product_units.unit"
  end

  def self.product_summary_report(report_type, start_range, end_range)
    if start_range.present? && end_range.present?
      @start_range = start_range.to_date
      @end_range = end_range.to_date
      summary_with_date_range(report_type)
    else
      product_summary_query(report_type)
    end
  end

  def self.summary_with_date_range(report_type)
    if validate_date_range
      product_summary_query(report_type)
      @result.where("#{@order_date} BETWEEN '#{@start_range}' and '#{@end_range}' ")
    else
      'Error: Invalid parameters.please check the url parameters'
    end
  end

  def self.product_summary_query(report_type)
    select_period, group_by_period = report_type_query(report_type)
    @result = Product.joins([ order_details: [ order: :customer ]])
                  .joins(:categories)
                  .joins(:product_unit)
                  .select(product_display_fields + select_period )
                  .group("products.product_name,product_units.unit #{group_by_period}")
                  .order(1)
  end

  def self.report_type_query(report_type)
    @order_date = 'orders.order_placed_at'
    case report_type
      when 'daily' then
        [", to_char(#{@order_date},'YYYY-MM-DD') AS sold_by_day", ',sold_by_day']
      when 'weekly' then
        [", to_char(#{@order_date},'YYYY-WW') AS sold_by_week", ',sold_by_week']
      when 'monthly' then
        [", to_char(#{@order_date},'YYYY-MM') AS sold_by_month", ',sold_by_month']
      else
        ['', '']
    end
  end
end

