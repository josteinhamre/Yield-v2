class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true


  def filter_by_month(collection, date, table_field_as_string)
    sql_query = " \
      #{table_field_as_string} >= ? \
      AND #{table_field_as_string} <= ? \
    "
    collection.where(sql_query, date.beginning_of_month, date.end_of_month)
  end


  def filter_to_month(collection, date, table_field_as_string)
    sql_query = "#{table_field_as_string} <= ?"
    collection.where(sql_query, date.end_of_month)
  end


end
