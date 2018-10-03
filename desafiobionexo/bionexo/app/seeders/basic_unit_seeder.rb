class BasicUnitSeeder
  require "open-uri"

  def self.seed
    url_data = download_csv_file()
    unit_basis_infos = url_data.partition("\n").last.split("\n")
    
    unit_basis_infos.each do |unit_base_info_raw|
      unit_base_info = unit_base_info_raw.split(",")
      BasicUnit.create({
        latitude: unit_base_info[0],
        longitute: unit_base_info[1],
        name: unit_base_info[4],
        address: unit_base_info[5],
        city: unit_base_info[7],
        phone: unit_base_info[8],
        size: BasicUnit::SCORE_STRINGS_HASH[ unit_base_info[9].strip.to_sym ],
        adaptation_for_seniors: BasicUnit::SCORE_STRINGS_HASH[ unit_base_info[10].strip.to_sym ],
        medical_equipment: BasicUnit::SCORE_STRINGS_HASH[ unit_base_info[11].strip.to_sym ],
        medicine: BasicUnit::SCORE_STRINGS_HASH[ unit_base_info[12].strip.to_sym ]
      })
      puts "Criado a UBS de latitude #{unit_base_info[0]} e longitude #{unit_base_info[1]} "
    end
  end

  private

  def self.download_csv_file
    url_source = "http://repositorio.dados.gov.br/saude/unidades-saude/unidade-basica-saude/ubs.csv"
    open(url_source).read.force_encoding("UTF-8")
  end

end