class UnpaidWork::Country

    def self.list_countries(country_name)
        country_name.each_with_index do { |name, index| puts "#{index + 1}. #{name}"
        end
    end   

end

