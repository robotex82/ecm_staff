require "spec_helper"

describe "ecm/staff/organisations/index.html.erb" do
  it "displays all the organisations" do
    assign(:organisations, [
      stub_model(Ecm::Staff::Organisation, :name => 'Art der Gestaltung'),
      stub_model(Ecm::Staff::Organisation, :name => 'IT Services Frankfurt')
    ])

    render

    rendered.should include("Art der Gestaltung")
    rendered.should include("IT Services Frankfurt")
  end
end
