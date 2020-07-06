module UnpaidWork
    class UnpaidWork::Country
        
        attr_accessor :name, :unpaid_men, :unpaid_women, :paid_men, :paid_women, :total_men, :total_women
        
        @@all = []

        def initialize
            make_country(country_data)
            #@id = id
            @unpaid_men = unpaid_men
            @unpaid_women = unpaid_women
            @paid_men = paid_men
            @paid_women = paid_women
            @total_men = total_men
            @total_women = total_women
            save
        end  

        def self.make_country(country_data)
            country_specific = country_data.collect do |key, value| value[0] end
                #@id = id
                @men_unpaid = country_specific[0]
                @women_unpaid = country_specific[1]
                @men_paid = country_specific[2]
                @women_paid = country_specific[3]
                @total_men = country_specific[4]
                @total_women = country_specific[5]
                #initialize
        end

        def self.display_country_data(id)
            puts "According to the OECD, in #{id}, time spent in paid and unpaid work by gender is as follows (represented in minutes per day,):"
            puts ""
            puts "Unpaid work performed by:"
            puts "     Men: #{@men_unpaid}"
            puts "     Women:#{@women_unpaid}"
            puts ""
            puts "Paid work performed by:"
            puts "     Men: #{@men_paid}"
            puts "     Women:#{@women_paid}"
            puts ""
            puts "Total work performed by:"
            puts "     Men: #{@total_men}"
            puts "     Women:#{@total_women}"
            puts ""
            sleep (1)
        end

        def self.check_for_countries
            #UnpaidWork::API.get_country(id)
        end   

        def self.save
            @@all << self    
        end
        
        def self.all
            check_for_countries if @@all == []
            @@all
        end

    end
end