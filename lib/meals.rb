class Meals
    #attr_accessor :category, :region
    @@all = []

   #def initialize(category:, region:)
   #    @category = category
   #    @region = region
   #    @@all << self
   #end

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
        
        #self.all.each_with_index do |key, index|
        #    puts "#{index + 1}:  #{key.find("strCategory")}"
        #end
    end
    #binding.pry
end