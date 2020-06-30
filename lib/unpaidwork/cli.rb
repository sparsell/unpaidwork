module UnpaidWork
    class UnpaidWork::CLI

        def start
            intro
            menu
            while user_input != "exit"
                get_country_names
                
          
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
            puts "'read' - list of further resources, reading"
            puts "'exit' - leave the program"
        end

        def user_input
            input = gets.strip
        end

        def get_country_names
            puts ""
            puts "Choose an OECD country by typing the corresponding three letter abbreviation:"
            puts "AUS - Australia"
            puts "AUT - Australia"

            puts "or type 'exit' to quit:"
            id = gets.strip
            UnpaidWork::API.get_countries(id)
        end

     
        def exit
            puts "Goodbye!"
        end


    end
end        
    

# def display_country_data(input)
    # puts "OECD data for #{input}, in minutes per day:"
    # puts "Unpaid work performed by:"
    # puts "     Men: #{@unpaid_men}"
    # puts "     Women:#{@unpaid_women}"
    # puts ""
    # puts "Paid work performed by:"
    # puts "     Men: #{@paid_men}"
    # puts "     Women:#{@paid_women}"
    
    
    # puts "Total work performed by:"
    # puts "     Men: #{@total_men}"
    # puts "     Women:#{@total_women}"

# end