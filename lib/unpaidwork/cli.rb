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
            puts "Welcome to 'Unpaid Work'.".colorize(:yellow)
            puts ""
            puts "  The OECD collects and publishes data around gender roles" 
            puts "  (along with several other topics)." 
            puts ""
            puts "  The data in this application shows the amount of unpaid and paid work performed by"
            puts "  males and females, in minutes per day. "
            puts ""
        end

        def intro_menu
            puts ""
            puts "What would you like to do?".colorize(:green)
            puts ""
            puts "'View'".colorize(:light_blue) + " - see data by OECD country"
            puts "'Learn'".colorize(:light_blue) + " - view a list of resources/further reading recommendations"
            puts "'More'".colorize(:light_blue) + " - to see all objects"
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
            country_names = ["AUS".colorize(:yellow) + " - Austria", "AUT".colorize(:yellow) + " - Austria", "BEL".colorize(:yellow) + " - Belgium", "CAN".colorize(:yellow) + " - Canada", "CHL".colorize(:yellow) + " - Chile", "DNK".colorize(:yellow) + " - Denmark", "EST".colorize(:yellow) + " - Estonia", "FIN".colorize(:yellow) + " - Finland", "FRA".colorize(:yellow) + " - France", "DEU".colorize(:yellow) + " - Germany", "GRC".colorize(:yellow) + " - Greece", "HUN".colorize(:yellow) + " - Hungary", "ISL".colorize(:yellow) + " - Iceland", "IRL".colorize(:yellow) + " - Ireland", "ISR".colorize(:yellow) + " - Israel", "ITA".colorize(:yellow) + " - Italy", "JPN".colorize(:yellow) + " - Japan", "KOR".colorize(:yellow) + " - Korea", "LVA".colorize(:yellow) + " - Latvia", "LTU".colorize(:yellow) + " - Lithuania", "LUX".colorize(:yellow) + " - Luxembourg", "MEX".colorize(:yellow) + " - Mexico", "NLD".colorize(:yellow) + " - Netherlands", "NZL".colorize(:yellow) + " - New Zealand", "NOR".colorize(:yellow) + " - Norway", "POL".colorize(:yellow) + " - Poland", "PRT".colorize(:yellow) + " - Portugal", "SVK".colorize(:yellow) + " - Slovak Republic", "SVN".colorize(:yellow) + " - Slovenia", "ESP".colorize(:yellow) + " - Spain", "SWE".colorize(:yellow) + " - Sweden", "CHE".colorize(:yellow) + " - Switzerland", "TUR".colorize(:yellow) + " - Turkey", "GBR".colorize(:yellow) + " - United Kingdom", "USA".colorize(:yellow) + " - United States"]
            country_names.each { |name| puts name }
        end    
           
        def choose_country
            puts ""
            puts "Choose an OECD country by typing the corresponding three letter abbreviation:".colorize(:green)
            id = gets.strip.upcase
            UnpaidWork::API.get_country(id)
            display_country_data(id)
            binding.pry
        end

        def display_country_data(id)
            UnpaidWork::Country.all.select do |id| country.id == "id"
            puts "According to the OECD, in #{id}, time spent in paid and unpaid work by gender is as follows (represented in minutes per day,):"
            puts ""
            puts "Unpaid work performed by:".colorize(:green)
            puts "     Men: #{country.unpaid_men}"
            puts "     Women: #{@unpaid_women}"
            puts ""
            puts "Paid work performed by:".colorize(:green)
            puts "     Men: #{@paid_men}"
            puts "     Women:#{@paid_women}"
            puts ""
            puts "Total work performed by:".colorize(:green)
            puts "     Men: #{@total_men}"
            puts "     Women:#{@total_women}"
            puts ""
            end
        end

        def see_all
            UnpaidWork::Country.all
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
            puts "Goodbye!"
        end
    end
end        
    

 #find country object by id, match it, pass object to display #country_data

            #find_by_id(id)

             # def find_by_id(id)
        #     UnpaidWork::Country.all.find {|id| id.id == id}
        # end
