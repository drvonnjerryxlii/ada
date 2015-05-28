require './d016-convert'

describe "Converting arabic numbers to roman numerals." do
  context "Romans didn't understand zero:" do
    it "returns an empty string for 0" do
      expect(convert(0)).to eq("")
    end
  end

  context "Numbers above zero:" do
    [
      ["I",     1],
      ["IV",    4],
      ["V",     5],
      ["VI",    6],
      ["IX",    9],
      ["X",     10],
      ["XI",    11],
      ["XIV",   14],
      ["XV",    15],
      ["XVI",   16],
      ["XIX",   19],
      ["XX",    20],
      ["XL",    40],
      ["XLIX",  49],
      ["L",     50],
      ["XC",    90],
      ["XCIX",  99],
      ["C",     100],
      ["CXL",   140],
      ["CXC",   190],
      ["CD",    400],
      ["CDXC",  490],
      ["D",     500],
      ["DIX",   509],
      ["DXC",   590],
      ["CM",    900],
      ["M",     1000]
    ].each do |roman, arabic|
      it "returns #{ roman } for #{ arabic }" do
        expect(convert(arabic)).to eq(roman)
      end
    end
  end
end
