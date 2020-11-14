#require_relative '../environment'
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
                if meal["strSource"] == ""
                    link = "Sorry, there isn't a site for this meal."
                elsif meal["strSource"] == nil
                    link = "Sorry, there isn't a site for this meal."
                else
                meal_site = meal["strSource"]
                link = URI(meal_site)
                end
                
                if meal["strYoutube"] == ""
                    video = "Sorry, there isn't a video for this meal."
                elsif meal["strYoutube"] == nil
                    video = "Sorry, there isn't a video for this meal."
                else
                meal_video = meal["strYoutube"]
                video = URI(meal_video)
                end      
                Meals.new(name: meal["strMeal"], category: meal["strCategory"], region: meal["strArea"], ref: link, video: video)
        end
    end
    def self.random_meal
        random_url = "https://www.themealdb.com/api/json/v1/1/random.php"
        random_uri = URI(random_url)
        random_response = Net::HTTP.get(random_uri)
            random_hash = JSON.parse(random_response)
            array_meals = random_hash["meals"]
            array_meals.each do |meal|
                if meal["strSource"] == ""
                    link = "Sorry, there isn't a site for this meal."
                elsif meal["strSource"] == nil
                    link = "Sorry, there isn't a site for this meal."
                else
                meal_site = meal["strSource"]
                link = URI(meal_site)
                end
                
                if meal["strYoutube"] == ""
                    video = "Sorry, there isn't a video for this meal."
                elsif meal["strYoutube"] == nil
                    video = "Sorry, there isn't a video for this meal."
                else
                meal_video = meal["strYoutube"]
                video = URI(meal_video)
                end 
                Meals.new(name: meal["strMeal"], category: meal["strCategory"], region: meal["strArea"], ref: link, video: video)
            end
    end 
    def self.valid?(string)
        if string == ""
            false
        elsif string == nil
            false
        else true
        end
    end
    #binding.pry
end

