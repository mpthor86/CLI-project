class CLI
    @@categories = []
    @@regions = []

    def self.menu
        puts "MAIN MENU"
        puts "Please choose a category below:"
        puts "1. Meals by Category"
        puts "2. Meals by Region"
        puts "3. Can't decide? I'll help you."
        puts "4. Exit"
        input = gets.strip
            if input == "1"
                self.show_categories
            elsif input == "2"
                self.show_regions
            elsif input == "3"
                Meals.random
            elsif input == "4"
                self.exit
            else input != 1..4
                self.wrong_answer
                self.menu
        end
    end
    def self.categories
        @@categories
    end
    def self.regions
        @@regions
    end
    def self.show_regions
        puts "Please choose a region:"
        self.regions.each_with_index {|obj, index| puts"#{index + 1}: #{obj}"}
        puts "Type Exit to Return to MAIN MENU"
        input = gets.strip
        if input == "Exit"
            self.menu
        elsif input.to_i - 1 < self.regions.count
            region = self.regions[input.to_i - 1]
            Meals.by_region(region)
        else self.wrong_answer
            self.show_regions
        end
    end
    def self.show_categories
        puts "Please choose a category:"
        self.categories.each_with_index {|obj, index| puts "#{index + 1}: #{obj}"}
        puts"Type Exit to Return to MAIN MENU"
        input = gets.strip
        if input == "Exit"
            self.menu
        elsif input.to_i - 1 < self.categories.count
        category = self.categories[input.to_i - 1]
        Meals.by_category(category)
        else self.wrong_answer
            self.show_categories
        end
    end
    def self.exit
        puts "Thanks for stopping by!"
    end
    def self.wrong_answer
        puts"That doesn't seem to be a choice"
    end
    def self.return_menu
        puts "What would you like next?"
        self.menu
    end
    def self.welcome
        puts "Hello! Feeling hungry?"
        puts "Find a meal by either regions or categories."
        puts "If you can't decide I'll get you a random meal!"
        self.menu
    end
end
