require 'codemaster'

describe CodeMaster do
  let(:code) { %w{red green blue white} }
  subject { CodeMaster.new(code) }

  describe '#give_hints' do
    describe 'when the guess matches exactly' do
      let(:guess) do
        %w{red green blue white}
      end

      it 'can give hints' do
        hint = subject.give_hints(guess)

        expect(hint).to eq([
          :colored_peg,
          :colored_peg,
          :colored_peg,
          :colored_peg
        ])
      end
    end

    describe 'when the guess matches half in the right order' do
      let(:guess) do
        %w{red green white blue}
      end

      it 'can give hints' do
        hint = subject.give_hints(guess)

        expect(hint).to eq([
          :colored_peg,
          :colored_peg,
          :white_peg,
          :white_peg
        ])
      end
    end
  end
end

