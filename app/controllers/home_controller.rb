class HomeController < ApplicationController
  
  require 'csv'
  
  def csvsave
    csv_text = File.read('public/beerdb_please.csv', :encoding =>'EUC-KR', :headers => true)
    keys = ['num', 'name', 'brewery', 'style', 'alcohol', 'fruit', 'ibu', 'text']
    @save = CSV.parse(csv_text).map {|a| Hash[keys.zip(a)]}
    i=1
    while i < @save.length-1
    @class = Beerdb.new
    @class.num = @save[i].to_a[0][1]
    @class.name = @save[i].to_a[1][1]
    @class.brewery = @save[i].to_a[2][1]
    @class.style = @save[i].to_a[3][1]
    @class.alcohol = @save[i].to_a[4][1]
    @class.fruit = @save[i].to_a[5][1]
    @class.ibu = @save[i].to_a[6][1]
    @class.text = @save[i].to_a[7][1]
    @class.save
    i = i+1
    end
  end