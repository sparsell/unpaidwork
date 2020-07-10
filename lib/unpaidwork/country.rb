module UnpaidWork
    class UnpaidWork::Country
        
        attr_accessor :id, :unpaid_men, :unpaid_women, :paid_men, :paid_women, :total_men, :total_women
        
        @@all = []

        def initialize(id, country_data) 
            country_data.each {|key, value| self.send(("#{key}="), value)}
            save
        end

        def self.make_country(id, country_data)
            id = id
            unpaid_men = country_data.values[0][0]
            unpaid_women = country_data.values[1][0]
            paid_men = country_data.values[2][0]
            paid_women = country_data.values[3][0]
            total_men = country_data.values[4][0]
            total_women = country_data.values[5][0]
                
            country_data = {
                :id => id,
                :unpaid_men => unpaid_men,
                :unpaid_women => unpaid_women,
                :paid_men => paid_men,
                :paid_women => paid_women,
                :total_men => total_men,
                :total_women => total_women
            }    
            
            UnpaidWork::Country.new(id, country_data)
        end

        def save
            @@all << self 
        end

        def self.all
            @@all
        end

    end
end