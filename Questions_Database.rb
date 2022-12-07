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
    def initialize
        
    end

    def find_by_id

    end
end