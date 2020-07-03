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
            puts "PLACE HOLDER TEXT *** The OECD collects and publishes data around gender roles" 
            puts "(along with several other topics)." 
            puts "The data in this application shows the amount of unpaid and paid work performed by males and females, in minutes per day. "
            puts ""
             sleep (1)
        end

        def intro_menu
            puts ""
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
                    print_country_names
                    choose_country
                    see_all
                    intro_menu
                when "read"
                    read
                    intro_menu   
                when "exit"
                    exit
                    break
                    else
                        puts "That is not a valid option. Please try again."
                end
            end
        end

        def print_country_names
            country_names = ["AUS - Austria", "AUT - Austria", "BEL - Belgium", "CAN - Canada", "CHL - Chile", "DNK - Denmark", "EST - Estonia", "FIN - Finland", "FRA - France", "DEU - Germany", "GRC - Greece", "HUN - Hungary", "ISL - Iceland", "IRL - Ireland", "ISR - Israel", "ITA - Italy", "JPN - Japan", "KOR - Korea", "LVA - Latvia", "LTU - Lithuania", "LUX - Luxembourg", "MEX - Mexico", "NLD - Netherlands", "NZL - New Zealand", "NOR - Norway", "POL - Poland", "PRT - Portugal", "SVK - Slovak Republic", "SVN - Slovenia", "ESP - Spain", "SWE - Sweden", "CHE - Switzerland", "TUR - Turkey", "GBR - United Kingdom", "USA - United States"]
            country_names.each { |name| puts name }
        end    
           
        def choose_country
            puts ""
            puts "Choose an OECD country by typing the corresponding three letter abbreviation:"
            id = gets.strip.upcase
            UnpaidWork::API.get_country(id)
            UnpaidWork::Country.display_country_data(id)
        end

        def see_all
            UnpaidWork::Country.all

        end


        def read
            puts "Here are some excellent books that help to give context to the data:"
            puts "1. 'Invisible Women: Data Bias in a World Designed for Men' by Caroline Criado-Perez"
            puts "2. 'Drop the Ball' by Tiffany Dufu"
            puts "3. 'TBD' by 'TBD'"
            sleep (2)
            puts "Check them out at your local library, online or wherever you browse for life-long learning materials."
        end
     
        def exit
            puts "Goodbye!"
        end
    end
end        
    

