class SearchHelper
  attr_accessor :params

  def initialize(params)
    @params = params.freeze
    @offers = Offer.none
  end

  def search
    @offers = Offer.where(blocked:false).where(situation: params['situation'])
    budget
    start_end_date
  end

  private

  def budget
    case
      when params['min_price'].present? && params['max_price'].present?
        @offers = @offers.where('budget > ? and budget < ?', params['min_price'], params['max_price'])
      when params['min_price'].present? && params['max_price'].blank?
        @offers = @offers.where('budget >= ?', params['min_price'])
      when params['min_price'].blank? && params['max_price'].present?
        @offers = @offers.where('budget <= ?', params['max_price'])
      else
        @offers
    end
  end

  def start_end_date
    case
      when params['start_date'].present? && params['end_date'].present?
        @offers = @offers.where('start_date >= ? and end_date <= ?', params['start_date'], params['end_date'])
      when params['start_date'].present? && params['end_date'].blank?
        @offers = @offers = @offers.where('start_date >= ?', params['start_date'])
      when params['start_date'].blank? && params['end_date'].present?
        @offers = @offers.where('end_date =< ?', params['end_date'])
      else
        @offers
    end
  end
end
