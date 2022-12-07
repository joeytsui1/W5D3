require 'sqlite3'
require 'singleton'

class QuestionsDatabase < SQLite3::Database
    include Singleton
    def initialize

        super('questions.db')
        self.type_translation = true
        self.results_as_hash = true
    end

    def find_by_id
        
    end

end

class Questions

    def self.all
        data = QuestionsDBConnection.instance.execute("SELECT * FROM questions")
        data.map {|datum| Questions.new(datum)}
    end

    def initialize(option)
        @id = options['id']
        @title = options['title']
        @body = options['body']
        @author_id = options['author_id']
    end 
    
    def create
        raise "#{self} already in database" if @id
        QuestionsDBConnection.instance.execute(<<-SQL, @title, @body, @author_id)
            INSERT INTO 
                questions (title, body, author_id)
            VALUES
                (?, ?, ?)
        SQL
        @id = QuestionsDBConnection.instance.last_insert_row_id
    end
    def find_by_id

    end
end