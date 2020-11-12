class CLI
    def self.menu
        puts "Feeling Hungry?"
        puts "Please choose a category below:"
        puts "1. Meals by Region"
        puts "2. Meals by Category"
        input = gets.strip
            if input == "1"
                Meals.categories
           #Meals.all.each_with_index do |cat, index|
           #    puts "#{index +1}: #{cat}"
           #end
            #elsif puts "Please choose from the list provided."
        end
    end
end