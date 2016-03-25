require_relative 'db_connection'
require_relative '01_sql_object'

module Searchable
  def where(params)
    where_str = params.map {|k,v| "#{k} = '#{v}'"}.join(" AND ")
    results = DBConnection.execute(<<-SQL)
      SELECT
        *
      FROM
        #{table_name}
      WHERE
        #{where_str}
    SQL

    parse_all(results)
  end
end

class SQLObject
  # Mixin Searchable here...
  extend Searchable
end
