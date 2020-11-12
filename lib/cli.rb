require_relative '../environment'

class CLI
    def self.menu
        puts "Please choose a category below:"
        puts "1. Meals by Category"
        puts "2. Meals by Region"
        puts "3. Can't decide? I'll help you."
        input = gets.strip
            if input == "1"
                Meals.categories
                selection = gets.strip
                Meals.by_category("#{selection.to_i - 1}")
            elsif input == "2"
                Meals.region
            elsif input == "3"
                Meals.random
            else puts "I'm sorry thats not an option, please choose from the list."
                self.menu
           #Meals.all.each_with_index do |cat, index|
           #    puts "#{index +1}: #{cat}"
           #end
            #elsif puts "Please choose from the list provided."
        end
    end
    def self.meal_by_category

    end
end