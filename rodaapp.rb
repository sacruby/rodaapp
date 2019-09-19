require "roda"
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
    r.get "data" do
      @data_points = DataPoint.test_data(10)
      view("data")
    end
  end
end
