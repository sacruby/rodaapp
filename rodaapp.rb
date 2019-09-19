require "roda"

class Rodaapp < Roda
  route do |r|
    r.root do
      "Step 1"
    end
  end
end
