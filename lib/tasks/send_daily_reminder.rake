desc "This task triggers sending of text notifications"
task :send_sms_notifications => :environment do
  run_send_sms_notifications
end

def run_send_sms_notifications
  raw_send_sms_notifications
end

def raw_send_sms_notifications
  notifier = DailySmsNotifier.new
  notifier.send
end
