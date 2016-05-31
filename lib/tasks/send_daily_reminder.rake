desc "This task triggers sending of text notifications"
task :send_sms_notifications => :environment do
  run_send_sms_notifications
end

def run_send_sms_notifications
  raw_send_sms_notifications
end

def raw_send_sms_notifications
  if (Date.today.wday.in? (1..5))
    notifier = DailySmsNotifier.new
    notifier.send
  end
end
