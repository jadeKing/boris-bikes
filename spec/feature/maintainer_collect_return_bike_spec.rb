require 'capybara/rspec'
require 'van'
feature 'Vans collect broken bikes and returned fixed' do
  let(:van) { Van.new }
  scenario 'Van collects broken bikes' do
    broken_bike = double :bike, broken?: true
    # bike.break
    bike = van.take_bike(broken_bike)
    expect(bike).to be bike
  end
  scenario 'Unable to accept more bikes as Van full' do
    bike = double :bike, broken?: true
    Van::DEFAULT_CAPACITY.times { van.take_bike(bike) }
    expect { van.take_bike(bike) }.to raise_error 'No Space Available'
  end
end
