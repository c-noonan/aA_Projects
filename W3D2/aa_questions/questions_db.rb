require 'sqlite3'
require 'singleton'
require_relative 'users_db.rb'
require_relative 'replies_db.rb'

class QuestionDBConnection < SQLite3::Database
  include Singleton

  def initialize
    super('questions.db')
    self.type_translation = true
    self.results_as_hash  = true
  end

end

class Questions
  attr_accessor :title, :body, :user_id

  def self.all
    users = QuestionDBConnection.instance.execute("SELECT * FROM questions")
    users.map { |user| Questions.new(user) }
  end

  def self.find_by_author_id(user_id)
    questions = QuestionDBConnection.instance.execute(<<-SQL, user_id)
      SELECT
        *
      FROM
        questions
      WHERE
        user_id = ?
    SQL
    return nil if questions.length < 0
    questions.map { |user| Questions.new(user) }
  end

  def initialize(options)
    @id = options['id']
    @title = options['title']
    @body = options['body']
    @user_id = options['user_id']
  end

  def author(user_id)
    users = QuestionDBConnection.instance.execute(<<-SQL, user_id)
      SELECT
        f_name,
        l_name
      FROM
        users
      WHERE
        id = ?
    SQL
    return nil if users.length < 0
    name = Users.new(users.first)
    name.f_name + ' ' + name.l_name
  end

  def replies(user_id)
    Replies.find_by_author_id(user_id)
  end
end
