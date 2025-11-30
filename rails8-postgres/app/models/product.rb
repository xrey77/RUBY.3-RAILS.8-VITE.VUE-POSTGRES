class Product < ApplicationRecord
    scope :filter_by_name, ->(name) {
        where("descriptions LIKE ?", "%#{sanitize_sql_like(name)}%") if name.present?
      }    
end
