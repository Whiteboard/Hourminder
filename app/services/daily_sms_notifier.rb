class DailySmsNotifier
  include TwilioTools
  include TeamgridTools

  def send
    User.find_each do |u|
      if preferences_allow_text_for(user)
        twilio_client.messages.create(
          from: "+14232004096",
          to: u.phone_number,
          body: message(u)
        )
      end
    end
  end

  def message(user)
    
  end

private

  def preferences_allow_text_for?(user)
    user.prefers_texts_for_weekday?(Date.today.wday)
    && (user.text_delivery_hour == Time.now.hour)
  end

  def get_hours(user)
    get_hours_for_user(user).round(1)
  end

end
