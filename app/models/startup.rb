require 'pry'
class Startup
    attr_accessor :name, :domain
    attr_reader :founder

    @@all = []
    def initialize(name, founder, domain)
        @name = name
        @founder = founder
        @domain = domain
        save
    end

    def self.all
        @@all
    end
    
    def pivot(name, domain)
        @name = name
        @domain = domain
        
    end

    def find_by_founder(founder)
        self.all.find {|startup| startup.founder == founder}
    end

    def self.domains
        @@all.map {|startup| startup.domain}
    end

    def sign_contract(venture_capitalist, type, amount)
        FundingRound.new(self, venture_capitalist, type, amount)

    end

    def my_rounds
        FundingRound.all.select {|round| round.startup == self}
    end

    def num_funding_rounds
        my_rounds.count
    end

    def total_funds
        total_funds = 0
        my_rounds.each do |round|
            total_funds += round.amount
        end 
        total_funds
    end

    def investors
        my_rounds.map {|round| round.venture_capitalist}

    end

    def big_investors
        investors & VentureCapitalist.tres_commas_club

    end
    
    private
    def save
        @@all << self
    end

end
