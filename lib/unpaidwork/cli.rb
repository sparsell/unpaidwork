module UnpaidWork
    class UnpaidWork::CLI

        def start
            intro
            menu
            while user_input != "exit"
                get_country_names
                #validate(user_input)
          
            end
            exit  
        end

        def intro
            puts ""
            puts "PLACE HOLDER TEXT *** The OECD collects and publishes data around gender roles (along with several other topics). The data in this CLI will show  the amount of unpaid and paid work performed by males and females, in minutes per day. "
            puts ""
            puts ""
        end

        def menu
            puts "What would you like to do?"
            puts ""
            puts "'view' - see data by OECD country"
            puts "'exit' - leave the program"
        end

        def user_input
            input = gets.strip
        end

        def get_country_names
            UnpaidWork::Country.all
            puts ""
            puts "Choose an OECD country by typing the corresponding number (1-34),"
            puts "or type 'exit' to quit:"
            input = gets.strip.to_i
            #binding.pry
        end

        # def validate(user_input)
        #     if user_input < 1 || user_input > 34
        #         puts "Please enter a number from 1-34"
        #         end
        #     user_input
        # end

        def exit
            puts "Goodbye!"
        end


    end
end        
    