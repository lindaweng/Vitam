class Account < ActiveRecord::Base

    
end

# API_URL = "https://api:b1020b1b345ae9d55b96e313b57f9960-1b65790d-b3629572@api.mailgun.net/v2/sandbox8fce2e7f6a154651b419cb7375733423.mailgun.org"

# def send(from, body)
#   RestClient.post API_URL+"/messages",
#       :sender => "Excited User <mailgun@sandbox8fce2e7f6a154651b419cb7375733423.mailgun.org>",
#       :from => "lindaweng4@gmail.com",
#       :to => "lindaweng4@gmail.com",
#       # :subject => "This is subject",
#       :text => body
#       # :html => "<b>HTML</b> version of the body!"
# end