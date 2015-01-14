class User
    attr_reader :name, :email, :twitter, :facebook 
    def initialize (name, email, twitter, facebook)
        @name = name
        @email = email
        @twitter = twitter
        @facebook = facebook
    end
end

class NotificationFactory
    def self.get_notificator(user)
        case 
        when !user.email.empty?
            EmailNotificator.new(user)
        when !user.twitter.empty?
            FBNotificator.new(user)
        when !user.facebook.empty?
            TWNotificator.new(user)
        else NoNotificator.new(user)
        end
    end
end

class EmailNotificator
   def initialize(user)
    @user = user
   end
    def notify
    puts "Sending an email to #{@user.email}"
   end
end

class FBNotificator
   def initialize(user)
    @user = user
   end
    def notify
    puts "Sending an FB notification to #{@user.facebook}"
   end
end

class TWNotificator
   def initialize(user)
    @user = user
   end
    def notify
    puts "Sending an PM to #{@user.twitter}"
   end
end

class NoNotificator
   def initialize(user)
    @user = user
   end
    def notify
    puts "Can't notify to #{@user.name}"
   end
end

firstuser = NotificationFactory.get_notificator(User.new(
    "Moritz", "mb@hot.com", "", "mb.facebook")).notify
seconduser = NotificationFactory.get_notificator(User.new(
    "Tiago", "", "tiago...", "ti.facebook")).notify
thirduser = NotificationFactory.get_notificator(User.new(
    "Grandma", "", "", "")).notify