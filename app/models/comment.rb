class Comment < ActiveRecord::Base
  belongs_to :expense
  belongs_to :category
end
