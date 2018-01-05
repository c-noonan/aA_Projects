require 'sqlite3'
require 'singleton'


class QuestionDBConnection < SQLite3::Database
  include Singleton

  def initialize
    super('questions.db')
    self.type_translation = true
    self.results_as_hash  = true
  end

end

class Question_likes
  attr_accessor :user_id, :question_id

  def self.all
    users = QuestionDBConnection.instance.execute("SELECT * FROM question_likes")
    users.map { |user| Question_likes.new(user) }
  end

  def self.find_by_id(id)
    users = QuestionDBConnection.instance.execute(<<-SQL, id)
      SELECT
        *
      FROM
        question_likes
      WHERE
        id = ?
    SQL
    return nil if users.length < 0
    Question_likes.new(users.first)
  end

  def initialize(options)
    @id = options['id']
    @user_id = options['user_id']
    @question_id = options['question_id']
  end

end
