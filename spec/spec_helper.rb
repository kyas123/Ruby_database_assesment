require 'line'
require 'station'
require 'pg'

DB = PG.connect ({:dbname => "test_train"})


RSpec.configure do |toss|
  toss.before(:each) do
    DB.exec("DELETE FROM lines *;")
    DB.exec("DELETE FROM stations *;")
    # DB.exec("DELETE FROM stops *;")
  end
end
