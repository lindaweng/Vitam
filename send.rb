require 'rest-client'
require 'mailgun_rails'



# def send_simple_message()
#   RestClient.post "https://api:574bb3b18b5214b892126eea6a7ca083-1b65790d-5288d95a@api.mailgun.net/v3/sandbox8fce2e7f6a154651b419cb7375733423.mailgun.org/messages",
#   :sender => "Excited User <mailgun@sandbox8fce2e7f6a154651b419cb7375733423.mailgun.org>",
#   :to => "lindaweng4@gmail.com",
#   :subject => "Hello",
#   :text => "Testing some Mailgun awesomness!"
# end


# API_KEY = ENV['b1020b1b345ae9d55b96e313b57f9960-1b65790d-b3629572']
# API_URL = "https://api:#{API_KEY}@api.mailgun.net/v2/sandbox8fce2e7f6a154651b419cb7375733423.mailgun.org"

# RestClient.post API_URL+"/messages",
# API_KEY = ENV['b1020b1b345ae9d55b96e313b57f9960-1b65790d-b3629572']

API_URL = "https://api:b1020b1b345ae9d55b96e313b57f9960-1b65790d-b3629572@api.mailgun.net/v2/sandbox8fce2e7f6a154651b419cb7375733423.mailgun.org"

def send()
  RestClient.post API_URL+"/messages",
      :sender => "Excited User <mailgun@sandbox8fce2e7f6a154651b419cb7375733423.mailgun.org>",
      :from => "lindaweng4@gmail.com",
      :to => "lindaweng4@gmail.com",
      # :subject => "This is subject",
      :text => "hi"
      # :html => "<b>HTML</b> version of the body!"
end
send()