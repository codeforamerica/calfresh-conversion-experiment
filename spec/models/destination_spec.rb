require 'rails_helper'

describe Destination do
  describe "::for_county" do
    context "given a county that GetCalFresh DOES serve AND the randomizer comes up true" do
      before do
        allow_any_instance_of(Array).to receive(:sample).and_return(true)
      end

      it "returns getcalfresh" do
        expect(Destination.for_county("Placer")).to eq("getcalfresh")
      end
    end

    context "given a county that GetCalFresh DOES serve AND the randomizer comes up FALSE" do
      before do
        allow_any_instance_of(Array).to receive(:sample).and_return(false)
      end

      it "returns getcalfresh" do
        expect(Destination.for_county("Placer")).to eq("mbcw")
      end
    end

    context "given counties that GetCalFresh doesn't serve" do
      context "given a C4 county" do
        it "returns c4" do
          expect(Destination.for_county("Imperial")).to eq("c4")
        end
      end

      context "given an MBCW county" do
        it "returns mbcw" do
          expect(Destination.for_county("Sacramento")).to eq("mbcw")
        end
      end

      context "given LA" do
        it "returns leader" do
          expect(Destination.for_county("Los Angeles")).to eq("leader")
        end
      end
    end
  end
end
