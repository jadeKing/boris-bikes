require 'docking_station'
describe DockingStation do
  # it { is_expected.to respond_to :release_bike }
  it 'releases bikes that are not broken' do
    subject.dock double :bike, broken?: false
    bike = subject.release_bike
    expect(bike).not_to be_broken
  end
  it 'can dock a bike' do
    expect(subject.dock(:bike)).to eq :bike
  end
  it 'raises error when no bike available' do
    expect { subject.release_bike }.to raise_error 'No Bikes Available'
  end
  it 'raises error when full' do
    subject.dock double :bike
    expect { subject.dock double :bike }.to raise_error 'Station Full'
  end
end
