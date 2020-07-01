
class UnpaidWork::API
    


    def self.get_country(id)
        url = "https://stats.oecd.org/SDMX-JSON/data/GENDER_EMP/#{id}.EMP15_U+EMP15_P+EMP15_T.MEN+WOMEN.1564.LATEST_YEAR/all?&dimensionAtObservation=allDimensions&pid=fc199662-1e91-402d-bd34-06fb2ee872ea"
        data = HTTParty.get(url)
        parsed_data = JSON.parse data
        country_data = parsed_data["dataSets"][0]["observations"]
        UnpaidWork::Country.make_country(country_data)
    end
end
    #ALL COUNTRIES ENDPOINT:
        # data = HTTParty.get('https://stats.oecd.org/SDMX-JSON/data/GENDER_EMP/AUS+AUT+BEL+CAN+CHL+COL+CZE+DNK+EST+FIN+FRA+DEU+GRC+HUN+ISL+IRL+ISR+ITA+JPN+KOR+LVA+LTU+LUX+MEX+NLD+NZL+NOR+POL+PRT+SVK+SVN+ESP+SWE+CHE+TUR+GBR+USA+OAVG+NMEC+BRA+CHN+CRI+IND+IDN+RUS+ZAF.EMP15_U+EMP15_P+EMP15_T.MEN+WOMEN.1564.LATEST_YEAR/all?&dimensionAtObservation=allDimensions&pid=fc199662-1e91-402d-bd34-06fb2ee872ea', format: :plain)
        # dataset = JSON.parse data
        # country_names = dataset["structure"]["dimensions"]["observation"][0]["values"]
        # country_data = dataset["dataSets"][0]["observations"]

        # data = HTTParty.get('https://stats.oecd.org/SDMX-JSON/data/GENDER_EMP/AUS.EMP15_U+EMP15_P+EMP15_T.MEN+WOMEN.1564.LATEST_YEAR/all?&dimensionAtObservation=allDimensions&pid=fc199662-1e91-402d-bd34-06fb2ee872ea', format: :plain)
        # dataset = JSON.parse data
        # country_names = dataset["structure"]["dimensions"]["observation"][0]["values"]
        # country_data = dataset["dataSets"][0]["observations"]

        # country_detail = country_data.collect do |key, value|
        #     data_country = value[0]
        #     end
        #      => [171.6, 311.0, 304.1, 172.0, 475.7, 483.0] 

   #ALL COUNTRIES ENDPOINT:
        # data = HTTParty.get('https://stats.oecd.org/SDMX-JSON/data/GENDER_EMP/AUS+AUT+BEL+CAN+CHL+COL+CZE+DNK+EST+FIN+FRA+DEU+GRC+HUN+ISL+IRL+ISR+ITA+JPN+KOR+LVA+LTU+LUX+MEX+NLD+NZL+NOR+POL+PRT+SVK+SVN+ESP+SWE+CHE+TUR+GBR+USA+OAVG+NMEC+BRA+CHN+CRI+IND+IDN+RUS+ZAF.EMP15_U+EMP15_P+EMP15_T.MEN+WOMEN.1564.LATEST_YEAR/all?&dimensionAtObservation=allDimensions&pid=fc199662-1e91-402d-bd34-06fb2ee872ea', format: :plain)
        # dataset = JSON.parse data
        # country_names = dataset["structure"]["dimensions"]["observation"][0]["values"]
        # country_data = dataset["dataSets"][0]["observations"]

        # data = HTTParty.get('https://stats.oecd.org/SDMX-JSON/data/GENDER_EMP/AUS.EMP15_U+EMP15_P+EMP15_T.MEN+WOMEN.1564.LATEST_YEAR/all?&dimensionAtObservation=allDimensions&pid=fc199662-1e91-402d-bd34-06fb2ee872ea', format: :plain)
        # dataset = JSON.parse data
        # country_names = dataset["structure"]["dimensions"]["observation"][0]["values"]
        # country_data = dataset["dataSets"][0]["observations"]

        # country_detail = country_data.collect do |key, value|
        #     data_country = value[0]
        #     end
        #      => [171.6, 311.0, 304.1, 172.0, 475.7, 483.0] 

# what I want it to do for each country:
# iterate over each hash:
#   1. if the first number of the key value ["0:0:0:0:0"] is < ., "0" is Australia's number printed in the CLI (index +1) and will be used to get all the data for each category
#   2. use the 

        # men_unpaid = men_unpaid.collect do |name| "#{name["observations"]}"     
	    # end
        # men_unpaid.each_with_index do |(key, value), index|
        # puts "#{index +1}. #{key}"
        # end


        # Hash keys as symbols:

    # def self.get_countries

    # data = HTTParty.get('https://stats.oecd.org/SDMX-JSON/data/GENDER_EMP/AUS+AUT+BEL+CAN+CHL+COL+CZE+DNK+EST+FIN+FRA+DEU+GRC+HUN+ISL+IRL+ISR+ITA+JPN+KOR+LVA+LTU+LUX+MEX+NLD+NZL+NOR+POL+PRT+SVK+SVN+ESP+SWE+CHE+TUR+GBR+USA+OAVG+NMEC+BRA+CHN+CRI+IND+IDN+RUS+ZAF.EMP15_U+EMP15_P+EMP15_T.MEN+WOMEN.1564.LATEST_YEAR/all?&dimensionAtObservation=allDimensions&pid=fc199662-1e91-402d-bd34-06fb2ee872ea', format: :plain)
    # dataset = JSON.parse data, symbolize_names: true

    # country_names = dataset[:structure][:dimensions][:observation][0][:values]
   
    # UnpaidWork::Country.get_countries(country_names)

    # end


    # def self.get_data

    # men_unpaid = dataset[:dataSets][0][:observations][:"0:0:0:0:0"][0]    
    # women_unpaid = dataset[:dataSets][0][:observations][:"0:0:1:0:0"][0]
    # men_paid = dataset[:dataSets][0][:observations][:"0:1:0:0:0"][0]
    # women_paid = dataset[:dataSets][0][:observations][:"0:1:1:0:0"][0]
    # men_total = dataset[:dataSets][0][:observations][:"0:2:0:0:0"][0]
    # women_total = dataset[:dataSets][0][:observations][:"0:2:1:0:0"][0]
    
    # end
