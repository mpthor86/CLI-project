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
        self.clear
        API.random_meal
        self.meal_list
        CLI.return_menu
    end
    def self.by_category(select)
        self.clear
        API.by_category(select)
        self.meal_list
        CLI.return_menu
    end
    def self.by_region(select)
        self.clear
        API.by_region(select)
        self.meal_list
        CLI.return_menu
    end
    def self.meal_list
        self.all.each {|obj|
        puts "Name: #{obj.name}"
        puts "Category: #{obj.category}"
        puts "Region: #{obj.region}"
        if obj.valid(obj.ref)
         obj.ref = obj.ref
        else obj.ref = "Sorry there isn't a site for this meal."
        end
            puts "Heres a site for ingredients & measurements: #{obj.ref}"
        if obj.valid(obj.video)
         obj.video = obj.video
        else obj.video = "Sorry there isn't a video for this meal."
        end
            puts "Heres a video to help you make it!: #{obj.video}"
        puts ""}
    end
    def valid(obj)
        if obj == ""
            false
        elsif obj == nil
            false
        else true
        end
    end
end
