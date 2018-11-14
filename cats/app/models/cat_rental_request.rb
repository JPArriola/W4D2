# == Schema Information
#
# Table name: cat_rental_requests
#
#  id         :bigint(8)        not null, primary key
#  cat_id     :integer          not null
#  start_date :date             not null
#  end_date   :date             not null
#  status     :string           default("PENDING")
#  created_at :datetime         not null
#  updated_at :datetime         not null
#



class CatRentalRequest < ApplicationRecord
  STATUS = [
    'APPROVED',
    'DENIED',
    'PENDING'
  ]
  validates :cat_id, :start_date, :end_date, presence: true 
  validate :overlapping_requests
  
  validates :status, 
    presence: true, 
    inclusion: STATUS
  
  belongs_to :cat, 
    foreign_key: :cat_id,
    class_name: :Cat
  
  def overlapping_requests 
    CatRentalRequest.where.not('start_date > ? OR end_date < ?', self.end_date, self.start_date)
      .where(cat_id: self.cat_id)
  end 
  
  def overlapping_approved_requests
    
  end 
end
