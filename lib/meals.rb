#require_relative '../environment'

class Meals
    attr_accessor :category, :region, :name, :ref, :video
    @@all = []

    def initialize(category:, region:, name:, ref:, video:)
        @name = name
        @category = category
        @region = region
        @video = video
        @ref = ref
        @@all << self
    end
    
    def self.all
        @@all
    end
    def self.clear
        @@all.clear
    end

    def self.random
        Meals.clear
        API.random_meal
        self.all.select {|obj|
        puts "Name: #{obj.name}"
        puts "Category: #{obj.category}"
        puts "Region: #{obj.region}"
        puts "Heres a site for ingredients & measurements: #{obj.ref}"
        puts "Heres a video to help make it!: #{obj.video}"}
    end
    def self.by_category(select)
        Meals.clear
        API.by_category(select)
        self.all.each {|obj|
        puts "Name: #{obj.name}"
        puts "Category: #{obj.category}"
        puts "Region: #{obj.region}"
        puts "Heres a site for ingredients & measurements: #{obj.ref}"
        puts "Heres a video to help make it!: #{obj.video}"
        puts ""}
    end

    
    #def self.by_category(number)
    #    #API.filter_by_category(number)
    #    self.all.select {|obj| obj.category}.each_with_index do |obj, index|
    #        if index == number
    #        meal = "#{obj.category}"
    #        API.filter_by_category(meal)
    #        self.all.select {|obj| obj.meal_categories}.each_with_index do |obj, index|
    #            puts "#{index + 1}: #{obj.meal_categories}"
    #        end
    #       end
    #   end
    #end
        #binding.pry    


    #    self.all.select {|obj| obj.category}.each_with_index do |obj, index|
    #        if index == number
    #            selection = "#{obj.category}"
    #            API.filter_by_category(selection)
    #            self.all.select {|obj| obj.meal_categories}.each_with_index do |obj, index|
    #                puts "#{index + 1}: #{obj.meal_categories}"
    #            end
    #        end
    #    end
    #end
    
    #def self.random
    #    self.new(API.random_meal)
    #    self.select {|obj| obj.strMeal}.each {|obj| puts "#{obj.strMeal}"}
    #end
    
    #binding.pry
end

#def self.categories
#    self.all.select {|obj| obj.category}.each_with_index do |obj, index|
#        puts "#{index +1}: #{obj.category}" 
#    end
#end


    #def initialize(hash)
    #    hash.each do |key, value|
    #        self.class.attr_accessor(key)
    #        self.send(("#{key}="), value)
    #        @@all << self
    #    end
    #end

    #def self.region
    #    self.all.select {|obj| obj.region}.each_with_index do |obj, index|
    #        puts "#{index +1}: #{obj.region}"
    #    end
    #end