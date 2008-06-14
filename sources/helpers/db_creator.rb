require 'active_record'

ActiveRecord::Base.logger = Logger.new(STDERR)
ActiveRecord::Base.colorize_logging = false

class DBManager
  def self.init(filepath)
    if File.exists?(filepath) then
      File.delete(filepath)
    end
    ActiveRecord::Base.establish_connection(
      :adapter => "sqlite3",
      :database  => filepath
    )
    
    ActiveRecord::Schema.define do
      create_table :entries, :primary_key=> 'id' do |table|
          table.column :title, :string
          table.column :content, :string
          table.column :type,:string
          table.column :tags, :string
      end
    end
  end   
end

class Entry<ActiveRecord::Base
end


#DBManager.init("file.db")

#entry = Entry.new
#entry.title = "Test"
#entry.content= "Rss content stuff"
#entry.type = "RSS"
#entry.tags = "artificial intelligence"

#entry.save
