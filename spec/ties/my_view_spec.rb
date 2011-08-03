require File.dirname(__FILE__) + '/../spec_helper'

describe TIES::MyView::Reimbursements do
  it "should be reimbursements object" do
    ties.reimbursements.should be_a(TIES::MyView::Reimbursements)
  end
  it "retrieve reimbursements" do
    ties.reimbursements.get
  end
end