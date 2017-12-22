class Customer < ActiveRecord
 has_many :orders, dependent: :destroy

end

