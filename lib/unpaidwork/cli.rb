module UnpaidWork
    class UnpaidWork::CLI

        def start
            intro
            menu
            user_input
            get_country_names
        end

        def intro
            puts "The OECD collects and publishes data around gender roles (along with several other topics). The data in this CLI will show (in minutes per day) the amount of unpaid and paid work performed by males and females. "
            puts ""
        end

        def menu
            puts "What would you like to do?"
            puts "'view' - see data by OECD country"
            puts "'read' - a list of suggested ways to educate yourself"
            puts "'exit' - leave the program"
        end

        def user_input
            input = gets.chomp
        end

        def get_country_names
            UnpaidWork::Country.get_countries
        end

        def exit
            puts "Goodbye!"
        end

    end
end        
    