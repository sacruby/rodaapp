require "roda"
require "json"
require_relative("models")

class Rodaapp < Roda

  plugin :static, ["/images", "/js", "/css"]
  plugin :render
  plugin :head

  route do |r|
    r.root do
      view("home")
    end
    r.get "about" do
      view("about")
    end
    r.get "data_test" do
      @data_points = DataPoint.test_data(10)
      view("data")
    end
    r.on "data" do
      r.get do
        @data_points = DataPoint.all.last(10)
        view("data")
      end

      r.post do
        v1_array = JSON.parse(r.body.read)
        d = DataPoint.new.from_v1_array(v1_array)
        DataPoint.store(d)

        "OK"
      end
    end
  end
end
