class User < ActiveRecord::Base
    has_many :orders 
    has_many :starbucks, through: :orders
    
    def self.tty_prompt
        TTY::Prompt.new 
    end 

    def self.handle_existing_user 
        system "clear"
        puts "Enter username"
        uname = gets.chomp.downcase 
        user = User.find_by(username: uname)
        if user
        puts "Welcome #{uname}!"
        else
        
        puts 'Who are you' 
        sleep(0.5) 
        puts "You will be redirected to sign up"
        sleep(1)
        
        User.handle_new_user
        # should take you back to sign up 
        end 
    end
    def self.handle_new_user 
        # able to create empty username and password 
        system "clear" 
        username = self.tty_prompt.ask("Create a username")    
        password = self.tty_prompt.mask("Create a password") 
        User.create(username: username, password: password)
    end 

<<<<<<< Updated upstream
end
=======
    def self.select_starbucks 
        system 'clear'
        User.find_idby_username(@userid)
        star_choice = Starbucks.starbucks_name
        choices = self.tty_prompt.select("Which location would you like to order from?", star_choice) 
        if choices
            d = Starbucks.find_starby_user(choices)
            Order.create(user_id: @userid.id, starbucks_id: d.id)
        end
    end
end 

>>>>>>> Stashed changes
