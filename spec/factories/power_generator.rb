FactoryBot.define do
  factory :power_generator do
    name {"TRIFÁSICO 380V" } 
    description { "2 MPPTs para adaptação versátil a diferentes tipos ou quantidades de módulos construídos com diferentes alinhamentos    
                  Monitoramento inteligente de 4 strings e 80% de economia de tempo na detecção de falhas    
                  Portas RS485 e USB para conectividade e gerenciamento de dados    
                  Display LCD gráfico local e monitoramento remoto" } 
    image_url { "https://marketplace-img-production.s3.amazonaws.com/products/13357/large/Kit-Gerador-de-Energia-Solar-WEG---SIW500H---ST013-18-22.jpg?1546434535" }
    manufacturer { "WEG" } 
    price { 49990.00 }
    kwp { 17.34 }
    height { 1.2 }
    width { 0.2 }
    lenght { 1.8 }
    weight { 118 }
    structure_type { "metalico" }
  end
end