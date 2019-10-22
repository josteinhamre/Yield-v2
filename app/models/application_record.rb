class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true


  def filter_by_date(collection, date, table_field_as_string, comparison_operator_as_string)
    sql_query = " \
      extract(month from #{table_field_as_string}) #{comparison_operator_as_string} ? \
      AND extract(year from #{table_field_as_string}) #{comparison_operator_as_string} ? \
    "
    collection.where(sql_query, date.month, date.year)
  end
end
