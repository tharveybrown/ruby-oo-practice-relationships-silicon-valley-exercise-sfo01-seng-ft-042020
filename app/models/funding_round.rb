require_relative 'startup.rb'
require_relative 'venture_capitalist.rb'
require 'pry'
class FundingRound
    attr_accessor :type, :amount
    attr_reader :startup, :venture_capitalist

    @@all = []
    def initialize(startup, venture_capitalist, type, amount)
        @startup = startup
        @venture_capitalist = venture_capitalist
        @type = type
        @amount = amount
        save
    end

    def self.all
        @@all
    end

    private
    def save
        @@all << self
    end
end

startup_b = Startup.new("applebees", "Bob", "Casual Dining")
startup_a = Startup.new("apple", "Steve", "Tech")
startup_c = Startup.new("Chilis", "Bobby", "Casual Dining")


vc_a = VentureCapitalist.new("blue", 1000000)
vc_b = VentureCapitalist.new("green", 1000990000)
vc_c = VentureCapitalist.new("green", 10009900)
vc_d = VentureCapitalist.new("green", 10009903453450)

funding_a = FundingRound.new(startup_a, vc_a, "Seed A", 50000)
funding_b = FundingRound.new(startup_c, vc_a, "Seed A", 50999)
funding_c = FundingRound.new(startup_c, vc_a, "Seed A", 500777)
funding_d = FundingRound.new(startup_b, vc_a, "Seed A", 50000)
funding_e = FundingRound.new(startup_b, vc_a, "Seed A", 50000)
