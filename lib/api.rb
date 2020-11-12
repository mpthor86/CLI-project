class API
    def self.start
        category_url = "https://www.themealdb.com/api/json/v1/1/list.php?c=list"
        category_uri = URI(category_url)
        category_response = Net::HTTP.get(category_uri)
        category_hash = JSON.parse(category_response)

        region_url = "https://www.themealdb.com/api/json/v1/1/list.php?a=list"
        region_uri = URI(region_url)
        region_response = Net::HTTP.get(region_uri)
        region_hash = JSON.parse(region_response)

                category_list = category_hash["meals"].each do |hash|
                    hash.each do |key, category|
                        hash1 = {"Category" => {"#{key}" => "#{category}"}}
                        Meals.new(hash1)
                    end
                end

                region_list = region_hash["meals"].each do |hash|
                    hash.each do |key, region|
                        hash2 = {"Reagion" => {"#{key}" => "#{region}"}}
                        Meals.new(hash2)
                    end
                end
                binding.pry
    end
    #def self.regions
    #    region_url = "https://www.themealdb.com/api/json/v1/1/list.php?a=list"
    #    region_uri = URI(region_url)
    #    region_response = Net::HTTP.get(region_uri)
    #    region_hash = JSON.parse(region_response)
    #    Meals.new(region_hash)
    #    binding.pry
    #end
end

