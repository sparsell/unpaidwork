class UnpaidWork::API

    def self.get_countries

    data = HTTParty.get('https://stats.oecd.org/SDMX-JSON/data/GENDER_EMP/AUS+AUT+BEL+CAN+CHL+COL+CZE+DNK+EST+FIN+FRA+DEU+GRC+HUN+ISL+IRL+ISR+ITA+JPN+KOR+LVA+LTU+LUX+MEX+NLD+NZL+NOR+POL+PRT+SVK+SVN+ESP+SWE+CHE+TUR+GBR+USA+OAVG+NMEC+BRA+CHN+CRI+IND+IDN+RUS+ZAF.EMP15_U+EMP15_P+EMP15_T.MEN+WOMEN.1564.LATEST_YEAR/all?&dimensionAtObservation=allDimensions&pid=fc199662-1e91-402d-bd34-06fb2ee872ea', format: :plain)
    dataset = JSON.parse data, symbolize_names: true

    country_name = dataset[:structure][:dimensions][:observation][0][:values]
    
     i = 0   
        name_hash = country_name.collect do |name|
            if i <= country_name.length
                name = dataset[:structure][:dimensions][:observation][0][:values][i][:name]
            end
            i += 1
            puts "#{name}"    
        end
    end
end

        