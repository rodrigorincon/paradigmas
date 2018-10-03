require 'rails_helper'

RSpec.describe BasicUnit, type: :model do 

  fixtures :basic_units

  before {
    @ubs_lat_29 = basic_units(:ubs_lat_29)
    @ubs_lat_29_00001 = basic_units(:ubs_lat_29_00001)
    @ubs_lat_29_3 = basic_units(:ubs_lat_29_3)
    @ubs_lat_29_3001 = basic_units(:ubs_lat_29_3001)
    @ubs_lat_29_352 = basic_units(:ubs_lat_29_352)
    @ubs_lat_29_3551 = basic_units(:ubs_lat_29_3551)
    @ubs_lat_29_356 = basic_units(:ubs_lat_29_356)
    @ubs_lat_29_358 = basic_units(:ubs_lat_29_358)
    @ubs_lat_29_39 = basic_units(:ubs_lat_29_39)
    @ubs_lat_29_4 = basic_units(:ubs_lat_29_4)
    @ubs_lat_29_41 = basic_units(:ubs_lat_29_41)
    @ubs_lat_30 = basic_units(:ubs_lat_30)
    @ubs_lat_menos_30 = basic_units(:ubs_lat_menos_30)
    @ubs_lat_menos_29 = basic_units(:ubs_lat_menos_29)
    @ubs_lat_menos_31 = basic_units(:ubs_lat_menos_31)
    @ubs_lat_menos_30_3 = basic_units(:ubs_lat_menos_30_3)
    @ubs_lat_menos_30_4 = basic_units(:ubs_lat_menos_30_4)
    @ubs_lat_menos_30_31 = basic_units(:ubs_lat_menos_30_31)
    @ubs_lat_menos_30_35 = basic_units(:ubs_lat_menos_30_35)
    @ubs_lat_menos_30_39 = basic_units(:ubs_lat_menos_30_39)
    @ubs_lat_menos_30_35_long_11 = basic_units(:ubs_lat_menos_30_35_long_11)
  }

  context "verificar ubs com latitude entre 29 e 30" do
    
    it "deve conter 11 registros" do
      count = BasicUnit.search(29, 30, "<", ">=", 10, 11, "<", ">=").count
      expect(count).to eq(11)  
    end

    it "limite superior nao pode esta incluso na lista em caso d elatitude positiva" do
      lat_list = BasicUnit.search(29, 30, "<", ">=", 10, 11, "<", ">=").map{|ubs| ubs.latitude}
      expect(lat_list).not_to include(@ubs_lat_30.latitude)  
    end
  end
  
  context "verificar ubs com latitude dentro de +29" do

    it "deve conter 2 registros de ubs com latitude menores que 29.1" do
      count = BasicUnit.search(29, 29.1, "<", ">=", 10, 11, "<", ">=").count
      expect(count).to eq(2)  
    end

    it "filtro de latitude pega mesmo valores decimais pequenos dentro do range" do
      lat_list = BasicUnit.search(29, 29.1, "<", ">=", 10, 11, "<", ">=").map{|ubs| ubs.latitude}
      expect(lat_list).to include(@ubs_lat_29.latitude)
      expect(lat_list).to include(@ubs_lat_29_00001.latitude)
    end

    it "deve conter 7 registros de ubs com latitude em 29.3" do
      count = BasicUnit.search(29.3, 29.4, "<", ">=", 10, 11, "<", ">=").count
      expect(count).to eq(7)  
    end

    it "filtro de latitude com 1 casa decimal deve retornar a ubs msm com valor em cima do limite" do
      lat_list = BasicUnit.search(29.3, 29.4, "<", ">=", 10, 11, "<", ">=").map{|ubs| ubs.latitude}
      expect(lat_list).to include(@ubs_lat_29_3.latitude)
      expect(lat_list).to include(@ubs_lat_29_39.latitude)
    end

  end

  context "verificar ubs com latitude dentro de -29" do
    
    it "deve conter 1 registro de ubs com latitude em -29" do
      count = BasicUnit.search(-29, -30, ">=", "<", 10, 11, "<", ">=").count
      expect(count).to eq(1)
    end

    it "filtro de latitude em -30 sem casa decimal nao deve pegar -31 nem -29" do
      lat_list = BasicUnit.search(-30, -31, "<", ">=", 10, 11, "<", ">=").map{|ubs| ubs.latitude}
      expect(lat_list).not_to include(@ubs_lat_menos_29.latitude)
      expect(lat_list).not_to include(@ubs_lat_menos_31.latitude)
    end

    it "deve conter 6 registros de ubs com latitude -30 (pega registro em cima do limiar)" do
      count = BasicUnit.search(-30, -31, ">=", "<", 10, 11, "<", ">=").count
      expect(count).to eq(6)
    end

    it "deve conter 4 registros dentro de -30.3  (nao arredonda para cima, fazendo 0.39 nao se transformar em 0.4)" do
      count = BasicUnit.search(-30.3, -30.4, ">=", "<", 10, 11, "<", ">=").count
      expect(count).to eq(4)
    end

    it "deve conter 1 ubs com longitude 11" do
      latitude_list = BasicUnit.search(-30, -31, ">=", "<", 11, 12, "<", ">=").map{|ubs| ubs.latitude}
      expect(latitude_list).to include(@ubs_lat_menos_30_35_long_11.latitude)
    end

    it "nao deve conter ubs com longitude 30" do
      latitude_list = BasicUnit.search(100, -31, ">=", "<", 30, 31, "<", ">=").map{|ubs| ubs.latitude}
      expect(latitude_list).not_to include(@ubs_lat_menos_30_35_long_11.latitude)
    end
  
  end

end