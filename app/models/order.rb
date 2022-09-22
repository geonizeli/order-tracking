class Order < ApplicationRecord
  belongs_to :customer
  has_rich_text :description

  extend Enumerize
  enumerize :status, in: [:pending, :processing, :completed, :canceled], default: :pending

  validates :status, presence: true
  validates :public_id, presence: true, uniqueness: true

  after_commit :notify_status_update
  before_validation :set_public_id, on: :create

  def notify_status_update
    return unless previous_changes.has_key?(:status)

    OrderNotification.with(
      order: self,
      message: "Farmácia: o status do seu pedido foi atualizado para #{status_text}"
    ).deliver_later(customer)
  end

  def set_public_id
    self.public_id = SecureRandom.alphanumeric[0..5]
  end
end
