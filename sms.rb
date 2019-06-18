require 'twilio-ruby'
require 'rubygems'

def send(mess)
    account_sid = "AC001fa2018c867b34ad9665e125fab42c" # Your Account SID from www.twilio.com/console
    auth_token = "799572835ccb8246bb88de81f29df726"   # Your Auth Token from www.twilio.com/console
    @client = Twilio::REST::Client.new(account_sid, auth_token)
    puts "hi2"
    # next
    message = @client.messages.create(
        from: '+12485715560',
        to: '+12485715560',
        body: "hungry pizza"
    )
    puts message.body
end

send("hi")