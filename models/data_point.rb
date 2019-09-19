class DataPoint
  attr_accessor :name, :timestamp, :status, :temp, :sg
  @@data_cache ||= []

  def from_v1_array(a)
    @name = a[0]
    @timestamp = a[1]
    @status = a[2]
    @temp = a[3]
    @sg = a[4]

    self
  end

  def self.all
    @@data_cache
  end

  def self.store(item)
    @@data_cache << item
  end

  def self.random(name, status = "OK")
    point = DataPoint.new
    point.name = name
    point.status = status
    point.timestamp = Time.now.to_i
    point.temp = rand(25.0) + 25.0
    point.sg = 1.0 + rand(10) / 100.0
    point
  end

  def self.test_data(count)
    @items = []
    1.upto(count) do
      @items << DataPoint.random("ferm1")
    end
    @items
  end

  def to_s
    "#{@name} @ #{@timestamp} is #{@status}"
  end
end
