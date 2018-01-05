require_relative 'db_connection'
require 'active_support/inflector'
# NB: the attr_accessor we wrote in phase 0 is NOT used in the rest
# of this project. It was only a warm up.

class SQLObject
  def self.columns
    return @columns if @columns
    query = DBConnection.execute2(<<-SQL).first
      SELECT
        *
      FROM
        #{self.table_name}
    SQL
    column_names = query.map!(&:to_sym)
    @columns = column_names
  end

  def self.finalize!
    columns.each do |col|
      define_method(col) do
        self.attributes[col]
      end
      define_method("#{col}=") do |value|
        self.attributes[col] = value
      end
    end
  end

  def self.table_name=(table_name)
    # "#{self}".downcase + "s"
      @table_name = table_name
  end

  def self.table_name
    # method_name = self.to_s.tableize
    # if method_name.split('').last != 's'
    #   "#{self}".downcase + "s"
    # else
    #   method_name
    # end
     @table_name || self.name.underscore.pluralize
  end

  def self.all
    query = DBConnection.execute(<<-SQL)
      SELECT
        #{table_name}.*
      FROM
        #{table_name}
    SQL
   parse_all(query)
  end

  def self.parse_all(results)
    results.map { |hash| self.new(hash) }
  end

  def self.find(id)
    query = DBConnection.execute(<<-SQL, id)
      SELECT
        #{table_name}.id
      FROM
        #{table_name}
      WHERE
        #{table_name}.id = ?
    SQL
    return nil if query.empty?
    parse_all(query).first
  end

  def initialize(params = {})
    params.map do |k, v|
      if !self.class.columns.include?(k.to_sym)
        raise "unknown attribute '#{k}'"
      end
      self.send("#{k}=", v)
    end
  end

  def attributes
    @attributes ||= {}
  end

  def attribute_values
    self.class.columns.map { |attr| self.send(attr) }
  end

  def insert
    columns = self.class.columns.drop(1)
    col_names = columns.map(&:to_s).join(", ")
    question_marks = (["?"] * columns.count).join(", ")
    DBConnection.execute(<<-SQL, *attribute_values.drop(1))
      INSERT INTO
        #{self.class.table_name} (#{col_names})
      VALUES
        (#{question_marks})
    SQL
    self.id = DBConnection.last_insert_row_id
  end

  def update
    set_line = self.class.columns.map { |item| "#{item} = ?" }.join(",")
    DBConnection.execute(<<-SQL, *attribute_values, id)
      UPDATE
        #{self.class.table_name}
      SET
        #{set_line}
      WHERE
        #{self.class.table_name}.id = ?
    SQL
  end

  def save
    id.nil? ? self.insert : self.update
  end
end
