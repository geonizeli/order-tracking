class Customer < ApplicationRecord
  has_many :orders, dependent: :destroy

  validates :first_name, :last_name, presence: true

  def full_name
    "#{first_name} #{last_name}"
  end
end
