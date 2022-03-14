require_relative './database_connection'

class Counter
  def count
    result = DatabaseConnection.query("SELECT * FROM counter WHERE id=1;")
    result[0]['count'].to_i
  end

  def last_update
    result = DatabaseConnection.query("SELECT * FROM counter WHERE id=1;")
    result[0]['time']
  end

  def increment
    read_count = count
    result = DatabaseConnection.query("UPDATE counter SET count = '#{read_count + 1}', time = '#{now}' WHERE id=1;")
  end
  
  def decrement
    read_count = count
    result = DatabaseConnection.query("UPDATE counter SET count = '#{read_count - 1}', time = '#{now}' WHERE id=1;")
  end
  
  def reset
    read_count = count
    result = DatabaseConnection.query("UPDATE counter SET count = 0, time = '#{now}' WHERE id=1;")
  end
  
  def self.instance
    @counter ||= Counter.new
  end

  private

  def now(time = Time.now)
    time
  end
end
