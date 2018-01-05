require 'sqlite3'
require 'singleton'
require_relative 'users_db.rb'

class QuestionDBConnection < SQLite3::Database
  include Singleton

  def initialize
    super('questions.db')
    self.type_translation = true
    self.results_as_hash  = true
  end

end

class Question_follows
  attr_accessor :user_id, :question_id

  def self.followers_for_question_id(question_id)
    users = QuestionDBConnection.instance.execute(<<-SQL, question_id)
      SELECT
        f_name, l_name
      FROM
        users
      JOIN
        question_follows ON question_follows.user_id = users.id
      WHERE
        question_id = ?
    SQL
    return nil if users.length < 0
      users.map { |user| Users.new(user) }

  end

  def self.all
    users = QuestionDBConnection.instance.execute("SELECT * FROM question_follows")
    users.map { |user| Question_follows.new(user) }
  end

  def self.find_by_id(id)
    users = QuestionDBConnection.instance.execute(<<-SQL, id)
      SELECT
        *
      FROM
        question_follows
      WHERE
        id = ?
    SQL
    return nil if users.length < 0
    Users.new(users.first)
  end

  def initialize(options)
    @id = options['id']
    @user_id = options['user_id']
    @question_id = options['question_id']
  end

end
