require 'spec_helper'

describe AkademGroup do
  AG_COLUMNS = {
    group_name:         :string,
    group_description:  :string,
    establ_date:        :date
  }

  AG_COLUMNS.each do |name, type|
    context ":" do 
      let(:name) { name }
      let(:type) { type }
      it_should_behave_like "have DB column of type"
    end
  end
end
