# https://github.com/shannonjen/sinatra_crud_tutorial
# https://www.postgresql.org/docs/current/static/app-psql.html
# https://www.postgresql.org/docs/9.1/static/tutorial-select.html
# http://www.postgresqltutorial.com/postgresql-update/
# Profile pic how to https://www.w3schools.com/css/tryit.asp?filename=trycss_css_image_overlay_opacity

# email words = [[greetings], [questions], [questions2], [closing], [signature]]
# personal words are for the messaging template: [box1 word, box1 pic, box2 word, box2 pic]
# heroku connect database
# heroku config:set DATABASE_URL=   --app
# COLORS:
# Orange-Red: FF7233
# Orange-Yellow: FFCE38
# Red: FF4E48
# Orange: FF9603
# Yellow: FCEF00

# NEW COLORS:
# Orange: FF9900
# Green: 75FB78
# Blue: 8EE0FF

# id |       name        | phoneNumber  |          email          |  password   | level |                                                                                                                                                                                                                                                                                                                                                   emailWords                                                                                                                                                                                                                                                                                                                                                    |                                                               contacts                                                                | personalWords | creditCard | address |         created_at         |         updated_at  
# 4 | Kania Kennedy     | 3136226742   | Kaniakennedy@gmail.com  | 1976diva    | 4     | {{Hi,Hello,Hey,Dear,"Good Morning","Good Afternoon"},{"Thank you f
# or your email.","It was nice to hear from you.","How are you doing?","I’m doing well.","Not much is new.",""},{"How are you?","How have you been?","What’s 
# new with you?","How are things going at work?","How is your family?","I’ve been very busy lately."},{"Can’t wait to see you!","Looking forward to seeing yo
# u soon!","Hope to see you soon!","Talk to you soon.","Take care.","I miss you."},{From,Sincerely,Best,Thanks,Love,Cheers}}                                 
                                                                                                                                                           
#   | {{"Maxwell Weng",MAXWELLLWENG@GMAIL.com,2488855075}}                                                                                  | {}            |
#  {}         | {}      | 2019-02-21 17:22:07.101974 | 2019-02-21 17:23:11.807654
#   3 | Maxwell Weng      | 2488855075   | mweng@umich.edu         | Chemistry17 | 4     | {{"It’s cold outside.",Hello,Hey,Dear,"Good Morning","Good Afterno
# on"},{"Thank you for your email.","It was nice to hear from you.","How are you doing?","I’m doing well.","Not much is new.",""},{"Are you sleeping?","How a
# re classes?","Do you like your professors?","I am proud of you.","I love you.",NULL},{"When will I see you?","How are the kids?","","","",NULL},{"How are y
# ou?","How have you been?","What’s new with you?","How are things going at work?","How is your family?","I’ve been very busy lately."},{"Can’t wait to see y
# ou!","Looking forward to seeing you soon!","Hope to see you soon!","Talk to you soon.","Take care.","I miss you."},{From,Sincerely,Best,Thanks,Love,Cheers}
# } | {{"Maxwell Weng",maxwelllweng@gmail.com,2488855075},{"Elise Jones",jelise@umich.edu,5743096878},{Maxwell,mweng@umich.edu,2488855075}} | {}            |
#  {}         | {}      | 2019-02-21 13:57:36.403985 | 2019-05-21 01:54:27.526291
#   6 | Carol Ann Walter  | 2488727252   | asoberbird@yahoo.com    | Bopca091527 | 4     | {{Hi,Hello,Hey,Dear,"Good Morning","Good Afternoon"},{"Thank you f
# or your email.","It was nice to hear from you.","How are you doing?","I’m doing well.","Not much is new.",""},{"How are you?","How have you been?","What’s 
# new with you?","How are things going at work?","How is your family?","I’ve been very busy lately."},{"Can’t wait to see you!","Looking forward to seeing yo
# u soon!","Hope to see you soon!","Talk to you soon.","Take care.","I miss you."},{From,Sincerely,Best,Thanks,Love,Cheers}}                                 
                                                                                                                                                           
