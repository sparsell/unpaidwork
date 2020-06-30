module UnpaidWork
    class UnpaidWork::CLI

        def start
            intro
            intro_menu
            menu
           
        end

        def intro
            puts ""
            puts "Welcome to 'Unpaid Work'."
            puts ""
            puts "PLACE HOLDER TEXT *** The OECD collects and publishes data around gender roles (along with several other topics). The data in this application shows the amount of unpaid and paid work performed by males and females, in minutes per day. "
            puts ""
             sleep (1)
        end

        def intro_menu
                puts "What would you like to do?"
            puts ""
            puts "'view' - see data by OECD country"
            puts "'read' - view a list of resources/further reading recommendations"
            puts "'exit' - leave the program"
        end

        def menu
            input = ""
            while input
                input = gets.chomp
                case input
                when "view"
                    get_country_names
                when "read"
                    read
                when "exit"
                    exit
                    break
                    else
                        puts "That is not a valid option. Please try again."
                end
            end
        end

        def get_country_names
            UnpaidWork::Country.all
            puts ""
            puts "Choose an OECD country by typing the corresponding number (1-34)"
            input = gets.chomp.to_i
            #UnpaidWork::Country.get_country_data(input)
            sleep (1)
            intro_menu
            
        end

        def read
            puts "Here are some excellent books that help to give context to the data:"
            puts "1. 'Invisible Women: Data Bias in a World Designed for Men' by Caroline Cirado Perez"
            puts "2. 'Drop the Ball' by Tiffany Dufu"
            puts "3. 'TBD' by 'TBD'"
            sleep (4)
            intro_menu
        end

        def exit
            puts "Goodbye!"
        end

    end
end        
    