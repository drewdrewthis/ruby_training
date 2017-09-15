require 'mastermind'

xdescribe Mastermind do
  let!(:game) { Mastermind.new }

  it 'can start the game' do
    expect(CodeMaster).to receive(:new)
  end
end
