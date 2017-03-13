class Product < ApplicationRecord

  def buy
    self.stock -= 1
    self.save
  end

end
