module HomeHelper
  def purchase_true?
    Purchase.find(1).show
  end
end
