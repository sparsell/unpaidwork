class UnpaidWork::Country
    attr_accessor :name, :unpaid_men, :unpaid_women, :paid_men, :paid_women

    def initialize
        @name = name
        @unpaid_men = unpaid_men
        @unpaid_women = unpaid_women
        @paid_men = paid_men
        @paid_women = paid_women
    end


    def self.list_countries(country_name)
        country_name.each_with_index {|name, index| puts "#{index + 1}. #{name}"}
    end   

end

