class TastingRoom < ApplicationRecord
  attachment :profile_image
  belongs_to :region
  has_one :county, through: :region
  belongs_to :winery
  has_many :sales_summaries, dependent: :destroy


  # Clean up the URLs a bit
  # def to_param
  #  "#{id}-#{name.parameterize}"
  #end

  #scope :sales_summaries_this_year, -> {
  #       where('orders.id >= ?', 220000)
  #   }

  def sales_summaries_this_year
    cur_year = Date.today.year
    sales_summaries.where(year: cur_year)
  end
  def missing_months_this_year
    last_month = Date.today.month - 1
    cur_year = Date.today.year
    entered = self.sales_summaries.where(year: cur_year).count
    return last_month - entered
  end

  def estate_yn
    if estate == true
      "Yes"
    else
      "No"
    end
  end
  def seated_tastings_yn
    if seated_tastings == true
      "Yes"
    else
      "No"
    end
  end

  ## calc the number of purchasers year to date
  ##all sales summaries from this winery for this year upto the date of this sales summary
  def ytd_num_of_tasters(year, month)
    winery = self.winery
    tasting_room = self
    ytd_ss = tasting_room.sales_summaries.where('year = ? AND month <= ?', year, month)
    total = 0
    ytd_ss.each do |ss|
      total += ss.num_of_tasters if ss.num_of_tasters.present?
    end
    return total
  end

  ## calc the number of purchasers year to date
  ##all sales summaries from this winery for this year upto the date of this sales summary
  def ytd_num_of_purchasers(year, month)
    winery = self.winery
    tasting_room = self
    ytd_ss = tasting_room.sales_summaries.where('year = ? AND month <= ?', year, month)
    total = 0
    ytd_ss.each do |ss|
      total += ss.num_of_purchasers if ss.num_of_purchasers.present?
    end
    return total
  end

  def ytd_sales_in_dollars(year, month)
    winery = self.winery
    tasting_room = self
    ytd_ss = tasting_room.sales_summaries.where('year = ? AND month <= ?', year, month)
    total = 0
    ytd_ss.each do |ss|
      total += ss.sales_in_dollars if ss.sales_in_dollars.present?
    end
    return total
  end

  def ytd_num_of_club_signups(year, month)
    winery = self.winery
    tasting_room = self
    ytd_ss = tasting_room.sales_summaries.where('year = ? AND month <= ?', year, month)
    total = 0
    ytd_ss.each do |ss|
      total += ss.num_of_club_signups if ss.num_of_club_signups.present?
    end
    return total
  end




  def as_csv
  CSV.generate do |csv|
    csv << ["Year",
      "Month",
      "Tasters",
      "Purchases",
      "Tasting Room Sales",
      "Club Signups",
      "Purchase Conversion",
      "Club Conversion",
      "Sales per Taster",
      "Sales Per Purchase"  ]

      #sales_summary.tasting_room.region.name,
    self.sales_summaries.order(year: :desc, month: :desc ).each do |sales_summary|

      csv << [ sales_summary.year,
        Date::MONTHNAMES[sales_summary.month],
        sales_summary.num_of_tasters,
        sales_summary.num_of_purchasers,
        sales_summary.sales_in_dollars,
        sales_summary.num_of_club_signups,
        sales_summary.percent_tasters_purcahased,
        sales_summary.percent_club_signup,
        sales_summary.sales_per_taster,
        sales_summary.sales_per_purchase ]
    end
  end
end
end
