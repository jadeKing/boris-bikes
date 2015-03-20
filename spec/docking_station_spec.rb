require 'docking_station'
describe DockingStation do
  # it { is_expected.to respond_to :release_bike }
  it 'releases bikes that are not broken' do
    subject.dock double :bike, broken?: false
    bike = subject.release_bike
    expect(bike).not_to be_broken
  end
  it 'can dock a bike' do
    expect(subject.dock(:bike)).to be nil
  end
  it 'raises error when no bike available' do
    expect { subject.release_bike }.to raise_error 'No Bikes Available'
  end
  it 'raises error when full' do
    DockingStation::DEFAULT_CAPACITY.times { subject.dock double :bike }
    expect { subject.dock double :bike }.to raise_error 'Station Full'
  end
  it 'does not release broken bikes' do
    broken_bike = double :bike, broken?: true
    subject.dock broken_bike
    expect { subject.release_bike }.to raise_error 'No Bikes Available'
  end
end
