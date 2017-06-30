namespace :addresses do
  desc 'Fills addresses with data'

  task fill: :environment do |_t, _args|
    roman = Roman.new
    roman.execute
  end
end