class Order < ApplicationRecord
  extend Enumerize

  belongs_to :customer

  enumerize :status, in: [:pending, :processing, :completed, :canceled], default: :pending

  validates :status, presence: true

  has_rich_text :description

  after_commit :notify_status_update

  def notify_status_update
    return unless previous_changes.has_key?(:status)

    OrderNotification.with(
      order: self,
      message: "Farmácia: o status do seu pedido foi atualizado para #{status_text}"
    ).deliver_later(customer)
  end
end
