class Pokemon < ActiveRecord::Base
  has_many dependent: :destory 
end
