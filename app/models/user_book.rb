class UserBook < ActiveRecord::Base
  belongs_to :user
  belongs_to :book

  def self.total_dowloads_30_days
    all.where(created_at: Date.today-30..Date.today).size
  end
end
