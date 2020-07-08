module UnpaidWork
    class UnpaidWork::Country
        
        attr_accessor :id, :unpaid_men, :unpaid_women, :paid_men, :paid_women, :total_men, :total_women
        
        @@all = []

        def initialize(id, country_data) #id - from user in CLI; country_data - a hash from the API call. How can I make this better and create the country object from that hash??
            @id = id
            @unpaid_men = unpaid_men
            @unpaid_women = unpaid_women
            @paid_men = paid_men
            @paid_women = paid_women
            @total_men = total_men
            @total_women = total_women
            make_country(id, country_data)
        end

        def make_country(id, country_data)
            country_specific = country_data.collect do |key, value| value[0] end
                @unpaid_men = country_specific[0]
                @unpaid_women = country_specific[1]
                @paid_men = country_specific[2]
                @paid_women = country_specific[3]
                @total_men = country_specific[4]
                @total_women = country_specific[5]
                save
        end

        def save
            @@all << self 
        end

        def self.all
            puts @@all
        end

        def self.display_country_data(id)
            puts "According to the OECD, in #{id}, time spent in paid and unpaid work by gender is as follows (represented in minutes per day,):"
            puts ""
            puts "Unpaid work performed by:"
            puts "     Men: #{@unpaid_men}"
            puts "     Women:#{@unpaid_women}"
            puts ""
            puts "Paid work performed by:"
            puts "     Men: #{@paid_men}"
            puts "     Women:#{@paid_women}"
            puts ""
            puts "Total work performed by:"
            puts "     Men: #{@total_men}"
            puts "     Women:#{@total_women}"
            puts ""
            sleep (1)
        end
    end
end
