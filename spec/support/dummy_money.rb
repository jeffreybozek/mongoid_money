class DummyMoney
  include Mongoid::Document

  field :description
  field :price, :type => Money

end