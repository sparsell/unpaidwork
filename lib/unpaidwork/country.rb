class UnpaidWork::Country
    attr_accessor :name, :unpaid_men, :unpaid_women, :paid_men, :paid_women, :total_men, :total_women
    @@all = []

    def initialize
        @name = name
        @unpaid_men = unpaid_men
        @unpaid_women = unpaid_women
        @paid_men = paid_men
        @paid_women = paid_women
        @total_men = total_men
        @total_women = total_women
        save
    end

    #this needs to return an array of country names e.g.,  ["Australia", "Austria", etc...]
    def self.get_countries(country_names)
        country_names = country_names.collect do |name| "#{name["name"]}"     
	    end
        country_names.each_with_index do |(key, value), index|
	    puts "#{index +1}. #{key}"
        end
    end

    # - ? - make each an array of values, in same order as country name array?
    def self.get_country_data(country_data)
        @unpaid_men = #return country_data[when third numerical value of key is "0"][0]
        @unpaid_women = #return country_data[when third numerical value of key is "1"][0]
        @paid_men = 
        @paid_women = 
        @total_men = 
        @total_women =  

    end

    def self.check_for_countries
        UnpaidWork::API.get_countries
    end   

    def self.all
        check_for_countries if @@all == []
        @@all
    end

    def save
        @@all << self    
    end

end



new_data = country_data.collect do |key, value|
    value[0]
end

new_data[0..5] #Australia's values "0" but need to be able to iterate over - not hard code!!