class DailySmsNotifier
  include TwilioTools
  include TeamgridTools

  def send
    User.find_each do |u|
      twilio_client.messages.create(
        from: "+14232004096",
        to: u.phone_number,
        body: message(u)
      )
    end
  end

  def message(user)
    "Hello, #{user.name}! This week, you have tracked #{get_hours(user)} hour(s)."
  end

private

  def get_hours(user)
    get_hours_for_user(user)
  end

end
