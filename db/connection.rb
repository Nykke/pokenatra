ActiveRecord::Base.establish_connection(
:adaptor => 'postgresql',
:database => 'pokemon_db'
)

if defined? Sinatra
  after do
    ActiveRecord::Base.connection.close
  end
end 
