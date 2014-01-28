require "data_mapper"
require "dm-core"
require "dm-migrations"
require "dm-sqlite-adapter"
require "dm-timestamps"

# config = YAML.load_file(File.join(Dir.pwd,'config.yml'))

configure do
  DataMapper::setup(:default, File.join('sqlite3://', Dir.pwd, 'development.db'))
end

configure :development do
  DataMapper.finalize
  DataMapper.auto_upgrade!
end

class ContentBlock
  include DataMapper::Resource

  property :id, Serial
  property :content, Text
  property :created_at, DateTime
  property :updated_at, DateTime

end


get '/' do
  @title = 'Content Blocks'
  haml :index
end