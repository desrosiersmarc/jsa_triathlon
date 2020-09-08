class CreateTimePeriod < ActiveRecord::Migration[5.1]
  def change
    year2018 = TimePeriod.create(name: 2018)
    year2019 = TimePeriod.create(name: 2019)
    year2020 = TimePeriod.create(name: 2020)

    months = ['Janvier','Février', 'Mars', 'Avril', 'Mai', 'Juin', 'Juillet', 'Août',
      'Septembre','Octobre', 'Novembre', 'Décembre']

    months.each do |month|
      TimePeriod.create(name: month, parent: year2018)
    end

    months.each do |month|
      TimePeriod.create(name: month, parent: year2019)
    end

    months.each do |month|
      TimePeriod.create(name: month, parent: year2020)
    end

  end
end
