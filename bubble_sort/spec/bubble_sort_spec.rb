require 'bubble_sort'

describe 'bubble_sort' do
  it 'sorts an array' do
    expect(bubble_sort([3,4,1,15,16,6,77,0])).to eq([0,1,3,4,6,15,16,77])
  end
end

describe 'bubble_sort_by' do
  result = bubble_sort_by(["hi","hello","hey"]) do |left,right|
    left.length <=> right.length
  end

  it 'sorts an array by a given block' do
    expect(result).to eq(["hi","hey","hello"])
  end
end
