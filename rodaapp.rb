require "roda"

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
      @data_points = [{}]
      view("data")
    end
  end
end
