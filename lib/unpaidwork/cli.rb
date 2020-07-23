require 'colorize'
module UnpaidWork
    class UnpaidWork::CLI

        attr_reader :country, :id, :unpaid_men, :unpaid_women, :paid_men, :paid_women, :total_men, :total_women

        def start
            intro
            intro_menu
            menu
        end

        def intro
            puts ""
            puts "-------------------------------".colorize(:green)
            puts "    Welcome to 'Unpaid Work'".colorize(:yellow)
            puts "-------------------------------".colorize(:green)
            puts ""
            puts "  The OECD collects and publishes data around gender " 
            puts "  roles (along with many, many other topics)." 
            puts ""
            puts "  The OECD data in this application shows the amount of unpaid and paid work, performed by"
            puts "  men and women, in minutes per day. "
            puts ""
        end

        def intro_menu
            puts ""
            puts "---------------------------".colorize(:green)
            puts "What would you like to do?".colorize(:yellow)
            puts "---------------------------".colorize(:green)
            puts ""
            puts "'View'".colorize(:light_blue) + " - see data by OECD country"
            puts "'Learn'".colorize(:light_blue) + " - view a list of resources/further reading recommendations"
            puts "'Exit'".colorize(:light_blue) + " - leave the program"
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
                when "EXIT"
                    exit
                    break
                    else
                        puts "That is not a valid option. Please try again."
                end
            end
        end

        def print_country_names
            country_names = ["AUS".colorize(:yellow) + " - Austria", "AUT".colorize(:yellow) + " - Austria", "BEL".colorize(:yellow) + " - Belgium", "CAN".colorize(:yellow) + " - Canada", "DNK".colorize(:yellow) + " - Denmark", "EST".colorize(:yellow) + " - Estonia", "FIN".colorize(:yellow) + " - Finland", "FRA".colorize(:yellow) + " - France", "DEU".colorize(:yellow) + " - Germany", "GRC".colorize(:yellow) + " - Greece", "HUN".colorize(:yellow) + " - Hungary", "IRL".colorize(:yellow) + " - Ireland", "ITA".colorize(:yellow) + " - Italy", "JPN".colorize(:yellow) + " - Japan", "KOR".colorize(:yellow) + " - Korea", "LVA".colorize(:yellow) + " - Latvia", "LTU".colorize(:yellow) + " - Lithuania", "LUX".colorize(:yellow) + " - Luxembourg", "MEX".colorize(:yellow) + " - Mexico", "NLD".colorize(:yellow) + " - Netherlands", "NOR".colorize(:yellow) + " - Norway", "POL".colorize(:yellow) + " - Poland", "PRT".colorize(:yellow) + " - Portugal", + "SVN".colorize(:yellow) + " - Slovenia", "ESP".colorize(:yellow) + " - Spain", "SWE".colorize(:yellow) + " - Sweden", "TUR".colorize(:yellow) + " - Turkey", "GBR".colorize(:yellow) + " - United Kingdom", "USA".colorize(:yellow) + " - United States"]
            country_names.each { |name| puts name }
        end    
           
        def choose_country
            puts ""
            puts "Choose an OECD country by typing the corresponding three letter abbreviation:".colorize(:green)
            puts "-----------------------------------------------------------------------------".colorize(:yellow)
            id = gets.chomp.upcase
            validate_id(id)
            display_country_data(id)
        end

        def validate_id(id)
            countries = ["AUS", "AUT", "BEL", "CAN", "COL", "CZE", "DNK", "EST", "FIN", "FRA", "DEU", "GRC", "HUN", "IRL", "ITA", "JPN", "KOR", "LVA", "LTU", "LUX", "MEX", "NLD", "NOR", "POL", "PRT", "SVN", "ESP", "SWE", "TUR", "GBR", "USA"]

            if countries.include?(id) 
            UnpaidWork::API.get_country(id)
            else
                puts ""
                puts "Please choose a correct abbreviation for the country you wish to view.".colorize(:red)
                choose_country
            end
        end

        def display_country_data(id)
            UnpaidWork::Country.all.select do |id| 
            puts "According to the OECD, in #{id.id}, time spent in paid and unpaid work by gender "
            puts "is as follows (represented in minutes per day,):"
            puts ""
            puts "Unpaid work performed by:".colorize(:green)
            puts "     Men: #{id.unpaid_men}"
            puts "     Women: #{id.unpaid_women}"
            puts ""
            puts "Paid work performed by:".colorize(:green)
            puts "     Men: #{id.paid_men}"
            puts "     Women:#{id.paid_women}"
            puts ""
            puts "Total work performed by:".colorize(:green)
            puts "     Men: #{id.total_men}"
            puts "     Women:#{id.total_women}"
            puts ""
            end
        end

        def learn_more
            puts "Here are some excellent books that help to give context to the data:".colorize(:yellow)
            puts ""
            puts "1. 'Invisible Women: Data Bias in a World Designed for Men' by Caroline Criado-Perez"
            puts "2. 'Drop the Ball' by Tiffany Dufu"
            puts "3. Visit 'https://www.oecd.org/dev/development-gender/Unpaid_care_work.pdf' to learn more about the OECD research"
            puts "4. Read and watch 'https://www.cnbc.com/2018/04/10/heres-what-women-could-earn-if-household-chores-were-compensated.html#:~:text=According%20to%20the%20Organisation%20for,a%20week%20%E2%80%94%20doing%20unpaid%20labor.&text=The%20Bureau%20of%20Labor%20Statistics,average%20of%20%2426.82%20an%20hour.'"
            puts ""
        end
     
        def exit
            puts ""
            puts "-----------------------------------------".colorize(:green)
            puts "Thanks for visiting. Now, go get to work!".colorize(:yellow)
            puts "-----------------------------------------".colorize(:green)
            puts ''
        end
    end
end        