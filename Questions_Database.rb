require 'sqlite3'
require 'singleton'

class QuestionsDatabase < SQLite3::Database
    include Singleton
    def initialize
        super('questions.db')
        self.type_translation = true
        self.results_as_hash = true
    end
end

class Questions

    def self.all
        data = QuestionsDatabase.instance.execute("SELECT * FROM questions")
        data.map {|datum| Questions.new(datum)}
    end

    def initialize(options)
        @id = options['id']
        @title = options['title']
        @body = options['body']
        @author_id = options['author_id']
    end 
    
    def create
        raise "#{self} already in database" if @id
        QuestionsDatabase.instance.execute(<<-SQL, @title, @body, @author_id)
            INSERT INTO 
                questions (title, body, author_id)
            VALUES
                (?, ?, ?)
        SQL
        @id = QuestionsDatabase.instance.last_insert_row_id
    end

    def update
        raise "#{self} not in database" unless @id
        QuestionsDatabase.instance.execute(<<-SQL, @title, @body, @author_id)
        UPDATE
            questions
        SET
            title = ?, body = ?, author_id = ? 
        WHERE
            id = ?
        SQL
    end

    def self.find_by_id(id) 
        id_instance = QuestionsDatabase.instance.execute(<<-SQL, id)
        SELECT
            *
        FROM 
            questions
        WHERE
            id = ?
        SQL
    end

    def self.find_by_author_id(author_id)
        author_id_instance = QuestionsDatabase.instance.execute (<<-SQL, author_id)
        SELECT
            *
        FROM 
            questions
        WHERE 
            author_id = ?
        SQL
    end
end

class Users
    def self.all
end