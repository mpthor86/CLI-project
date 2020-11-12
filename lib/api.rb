require_relative '../environment'
class API
    def self.category
        category_url = "https://www.themealdb.com/api/json/v1/1/list.php?c=list"
        category_uri = URI(category_url)
        category_response = Net::HTTP.get(category_uri)
        category_hash = JSON.parse(category_response)

        category_list = category_hash["meals"].each do |hash|
           hash.each do |key, category|
           hash = {"category" => "#{category}"}
              Meals.new(hash)
           end
        end 
    end
    def self.region
        region_url = "https://www.themealdb.com/api/json/v1/1/list.php?a=list"
        region_uri = URI(region_url)
        region_response = Net::HTTP.get(region_uri)
        region_hash = JSON.parse(region_response)

        region_list = region_hash["meals"].each do |hash|
            hash.each do |key, region|
                hash = {"region" => "#{region}"}
                Meals.new(hash)
            end
        end
    end
    #def self.random_meal
    #    random_url = "https://www.themealdb.com/api/json/v1/1/random.php"
    #    random_uri = URI(random_url)
    #    random_response = Net::HTTP.get(random_uri)
    #    random_hash = JSON.parse(random_response)
    #    Meals.new(random_hash)
    #end 
    def self.filter_by_category(category)
        meals_url = "https://www.themealdb.com/api/json/v1/1/filter.php?c=#{category}"
        meals_uri = URI(meals_url)
        meals_response = Net::HTTP.get(meals_uri)
        meals_hash = JSON.parse(meals_response)
        simple_hash = meals_hash["meals"].each do |key, obj|
            hash = {"meal_categories" => "#{obj}"}
            Meals.new(hash)
        end
    end

    #binding.pry
end

