class API
    def self.by_category(category)
        meals_url = "https://www.themealdb.com/api/json/v1/1/filter.php?c=#{category}"
        meals_uri = URI(meals_url)
        meals_response = Net::HTTP.get(meals_uri)
        meals_hash = JSON.parse(meals_response)
        array = meals_hash["meals"]
            array.each do |meal|
            API.lookup_by_id(meal["idMeal"])
            end
    end
    def self.by_region(region)
        meal_url = "https://www.themealdb.com/api/json/v1/1/filter.php?a=#{region}"
        meal_uri = URI(meal_url)
        meal_response = Net::HTTP.get(meal_uri)
        meal_hash = JSON.parse(meal_response)
        array = meal_hash["meals"]
            array.each do |hash|
                API.lookup_by_id(hash["idMeal"])
            end
    end
    def self.lookup_by_id(id)
        meal_url = "https://www.themealdb.com/api/json/v1/1/lookup.php?i=#{id}"
        meal_uri = URI(meal_url)
        response = Net::HTTP.get(meal_uri)
        meal_hash = JSON.parse(response)
        meal_array = meal_hash["meals"]
            meal_array.each do |meal|   
                Meals.new(name: meal["strMeal"], category: meal["strCategory"], region: meal["strArea"], ref: meal["strSource"], video: meal["strYoutube"])
        end
    end
    def self.random_meal
        random_url = "https://www.themealdb.com/api/json/v1/1/random.php"
        random_uri = URI(random_url)
        random_response = Net::HTTP.get(random_uri)
            random_hash = JSON.parse(random_response)
            array_meals = random_hash["meals"]
            array_meals.each do |meal|
                Meals.new(name: meal["strMeal"], category: meal["strCategory"], region: meal["strArea"], ref: meal["strSource"], video: meal["strYoutube"])
            end
    end 
    #binding.pry
end

