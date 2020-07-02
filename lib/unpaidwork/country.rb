
module UnpaidWork
    class UnpaidWork::Country
        attr_accessor :name, :unpaid_men, :unpaid_women, :paid_men, :paid_women, :total_men, :total_women
        @@all = []

        def initialize
            make_country(country_data)
            @name = name
            @unpaid_men = unpaid_men
            @unpaid_women = unpaid_women
            @paid_men = paid_men
            @paid_women = paid_women
            @total_men = total_men
            @total_women = total_women
            save
        end

        # def self.get_countries(country_names)
        #     country_names = country_names.collect do |name| "#{name["name"]}"     
	    #     end
        #     country_names.each_with_index do |(key, value), index|
	    #     puts "#{index +1}. #{key}"
        #     end
        # end     

        def self.make_country(country_data)
            country_specific = country_data.collect do |key, value| value[0] end
                @men_unpaid = country_specific[0]
                @women_unpaid = country_specific[1]
                @men_paid = country_specific[2]
                @women_paid = country_specific[3]
                @total_men = country_specific[4]
                @total_women = country_specific[5]
                save
        end

        def self.get_country_data(country_data) 
        end

        def self.display_country_data(id)
            puts "The OECD data for #{id}, represented in minutes per day, is as follows:"
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
        end

        def self.check_for_countries
            UnpaidWork::API.get_country(id)
        end   

        def self.all
            check_for_countries if @@all == []
            @@all
        end

        def self.save
            @@all << self    
        end

    end
end

#### DO NOT USE - clear when done ####

# def self.get_countries(country_names)
#     country_names = country_names.collect do |name| "#{name["name"]}"     
#     end
#     country_names.each_with_index do |(key, value), index|
#     puts "#{index +1}. #{key}"
#     end
# end