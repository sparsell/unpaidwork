module UnpaidWork
    class UnpaidWork::CLI

        def start
            intro
            menu
            unless user_input == "exit"
            get_country_names
          
            else
              exit  
            end
        end

        def intro
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
            input = gets.chomp
        end

        def get_country_names
            UnpaidWork::Country.all
        end

        def exit
            puts "Goodbye!"
        end


    end
end        
    