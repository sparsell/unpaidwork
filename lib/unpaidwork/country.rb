class UnpaidWork::Country
    attr_accessor :name, :unpaid_men, :unpaid_women, :paid_men, :paid_women
    @@all = []

    def initialize
        @name = name
        @unpaid_men = unpaid_men
        @unpaid_women = unpaid_women
        @paid_men = paid_men
        @paid_women = paid_women
        save
    end

    def self.get_countries(country_names)
        country_names = country_names.collect do |name| "#{name[:name]}" 
	    end
        country_names.each_with_index do |(key, value), index|
	    puts "#{index +1}. #{key}"
        end
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

