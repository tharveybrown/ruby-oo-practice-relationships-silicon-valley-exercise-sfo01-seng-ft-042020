class VentureCapitalist
  attr_accessor :name, :total_worth

  @@all = []
  def initialize(name, total_worth)
      @name = name
      @total_worth = total_worth
      save
  end

  def self.all
      @@all
  end

  def self.tres_commas_club
      @@all.select {|vc| vc.total_worth > 1000000000}
  end

  def offer_contract(startup, type, amount)
      FundingRound.new(startup, self, type, amount)

  end


  def funding_rounds
      FundingRound.all.select {|round| round.venture_capitalist == self}
  end

  def portfolio
      startups = funding_rounds.map {|round| round.startup.name}
      startups.uniq
  end




  def biggest_investment
      investments = funding_rounds.map {|round| round.amount}
      investments.max
  end

  def invested(domain)
      total_invested = 0
      this_domain = funding_rounds.select {|round| round.startup.domain == domain}
      this_domain.each do |investment|
          total_invested += investment.amount
      end
      total_invested

  end



  private
  def save
      @@all << self
  end
end