require 'active_record'

#todo: make it work with relative paths
#todo: make it work with different databases
#todo: refactor the usage

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
          table.column :ctype,:string  #this will be predefined: rss, mail, cl;
          table.column :tags, :string
          table.column :added_at, :timestamp, :default => Time.now
          table.column :served, :boolean, :default => false  #if the data had been served or not'
          table.column :served_at, :timestamp #the date on which the data had been served
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
