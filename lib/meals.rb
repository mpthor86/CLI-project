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
        Meals.meal_list
        CLI.return_menu
    end
    def self.by_category(select)
        Meals.clear
        API.by_category(select)
        Meals.meal_list
        CLI.return_menu
    end
    def self.by_region(select)
        Meals.clear
        API.by_region(select)
        Meals.meal_list
        CLI.return_menu
    end
    def self.meal_list
        self.all.each {|obj|
        puts "Name: #{obj.name}"
        puts "Category: #{obj.category}"
        puts "Region: #{obj.region}"
        puts "Heres a site for ingredients & measurements: #{obj.ref}"
        puts "Heres a video to help make it!: #{obj.video}"
        puts ""}
    end
end
