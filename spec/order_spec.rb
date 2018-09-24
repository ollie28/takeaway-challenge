require 'order'

describe Order do
  subject(:order) { described_class.new(menu) }

  let(:menu) { double(:menu) }

  let(:dishes) do
    {
      chicken: 2,
      fish: 2
    }
  end

  before do
    allow(menu).to receive(:has_dish?).with(:chicken).and_return(true)
    allow(menu).to receive(:has_dish?).with(:fish).and_return(true)

  end

  it 'selects several dishes from the delicious menu' do
    order.add(:chicken, 2)
    order.add(:fish, 2)
    expect(order.dishes).to eq(dishes)
  end

  it 'does not allow items that are already on the menu!' do
    allow(menu).to receive(:has_dish?).with(:mutton).and_return(false)
    expect { order.add(:mutton) }.to raise_error "mi nuh have nuh mutton"
  end
end
