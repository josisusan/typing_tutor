require "data_mapper"
require "dm-core"
require "dm-migrations"
require "dm-sqlite-adapter"
require "dm-timestamps"
# require "pry"

# config = YAML.load_file(File.join(Dir.pwd,'config.yml'))

configure do
  DataMapper::setup(:default, File.join('sqlite3://', Dir.pwd, 'development.db'))
  # DataMapper::setup(:default, 'sqlite3:///home/susan/ruby/typing_tutor/development.db')
end

class ContentBlock
  include DataMapper::Resource

  property :id, Serial
  property :content, Text
  property :created_at, DateTime
  property :updated_at, DateTime

  def self.random_content
    all.sample
  end
end

# ContentBlock.auto_migrate!

configure :development do
  DataMapper.finalize
  DataMapper.auto_upgrade!
end

get '/' do
  @title = 'Content Blocks'
  @content = ContentBlock.random_content
  haml :index
end

get '/add_content' do
  haml :add_content_form
end

post '/add_content' do
  content_block = ContentBlock.new(params)
  if content_block.save
    @message = "sahi"
  else
    @message = "Not good"
  end
  haml :add_content_create
end