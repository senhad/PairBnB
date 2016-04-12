class Reservation < ActiveRecord::Base
  validates :from, :to, presence: :true
  belongs_to :user
  belongs_to :listing
end
