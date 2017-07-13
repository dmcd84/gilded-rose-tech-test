require File.join(File.dirname(__FILE__), 'gilded_rose')

describe GildedRose do

  describe "#update_quality" do
    it "does not change the name" do
      items = [Item.new("foo", 0, 0)]
      GildedRose.new(items).update_quality()
      expect(items[0].name).to eq "foo"
    end
    it 'decrease the sellin date' do
      items = [Item.new("foo", 1, 0)]
      GildedRose.new(items).update_quality()
      expect(items[0].sell_in).to eq 0
    end
  end

  describe 'Aged Brie' do
    it 'increases the quality by 1 for Aged Brie whilst sellin > 0' do
      items = [Item.new("Aged Brie", 1, 0)]
      GildedRose.new(items).update_quality()
      expect(items[0].quality).to eq 1
    end

    it 'increases the quality by 2 for Aged Brie whilst sellin = 0' do
      items = [Item.new("Aged Brie", 0, 0)]
      GildedRose.new(items).update_quality()
      expect(items[0].quality).to eq 2
    end
  end

end
