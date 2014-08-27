require 'spec_helper'

module SpreeSignifyd
  describe CreateSignifydCase do
    describe "#perform" do
      let(:order) { create(:order_ready_to_ship) }
      let(:json) { JSON.parse(OrderSerializer.new(order).to_json) }

      it "calls Signifyd::Case#create with the correct params" do
        Signifyd::Case.should_receive(:create).with(json, SpreeSignifyd::Config[:api_key])
        CreateSignifydCase.perform(order.id)
      end
    end
  end
end