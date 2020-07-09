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
            #puts @@all.collect {|country| country.id}
            #[1] pry(UnpaidWork::Country)> @@all
#=> [#<UnpaidWork::Country:0x00007fd9e1ced728 @id="USA", @paid_men=320.1, @paid_women=246.1, @total_men=465.1, @total_women=487.1, @unpaid_men=145.0, @unpaid_women=241.0>,
 #<UnpaidWork::Country:0x00007fd9e1888d18 @id="GBR", @paid_men=308.6, @paid_women=216.2, @total_men=448.7, @total_women=464.8, @unpaid_men=140.1, @unpaid_women=248.6>,
 #<UnpaidWork::Country:0x00007fd9e2355ac0 @id="NOR", @paid_men=277.4, @paid_women=200.0, @total_men=445.9, @total_women=427.4, @unpaid_men=168.5, @unpaid_women=227.4>]
        end

    end
end


# def make_country(id, country_data)
            
        #     country_data.each_with_index do |(key, value), index| 
        #         if index == 0
        #         unpaid_men = value[0]
        #         elsif index == 1
        #         unpaid_women = value[0]
        #         elsif index == 2
        #         paid_men = value[0]
        #         elsif index == 3
        #         paid_women = value[0]
        #         elsif index == 4
        #         total_men = value[0]
        #         elsif index == 5
        #         total_women = value[0]
        #         end
        #     end
        # end