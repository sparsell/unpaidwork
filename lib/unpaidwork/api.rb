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


    