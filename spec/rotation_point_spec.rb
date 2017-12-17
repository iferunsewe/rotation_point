require 'spec_helper'

describe RotationPoint do

	subject(:rotation_point){ described_class.new(words) }
	let(:words){
		[
			'ptolemaic',
            'retrograde',
            'supplant',
            'undulate',
            'xenoepist',
            'asymptote',  # <-- rotates here!
            'babka',
            'banoffee',
            'engender',
            'karpatka',
            'othellolagkage',
        ]
	} 

    context 'words are not in an array' do
        let(:words) { { foo: true, bar: false } }
        it 'raises an error' do
            expect{rotation_point}.to raise_error("Words must be in an array")
        end
    end    
	

    context 'words are are not all strings' do 
        let(:words) { [ 'foo', 'bar', 1] }
        it 'raises an error' do
            expect{rotation_point}.to raise_error("All words must be strings")
        end
    end    

    context 'words are all strings and it is an array' do
        context '#is' do
            it "returns an integer" do 
                expect(rotation_point.is).to be_a_kind_of(Integer)
            end
        end    
        

        context '#build_word_index_hash' do
            it 'returns the correct index points for a word' do
                expect(rotation_point.send(:build_word_index_hash)['ptolemaic']).to be 0
            end
        end
    end    
        
end
