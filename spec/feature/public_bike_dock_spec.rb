# As a maintainer of the system,
# So that members of the public can get usable bikes,
# I'd like docking stations to not accept more bikes than their capacity.
feature 'member of public docks bike' do
  scenario 'docking station unable to receive as full' do
    docking_station = DockingStation.new
    docking_station.dock(Bike.new)
    expect { docking_station.dock(Bike.new) }.to raise_error 'Station Full'
  end
end
