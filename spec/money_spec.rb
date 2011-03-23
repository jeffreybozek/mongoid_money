require 'spec_helper'

describe Money do
  
  describe "#==" do
    it 'should identify equal dollar values correctly' do
      (10.dollars == Money.new_from_dollars(10)).should eq true
      (10.dollars == 10.dollars).should eq true
    end
    
    it 'should identify equal monetary values correctly' do
      (10.dollars == Money.new_from_cents(10 * 100)).should eq true
      (10.dollars == 1000.cents).should eq true
    end
  end
  
  describe "#eql?" do
    it 'should identify equal dollar values correctly' do
      (10.dollars.eql?(Money.new_from_dollars(10))).should eq true
      (10.dollars.eql?(10.dollars)).should eq true
    end
    
    it 'should identify equal monetary values correctly' do
      (10.dollars.eql?(Money.new_from_cents(10 * 100))).should eq true
      (10.dollars.eql?(1000.cents)).should eq true
    end
  end
  
  describe "#<=>" do
    it 'should find that 10 dollars is greater than 5 dollars' do
      (10.dollars <=> 5.dollars).should eq 1
    end
    
    it 'should find that 5 dollars is less than 10 dollars' do
      (5.dollars <=> 10.dollars).should eq -1
    end
    
    it 'should raise an error when Money is compared to non-money' do
      expect{ 5.dollars <=> 500}.to raise_error(ArgumentError, "Comparison of Money with 500 failed")
    end
  end
  
  describe "#+" do
    it 'should add 10 dollars and 5 dollars and get 15 dollars' do
      (10.dollars + 5.dollars).should eq 15.dollars
    end
    
    it 'should add 10 dollars and 200 cents and get 12 dollars' do
      (10.dollars + 200.cents).should eq 12.dollars
    end
    
    it 'should add 50 cents and 200 cents and get 250 cents' do
      (50.cents + 200.cents).should eq 250.cents
    end
  end
  
  describe "#-" do
    it 'should subtract 5 dollars from 15 dollars and get 10 dollars' do
      (15.dollars - 5.dollars).should eq 10.dollars
    end
    
    it 'should subtract 200 cents from 12 dollars and get 10 dollars' do
      (12.dollars - 200.cents).should eq 10.dollars
    end
    
    it 'should subtract 50 cents from 200 cents and get 150 cents' do
      (200.cents - 50.cents).should eq 150.cents
    end
  end
  
  describe "#*" do
    it 'should multiply 10 dollars by 3 and get 30 dollars' do
      (10.dollars * 3).should eq 30.dollars
    end
    
    it 'should raise an error when Money is multiplied by money' do
      expect{ 5.dollars * 5.dollars}.to raise_error(ArgumentError, "Can't multiply a Money by a Money")
    end
  end
  
  describe "#/" do
    it 'should divide 10 dollars by 2 and get 5 dollars' do
      (10.dollars / 2).should eq 5.dollars
    end
    
    it 'should divide 10 dollars by 5 dollars and get 2' do
      (10.dollars / 5.dollars).should eq 2
    end
  end
  
  describe "#div" do
    it 'should divide 10 dollars by 2 and get 5 dollars' do
      (10.dollars.div(2)).should eq 5.dollars
    end
    
    it 'should divide 10 dollars by 5 dollars and get 2' do
      (10.dollars.div(5.dollars)).should eq 2
    end
  end
  
  describe "#abs" do
    it 'should return the abs value of -10 dollars as 10 dollars' do
      -10.dollars.abs.should eq 10.dollars
    end
    
    it 'should return the abs value of 10 dollars as 10 dollars' do
      10.dollars.abs.should eq 10.dollars
    end
  end
  
end
