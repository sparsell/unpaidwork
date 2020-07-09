module UnpaidWork
    class UnpaidWork::API

        def self.get_country(id)
            url = "https://stats.oecd.org/SDMX-JSON/data/GENDER_EMP/#{id}.EMP15_U+EMP15_P+EMP15_T.MEN+WOMEN.1564.LATEST_YEAR/all?&dimensionAtObservation=allDimensions&pid=fc199662-1e91-402d-bd34-06fb2ee872ea"
            data = HTTParty.get(url)
            parsed_data = JSON.parse data
            country_data = parsed_data["dataSets"][0]["observations"]

                UnpaidWork::Country.make_country(id, country_data)
        end
    end
end


    #ALL COUNTRIES ENDPOINT:

        # data = HTTParty.get('https://stats.oecd.org/SDMX-JSON/data/GENDER_EMP/AUS+AUT+BEL+CAN+CHL+COL+CZE+DNK+EST+FIN+FRA+DEU+GRC+HUN+ISL+IRL+ISR+ITA+JPN+KOR+LVA+LTU+LUX+MEX+NLD+NZL+NOR+POL+PRT+SVK+SVN+ESP+SWE+CHE+TUR+GBR+USA+OAVG+NMEC+BRA+CHN+CRI+IND+IDN+RUS+ZAF.EMP15_U+EMP15_P+EMP15_T.MEN+WOMEN.1564.LATEST_YEAR/all?&dimensionAtObservation=allDimensions&pid=fc199662-1e91-402d-bd34-06fb2ee872ea', format: :plain)

        # id => "USA"
            # country_data =>
            # => {"0:0:0:0:0"=>[145.0, nil, 0, 0, nil],
            # "0:0:1:0:0"=>[241.0, nil, 0, 0, nil],
            #  "0:1:0:0:0"=>[320.1, nil, 0, 0, nil,    
            #  "0:1:1:0:0"=>[246.1, nil, 0, 0, nil],
            #  "0:2:0:0:0"=>[465.1, nil, 0, 0, nil],
            #  "0:2:1:0:0"=>[487.1, nil, 0, 0, nil]}


            # def self.get_country
                #     country = ["AUS", "AUT", "BEL", "CAN", "CHL", "COL", "CZE", "DNK", "EST", "FIN", "FRA", "DEU", "GRC", "HUN", "ISL","IRL", "ISR", "ITA", "JPN", "KOR", "LVA", "LTU", "LUX", "MEX", "NLD", "NOR", "POL", "PRT", "SVK", "ESP", "SWE", "CHE", "TUR", "GBR", "USA"]
                #     country.collect do |id| 
                    
                #     url = "https://stats.oecd.org/SDMX-JSON/data/GENDER_EMP/#{id}.EMP15_U+EMP15_P+EMP15_T.MEN+WOMEN.1564.LATEST_YEAR/all?&dimensionAtObservation=allDimensions&pid=fc199662-1e91-402d-bd34-06fb2ee872ea"
                #     data = HTTParty.get(url)
                #     parsed_data = JSON.parse data
                #     country_data = parsed_data["dataSets"][0]["observations"]
                    
                #         UnpaidWork::Country.make_country(id, country_data)
                #     end
                # end