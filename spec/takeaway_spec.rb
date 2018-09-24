require 'Takeaway'

describe Takeaway do
  subject(:takeaway) {describe_class.new(menu: menu) }

  let(:menu) {double(:menu, print: printed_menu) }
  let(:printed_menu) { 'Beef £5.50' }

  it 'shows the menu with the dishes and prices' do
    expect{takeaway.print_menu}.to eq(printed_menu)
  end
end
