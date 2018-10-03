class BasicUnit < ApplicationRecord

  SCORE_STRINGS_HASH = {
    "Desempenho muito acima da média": 3,
	  "Desempenho acima da média": 2,
	  "Desempenho mediano ou  um pouco abaixo da média": 1
  }

  def self.search(lat_min, lat_max, lat_less_comparator, lat_bigger_comparator, 
                  long_min, long_max, long_less_comparator, long_bigger_comparator)
    BasicUnit
      .where("latitude #{lat_less_comparator} #{lat_max} AND latitude #{lat_bigger_comparator} #{lat_min}")
      .where("longitute #{long_less_comparator} #{long_max} AND longitute #{long_bigger_comparator} #{long_min}")
  end


end