#   | {{"Maxwell Weng",maxwelllweng@gmail.com,2488855075}}                                                                                  | {}            |
#  {}         | {}      | 2019-02-21 17:45:35.197764 | 2019-02-21 17:46:13.343541
#  5 | Annelies          | 6083354141   | aptaylor44              | annelies    | 4     | {{Hi,Hello,Hey,Dear,"Good Morning","Good Afternoon"},{"Thank you for your email.","It was nice to hear from you.","How are you doing?","I’m doing well.","Not much is new.",""},{"How are you?","How have you been?","What’s new with you?","How are things going at work?","How is your family?","I’ve been very busy lately."},{"Can’t wait to see you!","Looking forward to seeing you soon!","Hope to see you soon!","Talk to you soon.","Take care.","I miss you."},{From,Sincerely,Best,Thanks,Love,Cheers}}                                                                                                                                                                                              | {{Maxwell,Maxwelllweng@gmail.com,2488855075},{"Maxwell Weng",maxwelllweng@gmail.com,2488855075}}                                      | {}            | {}         | {}      | 2019-02-21 17:24:17.65353  | 2019-02-21 17:34:51.903219
#  7 | Jonathan Freedman | 7342553222   | zoid@umich.edu          | tomba       | 4     | {{Hi,Hello,Hey,Dear,"Good Morning","Good Afternoon"},{"Thank you for your email.","It was nice to hear from you.","How are you doing?","I’m doing well.","Not much is new.",""},{"How are you?","How have you been?","What’s new with you?","How are things going at work?","How is your family?",""},{"How is Ben and Miriam?","Looking forward to seeing you soon!","Hope to see you soon!","Talk to you soon.","Take care.","I miss you."},{From,Sincerely,Best,Thanks,Love,Cheers}}                                                                                                                                                                                                                         | {{"Sara Blair",sblair@umich.edu,7342553222},{"Sara Blair",sbblair@umich.edu,7342553222}}                                              | {}            | {}         | {}      | 2019-02-24 20:58:14.517526 | 2019-02-24 21:09:05.365074
#  1 | Linda Weng        | 248-571-5560 | lindaweng4@gmail.com    | vitaminsee  | 4     | {{"Hey Yall!",Heyyyyy!!!!,Hey,Dear,"Good Morning","Good Afternoon"},{"Thank you for your email.","It was nice to hear from you.","How are you doing?","I’m doing well.","Not much is new.",""},{"How are you?","How have you been?","What’s new with you?","How are things going at work?","How is your family?","I’ve been very busy lately."},{"Happy Birthday!!!","Check out Vitamin See!","There is a cool new update, just in time for your birthday!","","",NULL},{"Can’t wait to see you!","Looking forward to seeing you soon!","Hope to see you soon!","Have an awesome day!","Sent from Vitamin See.","I miss you."},{From,Sincerely,Best,Thanks,Love,Cheers}}                                        | {{"Maxwell Weng",maxwelllweng@gmail.com,248-885-5075},{"Min Weng",minweng@yahoo.com,123-456-7890}}                                    | {Meatloaf}    | {}         | {}      | 2019-02-21 01:39:47.051352 | 2019-04-02 12:54:40.257506
#  2 | Maxwell Weng      | 2488855075   | maxwelllweng@gmail.com  | Chemistry17 | 4     | {{Hi,Hello,Hey,Dear,"Good Morning","Good Afternoon"},{"Thank you for your email.","It was nice to hear from you.","How are you doing?","I’m doing well.","Not much is new.",""},{"I am proud of you.","I love you.","I am excited for March Madness!","Go Blue!","Have you made your bracket?",NULL},{"How are you?","How have you been?","What’s new with you?","How are things going at work?","How is your family?","I’ve been very busy lately."},{"Can’t wait to see you!","Looking forward to seeing you soon!","Hope to see you soon!","Talk to you soon.","Take care.","I miss you."},{From,Sincerely,Best,Thanks,Love,Cheers}}                                                                         | {{"Maxwell Weng",maxwelllweng@gmail.com,2488855075}}                                                                                  | {}            | {}         | {}      | 2019-02-21 13:54:46.139668 | 2019-03-08 18:02:33.370251
#  8 | Min Weng          | 123-456-7890 | minweng@yahoo.com       | vitaminsee  | 4     | {{Hi,Hello,Hey,Dear,"Good Morning","Good Afternoon"},{"Thank you for your email.","It was nice to hear from you.","How are you doing?","I’m doing well.","Not much is new.",""},{"How are you?","How have you been?","What’s new with you?","How are things going at work?","How is your family?",""},{"Can’t wait to see you!","Looking forward to seeing you soon!","Hope to see you soon!","Talk to you soon.","Take care.","I miss you."},{From,Sincerely,Best,Thanks,Love,Cheers}}                                                                                                                                                                                                                         | {{"Linda Weng",lindaweng4@gmail.com,123-456-7890}}                                                                                    | {}            | {}         | {}      | 2019-04-02 12:39:08.093608 | 2019-04-02 12:39:28.451493


require 'rubygems'
require 'bundler'
Bundler.require
require "sinatra"
require 'pony'
require 'mail'
require "./models.rb"
require "./modelsFeedback.rb"
require "./modelsPersonalWords.rb"
require "./upload.rb"
require "./encode.rb"
# require "./send.rb"
# require "./production.rb"

