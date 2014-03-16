require 'spec_helper'

describe Ecm::Staff::Configuration do
  describe '#person_class_name=' do
    it { should respond_to(:person_class_name) }

    it 'should raise an exception if the class is not defined' do
      expect {
        Ecm::Staff::Configuration.person_class_name = 'NonExistentClass'
      }.to raise_exception
    end # it

    it 'should not raise an exception if the class is defined' do
      ExistentClass = Class.new
      expect {
        Ecm::Staff::Configuration.person_class_name = 'ExistentClass'
      }.not_to raise_exception
      Object.send(:remove_const, :'ExistentClass')
    end # it
  end # describe '#person_class_name='
end # describe Ecm::Staff::Configuration
