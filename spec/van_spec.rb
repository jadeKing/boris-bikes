require 'van'

describe Van do
  # let(:bike) { Bike.new }
  it 'accepts a broken bike' do
    broken_bike = double :bike, broken?: true
    bike = subject.take_bike(broken_bike)
    expect(bike).to be bike
  end
  it 'rejects a working bike' do
    bike = double :bike, broken?: false
    bike = subject.take_bike(bike)
    expect(bike).to be nil
  end
  it 'raises error when full' do
    bike = double :bike,  broken?: true
    10.times { subject.take_bike(bike) }
    expect { subject.take_bike(bike) }.to raise_error 'No Space Available'
  end
end
