class Meeting < ApplicationRecord
  validates_presence_of :name, :date
  belongs_to :created_by, class_name: 'User'

  def self.upcoming
    where('date::date >= now()::date')
  end
end
