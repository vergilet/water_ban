require 'csv'

# ["Область", "Район", "Місто", "ІндексВПЗ", "Назва вулиці", "№ будинку"]

# ["Вінницька", "Барський", "Адамівка", "23091", "вул. Святкова", "1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26"]

class Roman
  attr_accessor :current_row, :rows, :current_address, :headers
  BATCH_SIZE = 500



  def execute
    rows = CSV.read('/Users/yaro/Downloads/houses.csv', encoding: 'Windows-1251', col_sep: ';', quote_char: "%");
    len = rows.length
    row_zero = rows.delete_at(0)
    self.headers = {}
    row_zero.each_with_index do |header, i|
      self.headers[header] = i
    end
    total = 0
    columns=[:country,:state,:district,:city,:index_number,:street_name,:street_number]
    rows.in_groups_of(BATCH_SIZE, false).each_with_index do |batch, batch_i|
      begin
        ActiveRecord::Base.transaction do
          batch.each_with_index do |row, i|
            news = []
            print "\r#{ i + batch_i * BATCH_SIZE }/#{ len } (#{total})"
            self.current_row = row

            numbers_field = field('№ будинку')

            if numbers_field
              numbers = numbers_field.split(',')
              numbers.each do |number|
                news << ['Ukraine'] + row[0..4] + [number]
              end
            else
              news << ['Ukraine'] + row[0..4] + [nil]
            end
            total += news.length
            WaterBan::Addresses::Address.import columns, news, vaidate: false
          end
        end
      rescue StandardError => e
        pp current_row
        raise e
      end
    end
  end


  def build_evaluation_score_items()
    inserts = []
    time = Time.now.to_s(:db)
    self.job.active_employees.each do |employee|
      inserts.push "(#{self.id}, #{employee.id}, '#{time}')"
    end
    sql = "INSERT INTO scores (evaluation_id, user_id, created_at) VALUES #{inserts.join(", ")}"
    ActiveRecord::Base.connection.execute(sql)
  end


  def field(name)
    field_index = headers[name]
    current_row[field_index]
  end
end

WaterBan::Addresses::Address.import