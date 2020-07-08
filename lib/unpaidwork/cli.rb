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
            puts "The OECD collects and publishes data around gender roles" 
            puts "(along with several other topics)." 
            puts "The data in this application shows the amount of unpaid and paid work performed by"
            puts "males and females, in minutes per day. "
            puts ""
             sleep (1)
        end

        def intro_menu
            puts ""
            puts "What would you like to do?"
            puts ""
            puts "'View' - see data by OECD country"
            puts "'Learn' - view a list of resources/further reading recommendations"
            puts "'More' - to see all objects"
            puts "'Exit' - leave the program"
        end

        def menu
            input = ""
            while input
                input = gets.chomp.upcase
                case input
                when "VIEW"
                    print_country_names
                    choose_country
                    intro_menu
                when "LEARN"
                    learn_more
                    intro_menu 
                when "MORE"  
                    see_all
                    intro_menu
                when "EXIT"
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
            #add validation - if id is in country_names array,  --> use .detect...
            UnpaidWork::API.get_country(id)
            UnpaidWork::Country.display_country_data(id)
        end

        def see_all
            UnpaidWork::Country.all
        end

        def learn_more
            puts "Here are some excellent books that help to give context to the data:"
            puts "1. 'Invisible Women: Data Bias in a World Designed for Men' by Caroline Criado-Perez"
            puts "2. 'Drop the Ball' by Tiffany Dufu"
            puts "3. Visit 'https://www.oecd.org/dev/development-gender/Unpaid_care_work.pdf' to learn more about the OECD research"
            puts "4. Read and watch 'https://www.cnbc.com/2018/04/10/heres-what-women-could-earn-if-household-chores-were-compensated.html#:~:text=According%20to%20the%20Organisation%20for,a%20week%20%E2%80%94%20doing%20unpaid%20labor.&text=The%20Bureau%20of%20Labor%20Statistics,average%20of%20%2426.82%20an%20hour.'"
            puts ""
        end
     
        def exit
            puts "Goodbye!"
        end
    end
end        
    

