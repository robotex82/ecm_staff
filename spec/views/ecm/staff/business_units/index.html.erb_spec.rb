require "spec_helper"

describe "ecm/staff/business_units/index.html.erb" do
  it "displays all the business units" do
    assign(:business_units, [
      stub_model(Ecm::Staff::BusinessUnit, :name => 'Businessportale - Softwareentwicklung'),
      stub_model(Ecm::Staff::BusinessUnit, :name => 'Businessportale - Business Development')
    ])

    render

    rendered.should include('Businessportale - Softwareentwicklung')
    rendered.should include('Businessportale - Business Development')
  end
end
