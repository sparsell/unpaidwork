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

    def self.get_countries(country_names)
        country_names = country_names.collect do |name| "#{name["name"]}"     
	    end
        country_names.each_with_index do |(key, value), index|
	    puts "#{index +1}. #{key}"
        end
    end

    def self.get_country_data(country_data) #create country based on index number? 

    end

    def get_country_data(input) #iterate with input from user

    end

    def self.look_for_countries
        UnpaidWork::API.get_countries
    end   

    def self.all
        look_for_countries if @@all == []
        @@all
    end

    def save
        @@all << self    
    end

end

