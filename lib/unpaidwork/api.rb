class UnpaidWork::API

    def self.get_countries

    data = HTTParty.get('https://stats.oecd.org/SDMX-JSON/data/GENDER_EMP/AUS+AUT+BEL+CAN+CHL+COL+CZE+DNK+EST+FIN+FRA+DEU+GRC+HUN+ISL+IRL+ISR+ITA+JPN+KOR+LVA+LTU+LUX+MEX+NLD+NZL+NOR+POL+PRT+SVK+SVN+ESP+SWE+CHE+TUR+GBR+USA+OAVG+NMEC+BRA+CHN+CRI+IND+IDN+RUS+ZAF.EMP15_U+EMP15_P+EMP15_T.MEN+WOMEN.1564.LATEST_YEAR/all?&dimensionAtObservation=allDimensions&pid=fc199662-1e91-402d-bd34-06fb2ee872ea', format: :plain)
    dataset = JSON.parse data, symbolize_names: true

    countries = dataset[:structure][:dimensions][:observation][0][:values]
   
    
        i = 0   
        country_name = countries.collect do |name|
            if i <= countries.length
                name = dataset[:structure][:dimensions][:observation][0][:values][i][:name]
            end
            i += 1
            puts "#{name}" 
            country_name.each_with_index {|name, index| puts "#{index + 1}. #{name}"}
        end

     UnpaidWork::Country.list_countries(country_name)

    end

    # def get_data

    # men_unpaid = dataset[:dataSets][0][:observations][:"0:0:0:0:0"][0]    
    # women_unpaid = dataset[:dataSets][0][:observations][:"0:0:1:0:0"][0]
    # men_paid = dataset[:dataSets][0][:observations][:"0:1:0:0:0"][0]
    # women_paid = dataset[:dataSets][0][:observations][:"0:1:1:0:0"][0]
    # men_total = dataset[:dataSets][0][:observations][:"0:2:0:0:0"][0]
    # women_total = dataset[:dataSets][0][:observations][:"0:2:1:0:0"][0]
    
    # end
end

     #dataset = hash
     #wo/men_un/paid = hash



     #WITHOUT SYMBOLS:
    #   countries = dataset["structure"]["dimensions"]["observation"][0]["values"]

    #   i = 0   
    #     country_name = countries.collect do |name|
    #         if i <= countries.length
    #             name = dataset["structure"]["dimensions"]["observation"][0]["values"][i]["name"]
    #         end
    #         i += 1
    #         puts "#{name}" 
    #     end

    #     women_unpaid = dataset["dataSets"][0]["observations"]["'0:0:1:0:0'"][0]