class MyApp < Sinatra::Base    
    get '/' do
        erb :index1
    end
    
    get '/about' do
        erb :about
    end

    get '/support' do
        erb :support
    end

    get '/mask' do
        erb :mask
    end

    post '/mail/contact.php' do
        name = params[:name]
        email = params[:email]
        phone = params[:phone]
        message = params[:message]
        if name == nil or email == nil or phone == nil or message == nil
            puts "Missing Parameters"
        else
            to = 'vitam.connect@gmail.com'
            email_subject = "Website Contact Form:  #{name}"
            email_body = "You have received a new message from your website contact form.\n\nHere are the details:\n\nName: #{name}\n\nEmail: #{email}\n\nPhone: #{phone}\n\nMessage:\n#{message}"
            from = "noreply@yourdomain.com"
            reply_to = email;
            Pony.mail(:to => to, :from => from, :subject => email_subject, :body => email_body, :reply_to => reply_to, :via => :sendmail)
            mail = Mail.new do
                to 'vitam.connect@gmail.com'
                from 'noreply@yourdomain.com'
                subject '#{email_subject}'
                body '#{email_body}'
            end
            mail.delivery_method :sendmail
            mail.deliver
            puts "Sent"
        end
        # system('php public/mail/contact.php name email');
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
        if @id == "tutorial"
            @userAccount = Account.where(email: "vitam.connect@gmail.com").take
            @id = @userAccount.id
            @tut = 1
        else
            @userAccount = Account.find(@id)
        end
        @userAccount.update(level: "3")
        @message = ""
        @contacts = @userAccount.contacts
        @rows = PersonalWords.where(user: @id)
        @ids = []
        @rows.each do |word|
            @ids.push(word.id)
        end
        if @ids == []
            @output = "*Please add at least one word or image before using the message template.*"
            @name = @userAccount.name
            @password = @userAccount.password
            @email = @userAccount.email
            @level = @userAccount.level
            @contacts = @userAccount.contacts
            erb :account
        else
            @ids.sort!
            @words = []
            @ids.each do |id|
                @row = PersonalWords.find(id)
                @words.push(@row.word)
                @words.push(@row.image)
            end
            erb :messageTemplate
        end
    end
    
    get '/email/:id' do
        @id = params[:id]
        @userAccount = Account.find(@id)
        @name = @userAccount.name
        @contacts = @userAccount.contacts
        if @contacts == []
            @output = "*Please add at least one contact before using the email template. Your contacts will be used to select who to address the email to .*"
            @name = @userAccount.name
            @password = @userAccount.password
            @email = @userAccount.email
            @level = @userAccount.level
            @contacts = @userAccount.contacts
            @words = @userAccount.personalWords
            erb :account
        else
            @userAccount.update(level: "4")
            @emailWords = @userAccount.emailWords
            @message = ""
            erb :email
        end
    end
    
    get '/account/:id' do
        @id = params[:id]
        @userAccount = Account.find(@id)
        @name = @userAccount.name
        @password = @userAccount.password
        @email = @userAccount.email
        @level = @userAccount.level
        @contacts = @userAccount.contacts
        @rows = PersonalWords.where(user: @id)
        @ids = []
        @rows.each do |word|
            @ids.push(word.id)
        end
        @ids.sort!
        @words = []
        @imgs = []
        @ids.each do |id|
            @row = PersonalWords.find(id)
            @words.push(@row.word)
            @imgs.push(@row.image)
        end
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
    
    # for email template
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

    # for message template
    post '/editTableWords' do
        @id = params[:id]
        if params[:back] != nil
            @userAccount = Account.find(@id)
            @name = @userAccount.name
            @contacts = @userAccount.contacts
            @message = params[:message]
            @rows = PersonalWords.where(user: @id)
            @ids = []
            @rows.each do |word|
                @ids.push(word.id)
            end
            @ids.sort!
            @words = []
            @ids.each do |id|
                @row = PersonalWords.find(id)
                @words.push(@row.word)
                @words.push(@row.image)
            end
            erb :messageTemplate
        else
            @tableNum = params[:tableNum].to_i
            @box0 = params[:box0]
            @box1 = params[:box1]
            @box2 = params[:box2]
            @box3 = params[:box3]
            @box4 = params[:box4]
            @box5 = params[:box5]
            @box6 = params[:box6]
            @box7 = params[:box7]
            @newWords = [@box0, @box1, @box2, @box3, @box4, @box5, @box6, @box7]
            # for word in @newWords
            #     if word != nil
            #         single = word.index('\'')
            #         double = word.index('\"')
            #         while single != nil
            #             word = word[0...single] + "\\" + word[single..-1]
            #             single = word.index('\'', single+2)
            #         end
            #         while double != nil
            #             word = word[0...double] + "\\" + word[double..-1]
            #             double = word.index('\'', double+2)
            #         end
            #     end
            # end
            @photo0 = params[:photo0]
            @photo1 = params[:photo1]
            @photo2 = params[:photo2]
            @photo3 = params[:photo3]
            @photo4 = params[:photo4]
            @photo5 = params[:photo5]
            @photo6 = params[:photo6]
            @photo7 = params[:photo7]
            @files = [@photo0, @photo1, @photo2, @photo3, @photo4, @photo5, @photo6, @photo7]
            @urls = []
            @files.each do |file|
                if file != nil
                    @file2 = file["tempfile"]
                    @file2 = @file2.path()
                    @url = upload(@file2)
                    @urls.push(@url)
                else
                    @urls.push("")
                end
            end
            puts params[:replace]
            puts params[:add]
            @userAccount = Account.find(@id)
            if params[:add] == nil
                # Replace function
                # With id sort, all of the boxes stay in the same order
                ## replaces as many boxes that are filled
                ## one box filled => one box replaced
                @ids = []
                @rows = PersonalWords.where(user: @id)
                @rows.each do |word|
                    @ids.push(word.id)
                end
                @ids.sort!
                @badIds = @ids[@tableNum * 8, 8]
                @newWords.each_with_index do |word, i|
                    if word != "" or @urls[i] != ""
                        if @badIds[i] != nil
                            @replaceId = @badIds[i]
                            @replace = PersonalWords.find(@replaceId)
                            @badImg = @replace.image
                            @replace.update(word: word, image:@urls[i])
                            # delete replaced image from HDrive
                            if @badImg != ""
                                delete(@badImg)
                            end
                        else
                            PersonalWords.create(user: @id, word: word, image: @urls[i])
                        end
                    end
                end
            else
                # Add function
                # will add to the end of all the current words
                @newWords.each_with_index do |word, i|
                    if word != "" or @urls[i] != ""
                        PersonalWords.create(user: @id, word: word, image: @urls[i])
                    end                
                end
            end

            @name = @userAccount.name
            @contacts = @userAccount.contacts
            @message = params[:message]
            @rows = PersonalWords.where(user: @id)
            @ids = []
            @rows.each do |word|
                @ids.push(word.id)
            end
            @ids.sort!
            @words = []
            @ids.each do |id|
                @row = PersonalWords.find(id)
                @words.push(@row.word)
                @words.push(@row.image)
            end
            erb :messageTemplate
        end
    end
    
    post '/login' do #executes at /login
        @email = params[:email]
        @password = params[:password]
        @tut = params[:tutorial].to_i
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

            @name = @userAccount.name
            @email = @userAccount.email
            @number = @userAccount.phoneNumber.split("-").join("")
            @level = @userAccount.level
            @password = @userAccount.password
            @id = @userAccount.id
            @contacts = @userAccount.contacts
            @rows = PersonalWords.where(user: @id)
            @ids = []
            @rows.each do |word|
                @ids.push(word.id)
            end
            @ids.sort!
            @words = []
            @imgs = []
            @ids.each do |id|
                @row = PersonalWords.find(id)
                @words.push(@row.word)
                @imgs.push(@row.image)
            end
            if @tut == 1
                @userAccount.update(level: "")
                @level = @userAccount.level
            end
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
        else
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
            @words = []
            @contacts = []
            erb :account
        end
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

    post '/delete-contact' do
        @id = params[:id]
        @userAccount = Account.find(@id)
        @contacts = @userAccount.contacts
        @delContacts = []
        @contacts.each_with_index do |contact, i|
            name = "contactId" + i.to_s
            if params[name.to_sym] != nil
                @contacts.delete(contact)
                @userAccount.update(contacts: @contacts)
            end
        end
        @contactId = params[:contactId]
        print @contacts
        
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
    
    post '/add-word' do
        @id = params[:id]
        @newWord = params[:word]
        if @newWord != nil
            @newWord = @newWord.capitalize
        else
            @newWord = ""
        end
        @newImg = params[:img]
        if @newImg != nil
            @file = @newImg["tempfile"]
            @file = @file.path()
            @url = upload(@file)
        else
            @url = ""
        end
        @userAccount = Account.find(@id)
        if @url != "" or @newWord != ""
            PersonalWords.create(user: @id, word: @newWord, image: @url)
        end
        @rows = PersonalWords.where(user: @id)
        @ids = []
        @rows.each do |word|
            @ids.push(word.id)
        end
        @ids.sort!
        @words = []
        @imgs = []
        @ids.each do |id|
            @row = PersonalWords.find(id)
            @words.push(@row.word)
            @imgs.push(@row.image)
        end
        @name = @userAccount.name
        @email = @userAccount.email
        @level = @userAccount.level
        @password = @userAccount.password
        @id = @userAccount.id
        @contacts = @userAccount.contacts
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
    



end