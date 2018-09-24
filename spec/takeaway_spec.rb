require 'takeaway'

describe Takeaway do
  subject(:takeaway) {described_class.new(menu: menu, order: order) }

  let(:menu) { double(:menu, print: printed_menu) }
  let(:order) { double(:order) }
  let(:printed_menu) { 'Beef £550' }

  let(:dishes) { {chicken: 2, fish: 2} }


  it 'shows the menu with the dishes and prices' do
    expect{takeaway.print_menu}.to eq(printed_menu)
  end

  it 'can order several dishes which are availble' do
    expect(order).to receive(:add).twice
  takeaway.place_order(dishes)
  end
end
