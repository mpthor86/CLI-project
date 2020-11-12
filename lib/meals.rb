require_relative '../environment'

class Meals
    #attr_accessor :category, :region, :name, :instructions
    @@all = []

    def initialize(hash)
        hash.each do |key, value|
            self.class.attr_accessor(key)
            self.send(("#{key}="), value)
            @@all << self
        end
    end
    def self.all
        @@all
    end
    def self.categories
        API.category
        self.all.select {|obj| obj.category}.each_with_index do |obj, index|
            puts "#{index +1}: #{obj.category}" 
        end
    end
    def self.by_category(number)
        self.all.select {|obj| obj.category}.find {|index| index == number}
            


        self.all.select {|obj| obj.category}.each_with_index do |obj, index|
            if index == number
                selection = "#{obj.category}"
                API.filter_by_category(selection)
                self.all.select {|obj| obj.meal_categories}.each_with_index do |obj, index|
                    puts "#{index + 1}: #{obj.meal_categories}"
                end
            end
        end
    end
    def self.region
        API.region
        self.all.select {|obj| obj.region}.each_with_index do |obj, index|
            puts "#{index +1}: #{obj.region}"
        end
    end
    #def self.random
    #    self.new(API.random_meal)
    #    self.select {|obj| obj.strMeal}.each {|obj| puts "#{obj.strMeal}"}
    #end
    
    #binding.pry
end


#def initialize(category:, region:, name:, instructions:)
   #     @name = name
   #     @instructions = instructions
   #     @category = category
   #     @region = region
   #     @@all << self
   #end