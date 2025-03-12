require_relative '../../ruby/flatten/lib/flatten_array'

RSpec.describe FlattenArray do
  subject(:array) do
    FlattenArray.new(params).flatten_array
  end

  let(:params) do
    [1, 2, [5, [6, 7]], [%w[potato tomato], %i[beto tatooine]], [{ a: 1, b: 2 }]]
  end

  it do
    expect(array).to eq([1, 2, 5, 6, 7, 'potato', 'tomato', :beto, :tatooine, { a: 1, b: 2 }])
  end

  context 'when simple array' do
    subject(:array) { FlattenArray.new([1, 2, 3, 4, 5, 6, 7]).flatten_array }

    it { expect(array).to eq([1, 2, 3, 4, 5, 6, 7]) }
  end

  context 'when simple number array with nested arrays' do
    subject(:array) { FlattenArray.new([1, 2, [3, 4], [5, [6, 7]]]).flatten_array }

    it { expect(array).to eq([1, 2, 3, 4, 5, 6, 7]) }
  end

  context 'when number and string array' do
    subject(:array) { FlattenArray.new([1, 2, %w[potato tomato], [5, [6, 7]]]).flatten_array }

    it { expect(array).to eq([1, 2, 'potato', 'tomato', 5, 6, 7]) }
  end

  context 'when array with hash' do
    subject(:array) { FlattenArray.new([1, 2, [5, [6, 7]], { a: 1, b: 2 }]).flatten_array }

    it { expect(array).to eq([1, 2, 5, 6, 7, { a: 1, b: 2 }]) }
  end

  context 'when array with symbol array' do
    subject(:array) { FlattenArray.new([1, 2, [%i[potato tomato]], [5, [6, 7]]]).flatten_array }

    it { expect(array).to eq([1, 2, :potato, :tomato, 5, 6, 7]) }
  end
end
