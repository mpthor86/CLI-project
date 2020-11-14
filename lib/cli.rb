#require_relative '../environment'

class CLI
    @@categories = ["Beef", "Pork", "Seafood", "Breakfast", "Dessert", "Vegan"]
    @@regions = ["American", "Chinese", "Egyptian", "Jamaican", "Mexican", "Italian"]

    def self.menu
        puts"Hello! Welcome to my Meal CLI Project."
        puts "Please choose a category below:"
        puts "1. Meals by Category"
        puts "2. Meals by Region"
        puts "3. Can't decide? I'll help you."
        input = gets.strip
            if input == "1"
                CLI.show_categories
                selection = gets.strip
                index = selection.to_i - 1
                category = CLI.categories[index] 
                Meals.by_category(category)
            elsif input == "2"
                CLI.show_regions
            elsif input == "3"
                Meals.random
            else CLI.wrong_answer
           #Meals.all.each_with_index do |cat, index|
           #    puts "#{index +1}: #{cat}"
           #end
            #elsif puts "Please choose from the list provided."
        end
    end
    def self.categories
        @@categories
    end
    def self.regions
        @@regions
    end
    def self.show_regions
        CLI.regions.each_with_index {|region, index| puts"#{index + 1}: #{region}"}
    end

    def self.show_categories
        CLI.categories.each_with_index {|category, index| puts "#{index + 1}: #{category}"}
    end

    def self.wrong_answer
        puts "I'm sorry thats not an option, please choose from the list."
        puts "Please choose a category below:"
        puts "1. Meals by Category"
        puts "2. Meals by Region"
        puts "3. Can't decide? I'll help you."
        input = gets.strip
    end
    def self.meal_by_category

    end
end