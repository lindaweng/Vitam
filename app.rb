# https://github.com/shannonjen/sinatra_crud_tutorial
# https://www.postgresql.org/docs/current/static/app-psql.html
# https://www.postgresql.org/docs/9.1/static/tutorial-select.html
# http://www.postgresqltutorial.com/postgresql-update/
# Profile pic how to https://www.w3schools.com/css/tryit.asp?filename=trycss_css_image_overlay_opacity

# Account.words is [[email words], [personalized words]]
# email words = [[greetings], [questions], [questions2], [closing], [signature]]
# heroku connect database
# heroku config:set DATABASE_URL=   --app
# COLORS:
# Orange-Red: FF7233
# Orange-Yellow: FFCE38
# Red: FF4E48
# Orange: FF9603
# Yellow: FCEF00

require 'rubygems'
require 'bundler'
Bundler.require
require "sinatra"
require "./models.rb"
require "./modelsFeedback.rb"
# require "./send.rb"
# require "./production.rb"
# require 'twilio-ruby'
# require 'rubygems'

class MyApp < Sinatra::Base
    
    # API_URL = "https://api:b1020b1b345ae9d55b96e313b57f9960-1b65790d-b3629572@api.mailgun.net/v2/sandbox8fce2e7f6a154651b419cb7375733423.mailgun.org"
    
    def send(from, to, body)
      RestClient.post "https://api:key-d0ce530eb372221e03d9b36af7575f92@api.mailgun.net/v2/sandbox8fce2e7f6a154651b419cb7375733423.mailgun.org/messages",
          :sender => "Excited User <mailgun@sandbox8fce2e7f6a154651b419cb7375733423.mailgun.org>",
          :from => from,
          :to => to,
          :subject => "Message From Vitamin See",
          :text => body
          # :html => "<b>HTML</b> version of the body!"
    end
    
    get '/' do
        erb :index1
    end
    
    get '/landing' do
        @message = "Message: "
        erb :landing
    end
    
    get '/landingChinese' do
        @message = "Message: "
        erb :landingChinese
    end
    
    get '/yesNo/:id' do
        @id = params[:id]
        @userAccount = Account.find(@id)
        @userAccount.update(level: "1")
        @message = ""
        erb :yesNo
    end
    
    get '/picBoard/:id' do
        @id = params[:id]
        @userAccount = Account.find(@id)
        @userAccount.update(level: "2")
        @message = ""
        erb :picBoard
    end
    
    get '/personalWords/:id' do
        @id = params[:id]
        @userAccount = Account.find(@id)
        @userAccount.update(level: "3")
        @words = @userAccount.personalWords
        @message = ""
        erb :personalWords
    end
    
    get '/email/:id' do
        @id = params[:id]
        @userAccount = Account.find(@id)
        @name = @userAccount.name
        @contacts = @userAccount.contacts
        @userAccount.update(level: "4")
        @emailWords = @userAccount.emailWords
        @message = ""
        erb :email
    end
    
    get '/account/:id' do
        @id = params[:id]
        @userAccount = Account.find(@id)
        @name = @userAccount.name
        @password = @userAccount.password
        @email = @userAccount.email
        @level = @userAccount.level
        @contacts = @userAccount.contacts
        @words = @userAccount.personalWords
        erb :account
    end
    
    post '/send' do
        @id = params[:id]
        @userAccount = Account.find(@id)
        @from = @userAccount.email
        @to = params[:toEmail]
        @body = params[:message]
        @body = @body.split("<br>").join("
")
        send(@from, @to, @body)
        erb :sent
    end
    
    post '/editTable' do
        @id = params[:id]
        @tableName = params[:tableName]
        @tableNum = params[:tableNum].to_i
        @box0 = params[:box0]
        @box1 = params[:box1]
        @box2 = params[:box2]
        @box3 = params[:box3]
        @box4 = params[:box4]
        @box5 = params[:box5]
        puts params[:replace]
        puts params[:add]
        @newTable = [@box0, @box1, @box2, @box3, @box4, @box5]
        @userAccount = Account.find(@id)
        @emailWords = @userAccount.emailWords
        @editTable = @emailWords[@tableNum]
        if params[:add] == nil
            @newTable.each_with_index do |box, i|
                if box != "" and box != nil
                    # if box.include?
                        @editTable[i] = box
                    # end
                end
            end
            @userAccount.update(emailWords: @emailWords)
        else
            @userAccount.update(emailWords: @emailWords.insert(@tableNum + 1, @newTable))
        end
        @name = @userAccount.name
        @contacts = @userAccount.contacts
        @emailWords = @userAccount.emailWords
        @message = params[:message]
        erb :email
    end
    
    post '/login' do #executes at /login
        @email = params[:email]
        @password = params[:password]
        count = 0
        @accounts = Account.all
        @accounts.each do |account| #checks all accounts for match
            if account.email == @email and account.password == @password
                @id = account.id
                puts @id
                count += 1
            end
        end
        if count == 0
                @output = "Wrong username or password."
                erb :index1
        else
            @userAccount = Account.find(@id)
            
            # @greetings = ["Hi", "Hello", "Hey", "Dear", "Good Morning", "Good Afternoon"]
            # @questions = ["Thank you for your email.", "It was nice to hear from you.", "How are you doing?", "I’m doing well.", "Not much is new.", ""]
            # @questions2 = ["How are you?", "How have you been?", "What’s new with you?", "How are things going at work?", "How is your family?", ""]
            # @closing = ["Can’t wait to see you!", "Looking forward to seeing you soon!", "Hope to see you soon!", "Talk to you soon.", "Take care.", "I miss you."]
            # @signature = ["From", "Sincerely", "Best", "Thanks", "Love", "Cheers"]
            # @emailWords = @greetings, @questions, @questions2, @closing, @signature
            # @userAccount.update(emailWords: @emailWords)
            
            @name = @userAccount.name
            @email = @userAccount.email
            @number = @userAccount.phoneNumber.split("-").join("")
            @level = @userAccount.level
            @password = @userAccount.password
            @id = @userAccount.id
            @contacts = @userAccount.contacts
            @words = @userAccount.personalWords
            erb :account
        end
    end
    
    post '/create_account' do
        # find if the email has already been used for an account
        @email = params[:email]
        @accounts = Account.all
        count = 0
        @accounts.each do |account|
            if account.email == @email
                count += 1
            end
        end
        if count != 0
            @output = "That email already has an account. Please use a different email."
            erb :sign_up
        end
        @name = params[:name].split(" ").collect{|x| x.capitalize}.join(" ")
        @greetings = ["Hi", "Hello", "Hey", "Dear", "Good Morning", "Good Afternoon"]
        @questions = ["Thank you for your email.", "It was nice to hear from you.", "How are you doing?", "I’m doing well.", "Not much is new.", ""]
        @questions2 = ["How are you?", "How have you been?", "What’s new with you?", "How are things going at work?", "How is your family?", ""]
        @closing = ["Can’t wait to see you!", "Looking forward to seeing you soon!", "Hope to see you soon!", "Talk to you soon.", "Take care.", "I miss you."]
        @signature = ["From", "Sincerely", "Best", "Thanks", "Love", "Cheers"]
        @emailWords = @greetings, @questions, @questions2, @closing, @signature
        @userAccount = Account.create(name: @name, phoneNumber: params[:phone], email: params[:email], password: params[:password], emailWords: @emailWords)
        @id = @userAccount.id
        @number = params[:phone].split("-").join("")
        @name = params[:name]
        @email = params[:email]
        @password = params[:password]
        @level = @userAccount.level
        @contacts = @userAccount.contacts
        @words = @userAccount.personalWords
        erb :account
    end 
    
    post '/add-contact' do
        @id = params[:id]
        @contactName = params[:name].split(" ").collect{|x| x.capitalize}.join(" ")
        @contactEmail = params[:email]
        @contactPhone = params[:phone]
        @contact = [@contactName, @contactEmail, @contactPhone]
        @userAccount = Account.find(@id)
        @contacts = @userAccount.contacts
        @userAccount.update(contacts: @contacts.push(@contact))
        @name = @userAccount.name
        @email = @userAccount.email
        @level = @userAccount.level
        @password = @userAccount.password
        @id = @userAccount.id
        @contacts = @userAccount.contacts
        @words = @userAccount.personalWords
        erb :account
    end
    
    post '/add-word' do
        @id = params[:id]
        @newWord = params[:word].capitalize
        @userAccount = Account.find(@id)
        @words = @userAccount.personalWords
        @userAccount.update(personalWords: @words.push(@newWord))
        @name = @userAccount.name
        @email = @userAccount.email
        @level = @userAccount.level
        @password = @userAccount.password
        @id = @userAccount.id
        @contacts = @userAccount.contacts
        @words = @userAccount.personalWords
        erb :account
    end
    
    post '/sent' do
        @message = params["message"].to_s
        # @message = @message[8..-1]
        # puts @message
        # send(@message)
        
        # @reciepient = "(831) 578-7881"
        # @message = message.sid
        erb :sent
    end
    
    get '/help' do
        @message = "Message: help"
        erb :sent
    end
    # post '/twil' do
    #   number = params['From']
    #   body = params['Body']
    
    #   content_type 'text/xml'
    #   "<Response>
    #      <Message>
    #       Hello #{number}. You said: #{body}
    #      </Message>
    #   </Response>"
    # end



end