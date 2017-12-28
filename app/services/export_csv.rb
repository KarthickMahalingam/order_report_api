class ExportCsv
  def to_csv(result)
    header = %w[product_name qty_sold sold_on]
    CSV.generate do |csv|
      csv << header
      result.each do |product|
        csv << product.values
      end
    end
  end
end