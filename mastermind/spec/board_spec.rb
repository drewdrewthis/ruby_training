require 'board'

xdescribe Board do
  let(:code) { %w{red blue green green} }
  let(:hint) { %w{} }

  subject { Board.new(code) }

  it 'can add rows'
  it 'can show the board'
end
