
class Welcomer 
#This is the greeting message that creates a new account
    def initialize
        puts "Hello Sir, do you wish to login or create a new account?
        You can type the following actions:
        -login :if you wish to login to an existing account
        -newaccount : if you wish to create a new account
        -end : if you would like to exit"
        answer = gets.chomp

        case answer
        when "login" then login
        when "newaccount" then newaccount
        when "end" then puts "Goodbye"
        else puts "Sorry, I didn´t get that, please repeat your entry!"
        initialize
        end
    end

    def login
        puts "Please enter your name!"
        name = gets.chomp
        if name == $name
            puts "Please enter your Pin!"
            pw = gets.chomp
            if pw == $pin
            #@pick = Account.new($name)
            #@pick.returned
            else
                puts "There was a problem"
                initialize
            end
        else
            puts "Your entry was incorrect, please try again"
            initialize
        end
    end

    def newaccount
        puts "Do you wish to create a new account?"
        answer = gets.chomp
        answer.downcase!
            if answer == "yes"
               puts "Ok, what´s your name?"
               $name = gets.chomp
               @pick = Account.new($name)
               $accounthash = {id: $name}
               puts "You created your Account!"
               @pick.password
            else
                newaccount
            end
    end

end

class Account
  
    def initialize(name, balance=0)
            $name = name
            @balance = balance
    end
    #Here the user is prompted to provide a standard password and command an action
      def password
    puts "Please provide a four digit password!"
           #sets a pin globally!
           $pin = gets.chomp
           unless $pin.length != 4 
            #$accounthash = {pw: $pin}
            choose(" ")
            else
            puts "The password should have four digits! Please try again!"
           password
        end
    end

    def choose(pw)
        
        puts "Type your password!"
        pw = gets.chomp
        if pw == "#{$pin}"
            puts returned
        else 
            puts "Wrong password!"
            choose(" ")
        end
    end    
        

    #this is the choose method without prompting a password, it only appears after having entered a password
    def returned
        puts "Choose between the following actions:
            - display : to display your balance
            - withdraw : to withdraw money from your account
            - deposit : to deposit money
            - accountinfo : displays account and password
            - logout: to return to the welcome screen"

            action = gets.chomp
        
        case action

            when "display" then display_balance
            when "withdraw" then puts "How much do you want to withdraw?"
                amount = gets.chomp.to_i
                withdraw(amount)
            when "deposit" then puts "How much do you wish to deposit?"
                amount = gets.chomp.to_i
                deposit(amount)
            when "accountinfo" then puts "#{accountinfo}"
            when "logout" then Welcomer
            
            else returned
        end
    end
    #called by the choose method when chosen
    def display_balance()
        puts "Balance:$#{@balance}."
        returned
    end
    #called by the choose method when chosen, only withdraws when there´s enough in the account
    def withdraw(amount)
        if amount <= @balance
        @balance -= amount
        puts "Withdrawal successful, your new balance is:$#{@balance}"
        returned
        else 
        puts "Your maximum withdrawal is: $#{@balance}!"
        eturned
        end
    end
    
    #called by the choose method when chosen
    def deposit(amount)
        @balance += amount
        puts "Deposit #{amount}. New Balance: $#{@balance}"
        returned
    end

  

private

    def accountinfo
        puts "Your Accountname is #{$name} and your password is #{$pin}"
        returned
    end
    #hidden pin method that contains the standard pin
    def pin
        password = $pin
    end
  
end


test = Welcomer.new
#this calls the welcome method when starting the program


=begin def password
    puts "Please provide a four digit password!"
           #sets a pin globally!
           $pin = gets.chomp
           unless $pin.length != 4 
            $accounthash = {pw: $pin}
            @pick.choose(" ")
            else
            puts "The password should have four digits! Please try again!"
           return password
        end
=end
