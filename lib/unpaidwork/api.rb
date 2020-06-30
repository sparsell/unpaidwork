
class UnpaidWork::API

    def self.get_countries(id)
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