# To deliver this notification:
#
# OrderNotification.with(post: @post).deliver_later(current_user)
# OrderNotification.with(post: @post).deliver(current_user)

class OrderNotification < Noticed::Base
  deliver_by :twilio

  def format_for_twilio
    {
      Body: params[:message],
      From: phone_number,
      To: recipient.phone_number
    }
  end

  def get_twilio_credentials
    {
      account_sid: account_sid,
      auth_token: auth_token,
      phone_number: phone_number,
    }
  end

  def account_sid
    ENV['TWILIO_ACCOUNT_SID']
  end

  def auth_token
    ENV['TWILIO_AUTH_TOKEN']
  end

  def phone_number
    ENV['TWILIO_PHONE_NUMBER']
  end
end
