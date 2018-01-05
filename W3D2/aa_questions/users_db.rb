require 'sqlite3'
require 'singleton'
require_relative 'questions_db.rb'
require_relative 'replies_db.rb'

class QuestionDBConnection < SQLite3::Database
  include Singleton

  def initialize
    super('questions.db')
    self.type_translation = true
    self.results_as_hash  = true
  end

end

class Users
  attr_accessor :f_name, :l_name

  def self.all
    users = QuestionDBConnection.instance.execute("SELECT * FROM users")
    users.map { |user| Users.new(user) }
  end

  def self.find_by_name(f_name, l_name)
    users = QuestionDBConnection.instance.execute(<<-SQL, f_name, l_name)
      SELECT
        *
      FROM
        users
      WHERE
        f_name = ? AND l_name = ?
    SQL
    return nil if users.length < 0
    Users.new(users.first)
  end

  def initialize(options)
    @id = options['id']
    @f_name = options['f_name']
    @l_name = options['l_name']
  end

  def author_quesitons(user_id)
    Questions.find_by_author_id(user_id)
  end

  def author_replies(user_id)
    Replies.find_by_author_id(user_id)
  end


end
