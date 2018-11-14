# == Schema Information
#
# Table name: cats
#
#  id          :bigint(8)        not null, primary key
#  birth_date  :date             not null
#  color       :string           not null
#  name        :string           not null
#  sex         :string(1)        not null
#  description :text             not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Cat < ApplicationRecord
  CAT_COLORS = [
    "yellow",
    "orange",
    "black",
    "white",
    "brown"
  ]
  
  validates :birth_date, :name, :sex, :description, presence: true
  validates :color, 
    presence: true, 
    inclusion: CAT_COLORS
    
  has_many :requests,
    foreign_key: :cat_id,
    class_name: :CatRentalRequest,
    dependent: :destroy
end
