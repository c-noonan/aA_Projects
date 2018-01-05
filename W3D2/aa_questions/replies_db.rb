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

class Replies

  attr_accessor :question_id, :parent_replies_id, :body, :user_id

  def self.all
    users = QuestionDBConnection.instance.execute("SELECT * FROM replies")
    users.map { |user| Replies.new(user) }
  end

  def self.find_by_author_id(id)
    users = QuestionDBConnection.instance.execute(<<-SQL, id)
      SELECT
        *
      FROM
        replies
      WHERE
        id = ?
    SQL
    return nil if users.length < 0
    Replies.new(users.first)
  end

  def self.find_by_question_id(question_id)
    raise "#{self} does not include #{question_id}" if !@question_id
    users = QuestionDBConnection.instance.execute(<<-SQL, question_id)
      SELECT
        *
      FROM
        replies
      WHERE
        question_id = ?
    SQL
    return nil if users.length < 0
    users.map { |user| Replies.new(user) }
  end

  def initialize(options)
    @id = options['id']
    @question_id = options['question_id']
    @parent_replies_id = options['parent_replies_id']
    @body = options['body']
    @user_id = options['user_id']
  end

  def author
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

  def question
    question = QuestionDBConnection.instance.execute(<<-SQL, question_id)
      SELECT
        title,
        body
      FROM
        questions
      WHERE
        id = ?
    SQL
    return nil if question.length < 0
    another_question = Questions.new(question.first)
    puts another_question.title
    puts
    puts another_question.body
    puts
  end

  def parent_reply
    question = QuestionDBConnection.instance.execute(<<-SQL, parent_replies_id)
      SELECT
        body
      FROM
        replies
      WHERE
        id = ?
    SQL
    return nil if question.length < 0
    another_question = Replies.new(question.first)
    puts another_question.body
  end

  def child_reply
    question = QuestionDBConnection.instance.execute(<<-SQL, @id)
      SELECT
        body
      FROM
        replies
      WHERE
        parent_replies_id = ?
    SQL
    return nil if question.length < 0
    another_question = Replies.new(question.first)
    puts another_question.body
  end
end
